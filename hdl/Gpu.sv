module Gpu #(
    parameter GPU_FIRMWARE_FILE = "build/gpu_firmware.mem",
    parameter MAIN_MEMORY_BYTES = 2048,
    parameter COMMAND_COUNT = 4,
    parameter BYTES_PER_COMMAND = 12,
    localparam IO_REG_BYTES = (4+4+4+BYTES_PER_COMMAND*COMMAND_COUNT),

    parameter PIXEL_BITS = 8,
    localparam PALETTE_LENGTH = (1<<PIXEL_BITS),
    parameter RED_BITS = 4,
    parameter GREEN_BITS = 4,
    parameter BLUE_BITS = 4,
    parameter ALPHA_BITS = 4,
    localparam COLOR_BITS = RED_BITS + GREEN_BITS + BLUE_BITS + ALPHA_BITS,
    localparam BYTES_PER_COLOR = (COLOR_BITS-1)/8 + 1,
    localparam PALETTE_BYTES = PALETTE_LENGTH*BYTES_PER_COLOR,

    parameter VGA_RES_X = 800,
    parameter VGA_RES_Y = 600,
    parameter DOWNSCALE = 2,
    parameter TILE_WIDTH = 2,
    parameter TILE_HEIGHT = 2,
    localparam FB_RES_X = VGA_RES_X/DOWNSCALE,
    localparam FB_RES_Y = VGA_RES_Y/DOWNSCALE,
    localparam BYTES_PER_PIXEL = (PIXEL_BITS-1)/8 + 1,
    localparam PXLS_PER_FRAME = FB_RES_X*FB_RES_Y,
    localparam FB_BYTES = PXLS_PER_FRAME*BYTES_PER_PIXEL,

    localparam CORE_COUNT = TILE_WIDTH*TILE_HEIGHT,

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
    logic [CORE_COUNT-1:0]inst_reset;
    logic [CORE_COUNT-1:0][$clog2(MAIN_MEMORY_BYTES)-1:0] inst_addr;
    logic [CORE_COUNT-1:0][31:0] inst_rd_data;
    logic [CORE_COUNT-1:0] inst_rd_en;

    logic [CORE_COUNT-1:0][$clog2(MAIN_MEMORY_BYTES)-1:0] data_mem_addr;
    logic [CORE_COUNT-1:0][31:0] data_mem_rd_data;
    logic [CORE_COUNT-1:0][31:0] data_mem_wr_data;
    logic [CORE_COUNT-1:0][3:0] data_mem_wr_en;

    logic [CORE_COUNT-1:0][$clog2(IO_REG_BYTES)-1:0] gpu_io_reg_addr;
    logic [CORE_COUNT-1:0][31:0] gpu_io_reg_rd_data;
    logic [CORE_COUNT-1:0][31:0] gpu_io_reg_wr_data;
    logic [CORE_COUNT-1:0][3:0] gpu_io_reg_wr_en;

    logic [$clog2(PALETTE_BYTES)-1:0] palette_wr_addr;
    logic [31:0] palette_wr_data;
    logic [3:0] palette_wr_en;

    logic [CORE_COUNT-1:0][$clog2(FB_BYTES/CORE_COUNT)-1:0] fb_wr_addr;
    logic [CORE_COUNT-1:0][31:0] fb_wr_data;
    logic [CORE_COUNT-1:0][3:0] fb_wr_en;

    genvar i;
    generate for (i = 0; i < CORE_COUNT; i=i+1) begin
        if (i == 0) begin : gen_core_0
            DisplayProcessor #(
                .MAIN_MEMORY_BYTES     (MAIN_MEMORY_BYTES),
                .IO_REG_BYTES          (IO_REG_BYTES),
                .PALETTE_BYTES         (PALETTE_BYTES),
                .FRAMEBUFFER_BYTES     (FB_BYTES/CORE_COUNT)
            ) u_DisplayProcessor (
                .clk                   (gpu_clk),
                .reset                 (reset),
                // Instruction memory
                .inst_reset            (inst_reset[i]),
                .inst_addr             (inst_addr[i]),
                .inst_rd_data          (inst_rd_data[i]),
                .inst_rd_en            (inst_rd_en[i]),
                // Data memory
                .data_mem_addr         (data_mem_addr[i]),
                .data_mem_rd_data      (data_mem_rd_data[i]),
                .data_mem_wr_data      (data_mem_wr_data[i]),
                .data_mem_wr_en        (data_mem_wr_en[i]),
                // I/O reg
                .io_reg_addr           (gpu_io_reg_addr[i]),
                .io_reg_rd_data        (gpu_io_reg_rd_data[i]),
                .io_reg_wr_data        (gpu_io_reg_wr_data[i]),
                .io_reg_wr_en          (gpu_io_reg_wr_en[i]),
                // color palette
                .palette_wr_addr       (palette_wr_addr),
                .palette_wr_data       (palette_wr_data),
                .palette_wr_en         (palette_wr_en),
                // framebuffer
                .fb_wr_addr            (fb_wr_addr[i]),
                .fb_wr_data            (fb_wr_data[i]),
                .fb_wr_en              (fb_wr_en[i])
            );
        end
        else begin : gen_cores
            DisplayProcessor #(
                .MAIN_MEMORY_BYTES     (MAIN_MEMORY_BYTES),
                .IO_REG_BYTES          (IO_REG_BYTES),
                .PALETTE_BYTES         (PALETTE_BYTES),
                .FRAMEBUFFER_BYTES     (FB_BYTES/CORE_COUNT)
            ) u_DisplayProcessor (
                .clk                   (gpu_clk),
                .reset                 (reset),
                // Instruction memory
                .inst_reset            (inst_reset[i]),
                .inst_addr             (inst_addr[i]),
                .inst_rd_data          (inst_rd_data[i]),
                .inst_rd_en            (inst_rd_en[i]),
                // Data memory
                .data_mem_addr         (data_mem_addr[i]),
                .data_mem_rd_data      (data_mem_rd_data[i]),
                .data_mem_wr_data      (data_mem_wr_data[i]),
                .data_mem_wr_en        (data_mem_wr_en[i]),
                // I/O reg
                .io_reg_addr           (gpu_io_reg_addr[i]),
                .io_reg_rd_data        (gpu_io_reg_rd_data[i]),
                .io_reg_wr_data        (gpu_io_reg_wr_data[i]),
                .io_reg_wr_en          (gpu_io_reg_wr_en[i]),
                // color palette
                .palette_wr_addr       (),
                .palette_wr_data       (),
                .palette_wr_en         (),
                // framebuffer
                .fb_wr_addr            (fb_wr_addr[i]),
                .fb_wr_data            (fb_wr_data[i]),
                .fb_wr_en              (fb_wr_en[i])
            );
        end

        BlockMemory #(
            .INIT_FILE         (GPU_FIRMWARE_FILE),
            .CAPACITY_BYTES    (MAIN_MEMORY_BYTES),
            .BYTES_PER_WORD    (4)
        ) u_main_memory (
            // Port A
            .port_a_clk        (gpu_clk),
            .port_a_reset      (inst_reset[i]),
            .port_a_address    (inst_addr[i]),
            .port_a_rd_data    (inst_rd_data[i]),
            .port_a_rd_en      (inst_rd_en[i]),
            .port_a_wr_data    ('0),
            .port_a_wr_en      ('0),
            // Port B
            .port_b_clk        (gpu_clk),
            .port_b_reset      ('0),
            .port_b_address    (data_mem_addr[i]),
            .port_b_rd_data    (data_mem_rd_data[i]),
            .port_b_rd_en      ('1),
            .port_b_wr_data    (data_mem_wr_data[i]),
            .port_b_wr_en      (data_mem_wr_en[i])
        );
    end endgenerate

    IoRegisters #(
        .CORE_COUNT           (CORE_COUNT),
        .BYTES_PER_WORD       (4),
        .COMMAND_COUNT        (4),
        .BYTES_PER_COMMAND    (12)
    ) u_IoRegisters (
        // CPU side
        .cpu_clk              (cpu_io_reg_clk),
        .cpu_reset            (cpu_io_reg_rst),
        .cpu_address          (cpu_io_reg_addr),
        .cpu_rd_data          (cpu_io_reg_dout),
        .cpu_rd_en            (cpu_io_reg_en),
        .cpu_wr_data          (cpu_io_reg_din),
        .cpu_wr_en            (cpu_io_reg_we),
        // GPU side
        .gpu_clk              (gpu_clk),
        .gpu_reset            (reset),
        .gpu_address          (gpu_io_reg_addr),
        .gpu_rd_data          (gpu_io_reg_rd_data),
        .gpu_wr_data          (gpu_io_reg_wr_data),
        .gpu_wr_en            (gpu_io_reg_wr_en)
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

    logic [$clog2(VGA_RES_X)-1:0] screen_pxl_x;
    logic [$clog2(VGA_RES_Y)-1:0] screen_pxl_y;
    logic [$clog2(FB_RES_X)-1:0] fb_pxl_x;
    logic [$clog2(FB_RES_Y)-1:0] fb_pxl_y;
    assign fb_pxl_x = screen_pxl_x[$clog2(DOWNSCALE)+:$clog2(FB_RES_X)];
    assign fb_pxl_y = screen_pxl_y[$clog2(DOWNSCALE)+:$clog2(FB_RES_Y)];

    Framebuffer #(
        .RES_X            (FB_RES_X),
        .RES_Y            (FB_RES_Y),
        .PXL_BITS         (PIXEL_BITS),
        .TILE_WIDTH       (TILE_WIDTH),
        .TILE_HEIGHT      (TILE_HEIGHT)
    ) u_Framebuffer (
        .wr_clk           (gpu_clk),
        .wr_tile_index    (fb_wr_addr),
        .wr_pxl_data      (fb_wr_data),
        .wr_en            (fb_wr_en),
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
