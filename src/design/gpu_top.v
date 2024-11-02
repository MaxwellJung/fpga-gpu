module gpu_top #(
    parameter INIT_FILE = "data/ram_init.mem",

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
    input wire clk,
    input wire resetn,

    output wire [CHANNEL_BITS-1:0] VGA_R,
    output wire [CHANNEL_BITS-1:0] VGA_G,
    output wire [CHANNEL_BITS-1:0] VGA_B,

    output wire VGA_HS,
    output wire VGA_VS
);
    wire [H_NUM_BITS-1:0] h_pxl_index;
    wire [V_NUM_BITS-1:0] v_pxl_index;
    wire [ADDR_BITS-1:0] pixel_index = h_pxl_index + v_pxl_index * H_VIS_AREA_PXL;
    wire [CHANNEL_BITS-1:0] color_r;
    wire [CHANNEL_BITS-1:0] color_g;
    wire [CHANNEL_BITS-1:0] color_b;
    wire [CHANNEL_BITS-1:0] color_a;

    vga #(
        .H_VIS_AREA_PXL(H_VIS_AREA_PXL),
        .H_FRONT_PORCH_PXL(H_FRONT_PORCH_PXL),
        .H_SYNC_PULSE_PXL(H_SYNC_PULSE_PXL),
        .H_BACK_PORCH_PXL(H_BACK_PORCH_PXL),
        .H_NUM_BITS(H_NUM_BITS),

        .V_VIS_AREA_PXL(V_VIS_AREA_PXL),
        .V_FRONT_PORCH_PXL(V_FRONT_PORCH_PXL),
        .V_SYNC_PULSE_PXL(V_SYNC_PULSE_PXL),
        .V_BACK_PORCH_PXL(V_BACK_PORCH_PXL),
        .V_NUM_BITS(V_NUM_BITS),

        .CHANNEL_BITS(CHANNEL_BITS)
    ) vga_0 (
        .clk(clk),
        .resetn(resetn),

        .red(VGA_R),
        .green(VGA_G),
        .blue(VGA_B),

        .h_sync(VGA_HS),
        .v_sync(VGA_VS),

        .h_pxl_count(h_pxl_index),
        .v_pxl_count(v_pxl_index),

        .color({pixel_color[7:6], 2'b00, pixel_color[5:4], 2'b00, pixel_color[3:2], 2'b00, pixel_color[1:0], 2'b00})
    );

    localparam WIDTH = 8;
    localparam DEPTH = H_VIS_AREA_PXL*V_VIS_AREA_PXL;
    localparam ADDR_BITS = 19; // ceil(log2(DEPTH))

    wire [WIDTH-1:0] pixel_color;

    ram #(
        .INIT_FILE(INIT_FILE),
        .WIDTH(WIDTH),
        .DEPTH(DEPTH),
        .ADDR_BITS(ADDR_BITS)
    ) ram_0 (
        .clk(clk),
        .we(1'b0),

        .addr(pixel_index),
        .dout(pixel_color)
    );

endmodule
