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
    input logic clk_i,
    input logic reset_i,

    output logic [$clog2(H_WHOLE_LINE_PXL)-1:0] h_pxl_count_o,
    output logic [$clog2(V_WHOLE_FRAME_PXL)-1:0] v_pxl_count_o,

    output logic h_sync_o,
    output logic v_sync_o,

    output logic h_visible_o,
    output logic v_visible_o
);
    logic h_counter_end, v_counter_end;
    assign h_counter_end = h_pxl_count_o >= H_WHOLE_LINE_PXL - 1;
    assign v_counter_end = v_pxl_count_o >= V_WHOLE_FRAME_PXL - 1;

    Counter #(
        .NUM_BITS($clog2(H_WHOLE_LINE_PXL))
        ) h_pxl_counter (
        .clk_i(clk_i),
        .reset_i(reset_i || h_counter_end),
        .enable_i(1'b1),
        .count_o(h_pxl_count_o)
    );

    Counter #(
        .NUM_BITS($clog2(V_WHOLE_FRAME_PXL))
        ) v_pxl_counter (
        .clk_i(clk_i),
        .reset_i(reset_i || (h_counter_end && v_counter_end)),
        .enable_i(h_counter_end),
        .count_o(v_pxl_count_o)
    );
    
    logic h_sync, v_sync, h_visible, v_visible;
    assign h_sync = !(((H_VIS_AREA_PXL + H_FRONT_PORCH_PXL) <= h_pxl_count_o) 
                   && (h_pxl_count_o < (H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL)));
    assign v_sync = !(((V_VIS_AREA_PXL + V_FRONT_PORCH_PXL) <= v_pxl_count_o) 
                   && (v_pxl_count_o < (V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL)));
    assign h_visible = h_pxl_count_o < H_VIS_AREA_PXL;
    assign v_visible = v_pxl_count_o < V_VIS_AREA_PXL;

    Latency #(
        .LENGTH(SYNC_LATENCY),
        .WIDTH(4)
    ) delay_sync (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .data_i({h_sync, v_sync, h_visible, v_visible}),
        .data_o({h_sync_o, v_sync_o, h_visible_o, v_visible_o})
    );

endmodule
