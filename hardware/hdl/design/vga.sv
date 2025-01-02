module vga #(
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

    parameter FRAME_BUFFER_READ_LATENCY = 1,
    parameter RED_CHANNEL_WIDTH = 3,
    parameter GREEN_CHANNEL_WIDTH = 3,
    parameter BLUE_CHANNEL_WIDTH = 2
) (
    input logic clk,
    input logic reset,

    // 3 color channels (RGB)
    input wire [(RED_CHANNEL_WIDTH + GREEN_CHANNEL_WIDTH + BLUE_CHANNEL_WIDTH)-1:0] color,

    // custom pins
    output wire [H_NUM_BITS-1:0] h_pxl_count,
    output wire [V_NUM_BITS-1:0] v_pxl_count,

    // VGA pins
    output wire [3:0] red,
    output wire [3:0] green,
    output wire [3:0] blue,

    output wire h_sync,
    output wire v_sync
);
    localparam H_WHOLE_LINE_PXL = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL;
    wire h_counter_end = h_pxl_count >= H_WHOLE_LINE_PXL - 1;

    counter #(
        .NUM_BITS(H_NUM_BITS)
        ) h_pxl_counter (
        .clk(clk),
        .reset(reset || h_counter_end),
        .enable(1'b1),
        .count(h_pxl_count)
    );

    localparam V_WHOLE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL;
    wire v_counter_end = v_pxl_count >= V_WHOLE_FRAME_PXL - 1;

    counter #(
        .NUM_BITS(V_NUM_BITS)
        ) v_pxl_counter (
        .clk(clk),
        .reset(reset || (h_counter_end && v_counter_end)),
        .enable(h_counter_end),
        .count(v_pxl_count)
    );

    wire [H_NUM_BITS-1:0] delayed_h_pxl_count;
    wire [V_NUM_BITS-1:0] delayed_v_pxl_count;
    latency #(
        .LENGTH(FRAME_BUFFER_READ_LATENCY),
        .WIDTH(H_NUM_BITS + V_NUM_BITS)
    ) delay_pxl_count (
        .clk(clk),
        .rst(reset),

        .in({h_pxl_count, v_pxl_count}),
        .out({delayed_h_pxl_count, delayed_v_pxl_count})
    );

    assign h_sync = !(((H_VIS_AREA_PXL + H_FRONT_PORCH_PXL) <= delayed_h_pxl_count) 
                  && (delayed_h_pxl_count < (H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL)));
    assign v_sync = !(((V_VIS_AREA_PXL + V_FRONT_PORCH_PXL) <= delayed_v_pxl_count) 
                  && (delayed_v_pxl_count < (V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL)));

    wire h_visible = delayed_h_pxl_count < H_VIS_AREA_PXL;
    wire v_visible = delayed_v_pxl_count < V_VIS_AREA_PXL;
    wire pxl_visible = h_visible && v_visible;

    assign {red, green, blue} = pxl_visible ? {color[BLUE_CHANNEL_WIDTH + GREEN_CHANNEL_WIDTH +: RED_CHANNEL_WIDTH], {(4-RED_CHANNEL_WIDTH){1'b0}}, 
                                               color[BLUE_CHANNEL_WIDTH +: GREEN_CHANNEL_WIDTH], {(4-GREEN_CHANNEL_WIDTH){1'b0}}, 
                                               color[0 +: BLUE_CHANNEL_WIDTH], {(4-BLUE_CHANNEL_WIDTH){1'b0}}}
                                            : 12'b0;

endmodule
