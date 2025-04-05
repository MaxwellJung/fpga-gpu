module Gpu #(
    parameter GPU_FIRMWARE_FILE = "build/gpu_firmware.mem",
    parameter MAIN_MEMORY_BYTES = 2048,
    parameter IO_REG_BYTES = 4*(1+1+4*3),

    parameter PIXEL_BITS = 8,
    localparam PALETTE_LENGTH = (1<<PIXEL_BITS),
    parameter RED_BITS = 4,
    parameter GREEN_BITS = 4,
    parameter BLUE_BITS = 4,
    parameter ALPHA_BITS = 4,
    localparam COLOR_BITS = RED_BITS + GREEN_BITS + BLUE_BITS + ALPHA_BITS,
    localparam BYTES_PER_COLOR = (COLOR_BITS-1)/8 + 1,
    localparam PALETTE_BYTES = PALETTE_LENGTH*BYTES_PER_COLOR,

    parameter VGA_X = 800,
    parameter VGA_Y = 600,
    parameter DOWNSCALE = 2,
    localparam RESOLUTION_X = VGA_X/DOWNSCALE,
    localparam RESOLUTION_Y = VGA_Y/DOWNSCALE,
    localparam BYTES_PER_PIXEL = (PIXEL_BITS-1)/8 + 1,
    localparam PIXELS_PER_FRAME = RESOLUTION_X*RESOLUTION_Y,
    localparam FRAMEBUFFER_BYTES = PIXELS_PER_FRAME*BYTES_PER_PIXEL,

    parameter SYNC_LATENCY = 3 // latency between video controller requesting pixel to palette outputting pixel
) (
    input logic gpu_clk,
    input logic vga_clk,
    input logic reset,

    // I/O register interface
    input logic [$clog2(IO_REG_BYTES)-1:0] cpu_io_reg_addr,
    input logic cpu_io_reg_clk,
    input  logic [31:0] cpu_io_reg_din,
    output logic [31:0] cpu_io_reg_dout,
    input logic cpu_io_reg_en,
    input logic cpu_io_reg_rst,
    input logic [3:0] cpu_io_reg_we,

    // Video out interface
    output logic vga_hs,
    output logic vga_vs,
    output logic [RED_BITS-1:0] vga_r,
    output logic [GREEN_BITS-1:0] vga_g,
    output logic [BLUE_BITS-1:0] vga_b
);
    logic inst_reset;
    logic [$clog2(MAIN_MEMORY_BYTES)-1:0] inst_addr;
    logic [31:0] inst_rd_data;
    logic inst_rd_en;

    logic [$clog2(MAIN_MEMORY_BYTES)-1:0] data_mem_addr;
    logic [31:0] data_mem_rd_data;
    logic [31:0] data_mem_wr_data;
    logic [3:0] data_mem_wr_en;

    logic [$clog2(IO_REG_BYTES)-1:0] gpu_io_reg_addr;
    logic [31:0] gpu_io_reg_rd_data;
    logic [31:0] gpu_io_reg_wr_data;
    logic [3:0] gpu_io_reg_wr_en;

    logic [$clog2(PALETTE_BYTES)-1:0] palette_wr_addr;
    logic [31:0] palette_wr_data;
    logic [3:0] palette_wr_en;

    logic [$clog2(FRAMEBUFFER_BYTES)-1:0] fb_wr_addr;
    logic [31:0] fb_wr_data;
    logic [3:0] fb_wr_en;

    DisplayProcessor #(
        .IO_REG_BYTES          (IO_REG_BYTES),
        .PALETTE_BYTES         (PALETTE_BYTES),
        .FRAMEBUFFER_BYTES     (FRAMEBUFFER_BYTES)
    ) u_DisplayProcessor (
        .clk                   (gpu_clk),
        .reset                 (reset),
        // Instruction memory
        .inst_reset            (inst_reset),
        .inst_addr             (inst_addr),
        .inst_rd_data          (inst_rd_data),
        .inst_rd_en            (inst_rd_en),
        // Data memory
        .data_mem_addr         (data_mem_addr),
        .data_mem_rd_data      (data_mem_rd_data),
        .data_mem_wr_data      (data_mem_wr_data),
        .data_mem_wr_en        (data_mem_wr_en),
        // I/O reg
        .io_reg_addr           (gpu_io_reg_addr),
        .io_reg_rd_data        (gpu_io_reg_rd_data),
        .io_reg_wr_data        (gpu_io_reg_wr_data),
        .io_reg_wr_en          (gpu_io_reg_wr_en),
        // color palette
        .palette_wr_addr       (palette_wr_addr),
        .palette_wr_data       (palette_wr_data),
        .palette_wr_en         (palette_wr_en),
        // framebuffer
        .fb_wr_addr            (fb_wr_addr),
        .fb_wr_data            (fb_wr_data),
        .fb_wr_en              (fb_wr_en)
    );

    BlockMemory #(
        .INIT_FILE         (GPU_FIRMWARE_FILE),
        .CAPACITY_BYTES    (MAIN_MEMORY_BYTES),
        .BYTES_PER_WORD    (4)
    ) u_main_memory (
        // Port A
        .port_a_clk        (gpu_clk),
        .port_a_reset      (inst_reset),
        .port_a_address    (inst_addr),
        .port_a_rd_data    (inst_rd_data),
        .port_a_rd_en      (inst_rd_en),
        .port_a_wr_data    ('0),
        .port_a_wr_en      ('0),
        // Port B
        .port_b_clk        (gpu_clk),
        .port_b_reset      ('0),
        .port_b_address    (data_mem_addr),
        .port_b_rd_data    (data_mem_rd_data),
        .port_b_rd_en      ('1),
        .port_b_wr_data    (data_mem_wr_data),
        .port_b_wr_en      (data_mem_wr_en)
    );

    BlockMemory #(
        .CAPACITY_BYTES    (IO_REG_BYTES),
        .BYTES_PER_WORD    (4)
    ) u_io_registers (
        // CPU side interface
        .port_a_address    (cpu_io_reg_addr),
        .port_a_clk        (cpu_io_reg_clk),
        .port_a_wr_data    (cpu_io_reg_din),
        .port_a_rd_data    (cpu_io_reg_dout),
        .port_a_rd_en      (cpu_io_reg_en),
        .port_a_reset      (cpu_io_reg_rst),
        .port_a_wr_en      (cpu_io_reg_we),
        // GPU side interface
        .port_b_address    (gpu_io_reg_addr),
        .port_b_clk        (gpu_clk),
        .port_b_wr_data    (gpu_io_reg_wr_data),
        .port_b_rd_data    (gpu_io_reg_rd_data),
        .port_b_rd_en      ('1),
        .port_b_reset      (reset),
        .port_b_wr_en      (gpu_io_reg_wr_en)
    );

    logic [$clog2(PALETTE_LENGTH)-1:0] palette_index;
    logic [COLOR_BITS-1:0] color;
    Palette #(
        .PALETTE_LENGTH     (PALETTE_LENGTH),
        .COLOR_BITS         (COLOR_BITS)
    ) u_Palette (
        .reset              (reset),

        .wr_clk             (gpu_clk),
        .wr_addr            (palette_wr_addr),
        .wr_data            (palette_wr_data),
        .wr_en              ({&palette_wr_en[3:2], &palette_wr_en[1:0]}),

        .rd_clk             (vga_clk),
        .rd_en              ('1),
        .rd_index           (palette_index),
        .rd_color           (color)
    );

    logic [$clog2(VGA_X)-1:0] screen_pxl_x;
    logic [$clog2(VGA_Y)-1:0] screen_pxl_y;
    logic [$clog2(RESOLUTION_X)-1:0] fb_pxl_x = screen_pxl_x[$clog2(DOWNSCALE)+:$clog2(RESOLUTION_X)];
    logic [$clog2(RESOLUTION_Y)-1:0] fb_pxl_y = screen_pxl_y[$clog2(DOWNSCALE)+:$clog2(RESOLUTION_Y)];

    Framebuffer #(
        .RESOLUTION_X     (RESOLUTION_X),
        .RESOLUTION_Y     (RESOLUTION_Y),
        .PXL_BITS         (PIXEL_BITS)
    ) u_Framebuffer (
        .wr_clk           (gpu_clk),
        .wr_tile_index    ({16{fb_wr_addr[$clog2(RESOLUTION_X*RESOLUTION_Y/16)-1:0]}}),
        .wr_pxl_data      ({16{fb_wr_data}}),
        .wr_en            ({16{fb_wr_en}}),
        .rd_clk           (vga_clk),
        .rd_reset         (reset),
        .rd_en            ('1),
        .rd_pxl_x         (fb_pxl_x),
        .rd_pxl_y         (fb_pxl_y),
        .rd_pxl_value     (palette_index)
    );

    VideoController #(
        .SYNC_LATENCY(SYNC_LATENCY)
    ) u_VideoController (
        .clk(vga_clk),
        .reset(reset),

        .screen_pxl_x(screen_pxl_x),
        .screen_pxl_y(screen_pxl_y),
        .color(color),

        .vga_hs(vga_hs),
        .vga_vs(vga_vs),

        .vga_r(vga_r),
        .vga_g(vga_g),
        .vga_b(vga_b)
    );

endmodule
