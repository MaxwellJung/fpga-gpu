module gpu_top #(
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

    parameter DOWNSCALE_FACTOR = 2,

    parameter BUFFER_ADDR_BITS = 17, // ceil(log2(H_VIS_AREA_PXL/DOWNSCALE_FACTOR * V_VIS_AREA_PXL/DOWNSCALE_FACTOR)),
    parameter FRAME_BUFFER_READ_LATENCY = 1,
    parameter CHANNEL_BITS = 2
) (
    input  wire        vga_clk,
    input  wire        resetn,

    output wire [31:0] buffer_addr,
    output wire [31:0] buffer_din,
    input  wire [31:0] buffer_dout,
    output wire        buffer_en,
    output wire        buffer_rst,
    output wire [3:0]  buffer_we,

    output wire [3:0]  VGA_R,
    output wire [3:0]  VGA_G,
    output wire [3:0]  VGA_B,

    output wire        VGA_HS,
    output wire        VGA_VS
);
    wire [H_NUM_BITS-1:0] vga_h_pxl_index;
    wire [V_NUM_BITS-1:0] vga_v_pxl_index;
    wire [BUFFER_ADDR_BITS-1:0] vga_pixel_index = (vga_v_pxl_index * H_VIS_AREA_PXL) + vga_h_pxl_index;

    wire [H_NUM_BITS-DOWNSCALE_FACTOR:0] h_pxl_index = (vga_h_pxl_index >> (DOWNSCALE_FACTOR - 1));
    wire [V_NUM_BITS-DOWNSCALE_FACTOR:0] v_pxl_index = (vga_v_pxl_index >> (DOWNSCALE_FACTOR - 1));
    wire [BUFFER_ADDR_BITS-1:0] pixel_index = (v_pxl_index * (H_VIS_AREA_PXL >> (DOWNSCALE_FACTOR - 1))) + h_pxl_index;

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

        .FRAME_BUFFER_READ_LATENCY(FRAME_BUFFER_READ_LATENCY),
        .CHANNEL_BITS(CHANNEL_BITS)
    ) vga_0 (
        .clk(vga_clk),
        .resetn(resetn),

        .early_h_pxl_count(vga_h_pxl_index),
        .early_v_pxl_count(vga_v_pxl_index),

        .color(pixel_color),

        .red(VGA_R),
        .green(VGA_G),
        .blue(VGA_B),

        .h_sync(VGA_HS),
        .v_sync(VGA_VS)
    );
    
    assign buffer_addr = pixel_index;
    assign buffer_din = 32'b0;
    wire [1:0] byte_index = buffer_addr[1:0];
    wire [3*CHANNEL_BITS-1:0] pixel_color = buffer_dout[8*byte_index +: 8];
    assign buffer_en = 1'b1;
    assign buffer_rst = 1'b0;
    assign buffer_we = 4'b0;

endmodule
