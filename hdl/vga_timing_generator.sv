module VgaTimingGenerator #(
    parameter H_VIS_AREA_PXL = 800,
    parameter H_FRONT_PORCH_PXL = 40,
    parameter H_SYNC_PULSE_PXL = 128,
    parameter H_BACK_PORCH_PXL = 88,

    parameter V_VIS_AREA_PXL =  600,
    parameter V_FRONT_PORCH_PXL =  1,
    parameter V_SYNC_PULSE_PXL =  4,
    parameter V_BACK_PORCH_PXL =  23,

    parameter SYNC_LATENCY = 1, // latency between video controller requesting pixel to palette outputting pixel

    localparam H_WHOLE_LINE_PXL = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL,
    localparam V_WHOLE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL
) (
    input logic clk,
    input logic reset,

    output logic [$clog2(H_WHOLE_LINE_PXL)-1:0] h_pxl_count,
    output logic [$clog2(V_WHOLE_FRAME_PXL)-1:0] v_pxl_count,

    output logic h_sync,
    output logic v_sync,

    output logic h_visible,
    output logic v_visible
);
    logic h_counter_end, v_counter_end;
    assign h_counter_end = h_pxl_count >= H_WHOLE_LINE_PXL - 1;
    assign v_counter_end = v_pxl_count >= V_WHOLE_FRAME_PXL - 1;

    Counter #(
        .NUM_BITS($clog2(H_WHOLE_LINE_PXL))
        ) h_pxl_counter (
        .clk(clk),
        .reset(reset || h_counter_end),
        .enable(1'b1),
        .count(h_pxl_count)
    );

    Counter #(
        .NUM_BITS($clog2(V_WHOLE_FRAME_PXL))
        ) v_pxl_counter (
        .clk(clk),
        .reset(reset || (h_counter_end && v_counter_end)),
        .enable(h_counter_end),
        .count(v_pxl_count)
    );
    
    logic h_sync_comb, v_sync_comb, h_visible_comb, v_visible_comb;
    assign h_sync_comb = !(((H_VIS_AREA_PXL + H_FRONT_PORCH_PXL) <= h_pxl_count) 
                   && (h_pxl_count < (H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL)));
    assign v_sync_comb = !(((V_VIS_AREA_PXL + V_FRONT_PORCH_PXL) <= v_pxl_count) 
                   && (v_pxl_count < (V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL)));
    assign h_visible_comb = h_pxl_count < H_VIS_AREA_PXL;
    assign v_visible_comb = v_pxl_count < V_VIS_AREA_PXL;

    Latency #(
        .LENGTH(SYNC_LATENCY),
        .WIDTH(4)
    ) delay_sync (
        .clk(clk),
        .reset(reset),

        .in({h_sync_comb, v_sync_comb, h_visible_comb, v_visible_comb}),
        .out({h_sync, v_sync, h_visible, v_visible})
    );

endmodule
