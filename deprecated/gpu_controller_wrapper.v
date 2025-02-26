module GpuControllerWrapper #(
    parameter H_VIS_AREA_PXL = 800,
    parameter H_FRONT_PORCH_PXL = 40,
    parameter H_SYNC_PULSE_PXL = 128,
    parameter H_BACK_PORCH_PXL = 88,
    localparam H_WHOLE_LINE_PXL = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL,

    parameter V_VIS_AREA_PXL =  600,
    parameter V_FRONT_PORCH_PXL =  1,
    parameter V_SYNC_PULSE_PXL =  4,
    parameter V_BACK_PORCH_PXL =  23,
    localparam V_WHOLE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL,

    parameter SYNC_LATENCY = 2, // 1 latency from FIFO read + 1 latency from palette read

    parameter DOWNSCALE_FACTOR = 2,

    parameter PALETTE_LENGTH = 256,
    parameter COLOR_BITS = 12,
    
    parameter BRAM_ADDR_BITS = 32,
    parameter BRAM_DATA_BITS = 32
) (
    input wire gpu_clk_i,
    input wire vga_clk_i,
    input wire reset_i,

    input wire [31:0] instruction_i,

    output wire bram_clk_o,
    output wire bram_rst_o,
    output wire bram_en_o,
    output wire [BRAM_ADDR_BITS-1:0] bram_addr_o,
    input wire [BRAM_DATA_BITS-1:0] bram_dout_i,
    output wire [BRAM_DATA_BITS-1:0] bram_din_o,
    output wire [BRAM_DATA_BITS/8-1:0] bram_we_o,

    output wire pxl_fifo_reset_o,

    output wire pxl_fifo_wr_clk_o,
    output wire pxl_fifo_wr_en_o,
    output wire [$clog2(PALETTE_LENGTH)-1:0] pxl_fifo_write_data_o,
    input wire pxl_fifo_prog_full_i,
    input wire pxl_fifo_almost_full_i,
    input wire pxl_fifo_full_i,

    output wire pxl_fifo_rd_clk_o,
    output wire pxl_fifo_rd_en_o,
    input wire [$clog2(PALETTE_LENGTH)-1:0] pxl_fifo_read_data_i,
    input wire pxl_fifo_prog_empty_i,
    input wire pxl_fifo_almost_empty_i,
    input wire pxl_fifo_empty_i,

    output wire [COLOR_BITS-1:0] VGA_RGB,
    output wire VGA_HS,
    output wire VGA_VS
);

    GpuController #(
        .H_VIS_AREA_PXL(H_VIS_AREA_PXL),
        .H_FRONT_PORCH_PXL(H_FRONT_PORCH_PXL),
        .H_SYNC_PULSE_PXL(H_SYNC_PULSE_PXL),
        .H_BACK_PORCH_PXL(H_BACK_PORCH_PXL),

        .V_VIS_AREA_PXL(V_VIS_AREA_PXL),
        .V_FRONT_PORCH_PXL(V_FRONT_PORCH_PXL),
        .V_SYNC_PULSE_PXL(V_SYNC_PULSE_PXL),
        .V_BACK_PORCH_PXL(V_BACK_PORCH_PXL),

        .SYNC_LATENCY(SYNC_LATENCY),

        .DOWNSCALE_FACTOR(DOWNSCALE_FACTOR),

        .PALETTE_LENGTH(PALETTE_LENGTH),
        .COLOR_BITS(COLOR_BITS),

        .BRAM_ADDR_BITS(BRAM_ADDR_BITS),
        .BRAM_DATA_BITS(BRAM_DATA_BITS)
    ) gpu_controller_0 (
        .gpu_clk_i(gpu_clk_i),
        .vga_clk_i(vga_clk_i),
        .reset_i(reset_i),

        .instruction_i(instruction_i),

        .bram_clk_o(bram_clk_o),
        .bram_rst_o(bram_rst_o),
        .bram_en_o(bram_en_o),
        .bram_addr_o(bram_addr_o),
        .bram_dout_i(bram_dout_i),
        .bram_din_o(bram_din_o),
        .bram_we_o(bram_we_o),

        .pxl_fifo_reset_o(pxl_fifo_reset_o),

        .pxl_fifo_wr_clk_o(pxl_fifo_wr_clk_o),
        .pxl_fifo_wr_en_o(pxl_fifo_wr_en_o),
        .pxl_fifo_write_data_o(pxl_fifo_write_data_o),
        .pxl_fifo_prog_full_i(pxl_fifo_prog_full_i),
        .pxl_fifo_almost_full_i(pxl_fifo_almost_full_i),
        .pxl_fifo_full_i(pxl_fifo_full_i),

        .pxl_fifo_rd_clk_o(pxl_fifo_rd_clk_o),
        .pxl_fifo_rd_en_o(pxl_fifo_rd_en_o),
        .pxl_fifo_read_data_i(pxl_fifo_read_data_i),
        .pxl_fifo_prog_empty_i(pxl_fifo_prog_empty_i),
        .pxl_fifo_almost_empty_i(pxl_fifo_almost_empty_i),
        .pxl_fifo_empty_i(pxl_fifo_empty_i),

        .VGA_RGB(VGA_RGB),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
    );

endmodule