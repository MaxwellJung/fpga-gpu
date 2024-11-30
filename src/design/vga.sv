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
    parameter CHANNEL_BITS = 2
) (
    input logic clk,
    input logic resetn,

    // 3 color channels (RGB)
    input wire [3*CHANNEL_BITS-1:0] color,

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
        .resetn(!(!resetn || h_counter_end)),
        .enable(1'b1),
        .count(h_pxl_count)
    );

    localparam V_WHOLE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL;
    wire v_counter_end = v_pxl_count >= V_WHOLE_FRAME_PXL - 1;

    counter #(
        .NUM_BITS(V_NUM_BITS)
        ) v_pxl_counter (
        .clk(clk),
        .resetn(!(!resetn || (h_counter_end && v_counter_end))),
        .enable(h_counter_end),
        .count(v_pxl_count)
    );

    wire h_sync_i;
    wire v_sync_i;

    assign h_sync_i = !(((H_VIS_AREA_PXL + H_FRONT_PORCH_PXL) <= h_pxl_count) 
                  && (h_pxl_count < (H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL)));
    assign v_sync_i = !(((V_VIS_AREA_PXL + V_FRONT_PORCH_PXL) <= v_pxl_count) 
                  && (v_pxl_count < (V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL)));

    wire h_visible = h_pxl_count < H_VIS_AREA_PXL;
    wire v_visible = v_pxl_count < V_VIS_AREA_PXL;
    wire pxl_visible = h_visible && v_visible;

    wire [3:0] red_i;
    wire [3:0] green_i;
    wire [3:0] blue_i;

    assign {red_i, green_i, blue_i} = pxl_visible ? {color[3*CHANNEL_BITS-1:2*CHANNEL_BITS], {(4-CHANNEL_BITS){1'b0}}, 
                                                     color[2*CHANNEL_BITS-1:1*CHANNEL_BITS], {(4-CHANNEL_BITS){1'b0}}, 
                                                     color[1*CHANNEL_BITS-1:0], {(4-CHANNEL_BITS){1'b0}}}
                                                  : 12'b0;

    latency #(
        .LENGTH(FRAME_BUFFER_READ_LATENCY),
        .WIDTH(1)
    ) delay_h_sync (
        .clk(clk),
        .rst(!resetn),

        .in(h_sync_i),
        .out(h_sync)
    );

    latency #(
        .LENGTH(FRAME_BUFFER_READ_LATENCY),
        .WIDTH(1)
    ) delay_v_sync (
        .clk(clk),
        .rst(!resetn),

        .in(v_sync_i),
        .out(v_sync)
    );

    latency #(
        .LENGTH(FRAME_BUFFER_READ_LATENCY),
        .WIDTH(12)
    ) delay_rgb (
        .clk(clk),
        .rst(!resetn),

        .in({red_i, green_i, blue_i}),
        .out({red, green, blue})
    );

endmodule
