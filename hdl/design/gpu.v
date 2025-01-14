module gpu #(
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

    parameter BRAM_ADDR_BITS = 32,
    parameter BRAM_DATA_BITS = 32
) (
    input wire gpu_clk_i,
    input wire reset_i,

    output wire bram_clk_o,
    output wire bram_rst_o,
    output wire bram_en_o,
    output wire [BRAM_ADDR_BITS-1:0] bram_addr_o,
    input wire [BRAM_DATA_BITS-1:0] bram_dout_i,
    output wire [BRAM_DATA_BITS-1:0] bram_din_o,
    output wire [BRAM_DATA_BITS/8-1:0] bram_we_o,

    input wire vga_clk_i,

    output wire [3:0]  VGA_R_o,
    output wire [3:0]  VGA_G_o,
    output wire [3:0]  VGA_B_o,

    output wire        VGA_HS_o,
    output wire        VGA_VS_o
);
    wire [H_NUM_BITS-1:0] vga_h_pxl_index;
    wire [V_NUM_BITS-1:0] vga_v_pxl_index;
    wire [H_NUM_BITS-DOWNSCALE_FACTOR:0] h_pxl_index = (vga_h_pxl_index >> (DOWNSCALE_FACTOR - 1));
    wire [V_NUM_BITS-DOWNSCALE_FACTOR:0] v_pxl_index = (vga_v_pxl_index >> (DOWNSCALE_FACTOR - 1));
    wire [BRAM_ADDR_BITS-1:0] pixel_index = (v_pxl_index * (H_VIS_AREA_PXL >> (DOWNSCALE_FACTOR - 1))) + h_pxl_index;
    wire [11:0] pixel_color;

    VgaController #(
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

        .FRAME_BUFFER_READ_LATENCY(2)
    ) vga (
        .pixel_clk_i(vga_clk_i),
        .reset_i(reset_i),

        .red_i(pixel_color[11:8]),
        .green_i(pixel_color[7:4]),
        .blue_i(pixel_color[3:0]),

        .h_pxl_count_o(vga_h_pxl_index),
        .v_pxl_count_o(vga_v_pxl_index),

        .red_o(VGA_R_o),
        .green_o(VGA_G_o),
        .blue_o(VGA_B_o),

        .h_sync_o(VGA_HS_o),
        .v_sync_o(VGA_VS_o)
    );

    Palette color_palette(
        .clk_i(gpu_clk_i),
        .reset_i(reset_i),

        .pixel_index_i(pixel_index),
        .pixel_color_o(pixel_color),

        .bram_clk_o(bram_clk_o),
        .bram_rst_o(bram_rst_o),
        .bram_en_o(bram_en_o),
        .bram_addr_o(bram_addr_o),
        .bram_dout_i(bram_dout_i),
        .bram_din_o(bram_din_o),
        .bram_we_o(bram_we_o)
    );

endmodule
