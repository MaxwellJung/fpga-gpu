module VgaTimingGenerator #(
    parameter H_VIS_AREA_PXL = 800,
    parameter H_FRONT_PORCH_PXL = 40,
    parameter H_SYNC_PULSE_PXL = 128,
    parameter H_BACK_PORCH_PXL = 88,

    parameter V_VIS_AREA_PXL =  600,
    parameter V_FRONT_PORCH_PXL =  1,
    parameter V_SYNC_PULSE_PXL =  4,
    parameter V_BACK_PORCH_PXL =  23,

    parameter SYNC_LATENCY = 2, // latency between pixel visibility and actual color output

    localparam H_WHOLE_LINE_PXL = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL,
    localparam V_WHOLE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL
) (
    input logic clk_i,
    input logic reset_i,

    output logic h_sync_o,
    output logic v_sync_o,

    output logic h_visible_o,
    output logic v_visible_o,

    output logic frame_end_o
);
    logic [$clog2(H_WHOLE_LINE_PXL)-1:0] h_pxl_count;
    logic [$clog2(V_WHOLE_FRAME_PXL)-1:0] v_pxl_count;
    logic h_counter_end, v_counter_end;
    assign h_counter_end = h_pxl_count >= H_WHOLE_LINE_PXL - 1;
    assign v_counter_end = v_pxl_count >= V_WHOLE_FRAME_PXL - 1;

    Counter #(
        .NUM_BITS($clog2(H_WHOLE_LINE_PXL))
        ) h_pxl_counter (
        .clk_i(clk_i),
        .reset_i(reset_i || h_counter_end),
        .enable_i(1'b1),
        .count_o(h_pxl_count)
    );

    Counter #(
        .NUM_BITS($clog2(V_WHOLE_FRAME_PXL))
        ) v_pxl_counter (
        .clk_i(clk_i),
        .reset_i(reset_i || (h_counter_end && v_counter_end)),
        .enable_i(h_counter_end),
        .count_o(v_pxl_count)
    );
    
    logic h_sync, v_sync;
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            h_sync <= 0;
            v_sync <= 0;
            h_visible_o <= 0;
            v_visible_o <= 0;
            frame_end_o <= 0;
        end else begin
            h_sync <= !(((H_VIS_AREA_PXL + H_FRONT_PORCH_PXL) <= h_pxl_count) 
                  && (h_pxl_count < (H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL)));
            v_sync <= !(((V_VIS_AREA_PXL + V_FRONT_PORCH_PXL) <= v_pxl_count) 
                  && (v_pxl_count < (V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL)));
            h_visible_o <= h_pxl_count < H_VIS_AREA_PXL;
            v_visible_o <= v_pxl_count < V_VIS_AREA_PXL;
            frame_end_o <= (h_pxl_count == H_VIS_AREA_PXL) && (v_pxl_count == V_VIS_AREA_PXL - 1);
        end
    end

    Latency #(
        .LENGTH(SYNC_LATENCY),
        .WIDTH(2)
    ) delay_sync (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .data_i({h_sync, v_sync}),
        .data_o({h_sync_o, v_sync_o})
    );

endmodule
