module VgaController #(
    parameter H_VIS_AREA_PXL = 800,
    parameter H_FRONT_PORCH_PXL = 40,
    parameter H_SYNC_PULSE_PXL = 128,
    parameter H_BACK_PORCH_PXL = 88,
    parameter H_NUM_BITS = 11, // ceil(log2(H_WHOLE_LINE_PXL))

    parameter V_VIS_AREA_PXL =  600,
    parameter V_FRONT_PORCH_PXL =  1,
    parameter V_SYNC_PULSE_PXL =  4,
    parameter V_BACK_PORCH_PXL =  23,
    parameter V_NUM_BITS = 10, // ceil(log2(V_WHOLE_FRAME_PXL))

    parameter FRAME_BUFFER_READ_LATENCY = 2
) (
    input logic pixel_clk_i,
    input logic reset_i,

    // pixel input
    input wire [3:0] red_i,
    input wire [3:0] green_i,
    input wire [3:0] blue_i,

    // custom pins
    output wire [H_NUM_BITS-1:0] h_pxl_count_o,
    output wire [V_NUM_BITS-1:0] v_pxl_count_o,

    // pixel output
    output wire [3:0] red_o,
    output wire [3:0] green_o,
    output wire [3:0] blue_o,

    output wire h_sync_o,
    output wire v_sync_o
);
    localparam H_WHOLE_LINE_PXL = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL;
    wire h_counter_end = h_pxl_count_o >= H_WHOLE_LINE_PXL - 1;

    Counter #(
        .NUM_BITS(H_NUM_BITS)
        ) h_pxl_counter (
        .clk_i(pixel_clk_i),
        .reset_i(reset_i || h_counter_end),
        .enable_i(1'b1),
        .count_o(h_pxl_count_o)
    );

    localparam V_WHOLE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL;
    wire v_counter_end = v_pxl_count_o >= V_WHOLE_FRAME_PXL - 1;

    Counter #(
        .NUM_BITS(V_NUM_BITS)
        ) v_pxl_counter (
        .clk_i(pixel_clk_i),
        .reset_i(reset_i || (h_counter_end && v_counter_end)),
        .enable_i(h_counter_end),
        .count_o(v_pxl_count_o)
    );

    wire [H_NUM_BITS-1:0] delayed_h_pxl_count;
    wire [V_NUM_BITS-1:0] delayed_v_pxl_count;
    Latency #(
        .LENGTH(FRAME_BUFFER_READ_LATENCY),
        .WIDTH(H_NUM_BITS + V_NUM_BITS)
    ) delay_pxl_count (
        .clk_i(pixel_clk_i),
        .rst_i(reset_i),

        .data_i({h_pxl_count_o, v_pxl_count_o}),
        .data_o({delayed_h_pxl_count, delayed_v_pxl_count})
    );

    assign h_sync_o = !(((H_VIS_AREA_PXL + H_FRONT_PORCH_PXL) <= delayed_h_pxl_count) 
                  && (delayed_h_pxl_count < (H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL)));
    assign v_sync_o = !(((V_VIS_AREA_PXL + V_FRONT_PORCH_PXL) <= delayed_v_pxl_count) 
                  && (delayed_v_pxl_count < (V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL)));

    wire h_visible = delayed_h_pxl_count < H_VIS_AREA_PXL;
    wire v_visible = delayed_v_pxl_count < V_VIS_AREA_PXL;
    wire pxl_visible = h_visible && v_visible;

    wire [3:0] red, green, blue;
    Latency #(
        .LENGTH(2),
        .WIDTH(12)
    ) double_flop_pxl_color (
        .clk_i(pixel_clk_i),
        .rst_i(reset_i),

        .data_i({red_i, green_i, blue_i}),
        .data_o({red, green, blue})
    );

    assign {red_o, green_o, blue_o} = pxl_visible ? {red, green, blue} : 12'b0;

endmodule
