module GpuWrapper #(
    parameter GPU_FIRMWARE_FILE = "build/gpu_firmware.mem",
    parameter COMMAND_COUNT = 4,
    parameter BYTES_PER_COMMAND = 12,

    parameter RED_BITS = 4,
    parameter GREEN_BITS = 4,
    parameter BLUE_BITS = 4
) (
    input wire gpu_clk,
    input wire vga_clk,
    input wire reset,

    // I/O register interface
    input wire [$clog2(4+4+4+(BYTES_PER_COMMAND*COMMAND_COUNT))-1:0] cpu_io_reg_addr,
    input wire cpu_io_reg_clk,
    input  wire [31:0] cpu_io_reg_din,
    output wire [31:0] cpu_io_reg_dout,
    input wire cpu_io_reg_en,
    input wire cpu_io_reg_rst,
    input wire [3:0] cpu_io_reg_we,

    // Video out interface
    output wire vga_hs,
    output wire vga_vs,
    output wire [RED_BITS-1:0] vga_r,
    output wire [GREEN_BITS-1:0] vga_g,
    output wire [BLUE_BITS-1:0] vga_b
);

    Gpu #(
        .GPU_FIRMWARE_FILE    (GPU_FIRMWARE_FILE),
        // .MAIN_MEMORY_BYTES    (2048),
        .COMMAND_COUNT        (COMMAND_COUNT),
        .BYTES_PER_COMMAND    (BYTES_PER_COMMAND),
        // .IO_REG_BYTES         ((4+4+4+BYTES_PER_COMMAND*COMMAND_COUNT)),
        // .PIXEL_BITS           (8),
        // .PALETTE_LENGTH       ((1<<PIXEL_BITS)),
        .RED_BITS             (RED_BITS),
        .GREEN_BITS           (GREEN_BITS),
        .BLUE_BITS            (BLUE_BITS)
        // .ALPHA_BITS           (4),
        // .COLOR_BITS           (RED_BITS+GREEN_BITS+BLUE_BITS+ALPHA_BITS),
        // .BYTES_PER_COLOR      ((COLOR_BITS-1)/8+1),
        // .PALETTE_BYTES        (PALETTE_LENGTH*BYTES_PER_COLOR),
        // .VGA_RES_X            (800),
        // .VGA_RES_Y            (600),
        // .DOWNSCALE            (2),
        // .TILE_WIDTH           (2),
        // .TILE_HEIGHT          (2),
        // .FB_RES_X             (VGA_RES_X/DOWNSCALE),
        // .FB_RES_Y             (VGA_RES_Y/DOWNSCALE),
        // .BYTES_PER_PIXEL      ((PIXEL_BITS-1)/8+1),
        // .PXLS_PER_FRAME       (FB_RES_X*FB_RES_Y),
        // .FB_BYTES             (PXLS_PER_FRAME*BYTES_PER_PIXEL),
        // .CORE_COUNT           (TILE_WIDTH*TILE_HEIGHT),
        // // latency between video controller requesting pixel to palette outputting pixel
        // .SYNC_LATENCY         (3)
    ) u_Gpu (
        .gpu_clk              (gpu_clk),
        .vga_clk              (vga_clk),
        .reset                (reset),
        // I/O register interface
        .cpu_io_reg_addr      (cpu_io_reg_addr),
        .cpu_io_reg_clk       (cpu_io_reg_clk),
        .cpu_io_reg_din       (cpu_io_reg_din),
        .cpu_io_reg_dout      (cpu_io_reg_dout),
        .cpu_io_reg_en        (cpu_io_reg_en),
        .cpu_io_reg_rst       (cpu_io_reg_rst),
        .cpu_io_reg_we        (cpu_io_reg_we),
        // Video out interface
        .vga_hs               (vga_hs),
        .vga_vs               (vga_vs),
        .vga_r                (vga_r),
        .vga_g                (vga_g),
        .vga_b                (vga_b)
    );

endmodule
