module vga_gpu #(
    parameter H_VIS_AREA_PXL = 800,
    parameter H_FRONT_PORCH_PXL = 40,
    parameter H_SYNC_PULSE_PXL = 128,
    parameter H_BACK_PORCH_PXL = 88,
    parameter H_NUM_BITS = 11, // ceil(log2(H_WHOLE_LINE_PXL))

    parameter V_VIS_AREA_PXL =  600,
    parameter V_FRONT_PORCH_PXL =  1,
    parameter V_SYNC_PULSE_PXL =  4,
    parameter V_BACK_PORCH_PXL =  23,
    parameter V_NUM_BITS = 10, // ceil(log2(V_WHOE_FRAME_PXL))

    parameter CHANNEL_BITS = 4,
    parameter CHANNEL_COUNT = 4
) (
    input logic clk,
    input logic resetn,

    // VGA pins
    output wire [CHANNEL_BITS-1:0] red,
    output wire [CHANNEL_BITS-1:0] green,
    output wire [CHANNEL_BITS-1:0] blue,

    output wire h_sync,
    output wire v_sync,

    // custom pins
    output wire [H_NUM_BITS-1:0] h_pxl_count,
    output wire [V_NUM_BITS-1:0] v_pxl_count,

    input wire [CHANNEL_COUNT*CHANNEL_BITS-1:0] color
);
    localparam H_WHOLE_LINE_PXL = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL;
    localparam V_WHOE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL;

    wire h_counter_end = h_pxl_count >= H_WHOLE_LINE_PXL - 1;
    wire v_counter_end = v_pxl_count >= V_WHOE_FRAME_PXL - 1;
    wire h_visible = h_pxl_count < H_VIS_AREA_PXL;
    wire v_visible = v_pxl_count < V_VIS_AREA_PXL;
    wire pxl_visible = h_visible && v_visible;

    counter #(
        .NUM_BITS(H_NUM_BITS)
        ) h_pxl_counter (
        .clk(clk),
        .resetn(!(!resetn || h_counter_end)),
        .enable(1'b1),
        .count(h_pxl_count)
    );

    counter #(
        .NUM_BITS(V_NUM_BITS)
        ) v_pxl_counter (
        .clk(clk),
        .resetn(!(!resetn || (h_counter_end && v_counter_end))),
        .enable(h_counter_end),
        .count(v_pxl_count)
    );

    assign h_sync = !(((H_VIS_AREA_PXL + H_FRONT_PORCH_PXL) <= h_pxl_count) 
                  && (h_pxl_count < (H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL)));
    assign v_sync = !(((V_VIS_AREA_PXL + V_FRONT_PORCH_PXL) <= v_pxl_count) 
                  && (v_pxl_count < (V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL)));

    assign {red, green, blue} = pxl_visible ? color[CHANNEL_COUNT*CHANNEL_BITS-1:4] : 12'b0;
    // assign {red, green, blue} = pxl_visible ? {3{v_pxl_count[3:0]}} : 12'b0;
    // assign {red, green, blue} = pxl_visible ? v_pxl_count : 12'b0;

endmodule
