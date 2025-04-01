module Gpu #(
    parameter INIT_FILE = "build/gputest.mem",
    parameter MAIN_MEMORY_BYTES = 2048,
    parameter IO_REG_BYTES = 4096,

    parameter PIXEL_BITS = 8,
    localparam PALETTE_LENGTH = (1<<PIXEL_BITS),
    parameter RED_BITS = 4,
    parameter GREEN_BITS = 4,
    parameter BLUE_BITS = 4,
    parameter ALPHA_BITS = 4,
    localparam COLOR_BITS = RED_BITS + GREEN_BITS + BLUE_BITS + ALPHA_BITS,
    localparam BYTES_PER_COLOR = (COLOR_BITS-1)/8 + 1,
    localparam PALETTE_BYTES = PALETTE_LENGTH*BYTES_PER_COLOR,

    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    localparam BYTES_PER_PIXEL = (PIXEL_BITS-1)/8 + 1,
    localparam FRAMEBUFFER_LENGTH = RESOLUTION_X*RESOLUTION_Y,
    localparam FRAMEBUFFER_BYTES = FRAMEBUFFER_LENGTH*BYTES_PER_PIXEL,

    parameter SYNC_LATENCY = 3 // latency between video controller requesting pixel to palette outputting pixel
) (
    input logic gpu_clk,
    input logic vga_clk,
    input logic reset,

    // AXI4 host interface
    input logic [11:0]S_AXI_araddr,
    input logic [1:0]S_AXI_arburst,
    input logic [3:0]S_AXI_arcache,
    input logic [7:0]S_AXI_arlen,
    input logic S_AXI_arlock,
    input logic [2:0]S_AXI_arprot,
    output logic S_AXI_arready,
    input logic [2:0]S_AXI_arsize,
    input logic S_AXI_arvalid,

    input logic [11:0]S_AXI_awaddr,
    input logic [1:0]S_AXI_awburst,
    input logic [3:0]S_AXI_awcache,
    input logic [7:0]S_AXI_awlen,
    input logic S_AXI_awlock,
    input logic [2:0]S_AXI_awprot,
    output logic S_AXI_awready,
    input logic [2:0]S_AXI_awsize,
    input logic S_AXI_awvalid,

    input logic S_AXI_bready,
    output logic [1:0]S_AXI_bresp,
    output logic S_AXI_bvalid,

    output logic [31:0]S_AXI_rdata,
    output logic S_AXI_rlast,
    input logic S_AXI_rready,
    output logic [1:0]S_AXI_rresp,
    output logic S_AXI_rvalid,

    input logic [31:0]S_AXI_wdata,
    input logic S_AXI_wlast,
    output logic S_AXI_wready,
    input logic [3:0]S_AXI_wstrb,
    input logic S_AXI_wvalid,

    input logic s_axi_aclk,
    input logic s_axi_aresetn,

    // video interface
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

    logic [$clog2(IO_REG_BYTES)-1:0] io_reg_addr;
    logic [31:0] io_reg_rd_data;
    logic [31:0] io_reg_wr_data;
    logic [3:0] io_reg_wr_en;

    logic [$clog2(PALETTE_BYTES)-1:0] palette_wr_addr;
    logic [31:0] palette_wr_data;
    logic [3:0] palette_wr_en;

    logic [$clog2(FRAMEBUFFER_BYTES)-1:0] fb_wr_addr;
    logic [31:0] fb_wr_data;
    logic [3:0] fb_wr_en;

    DisplayProcessor u_DisplayProcessor (
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
        .io_reg_addr           (io_reg_addr),
        .io_reg_rd_data        (io_reg_rd_data),
        .io_reg_wr_data        (io_reg_wr_data),
        .io_reg_wr_en          (io_reg_wr_en),
        // color palette
        .palette_wr_addr       (palette_wr_addr),
        .palette_wr_data       (palette_wr_data),
        .palette_wr_en         (palette_wr_en),
        // framebuffer
        .fb_wr_addr            (fb_wr_addr),
        .fb_wr_data            (fb_wr_data),
        .fb_wr_en              (fb_wr_en)
    );

    main_memory #(
        .INIT_FILE         (INIT_FILE),
        .CAPACITY_BYTES    (MAIN_MEMORY_BYTES),
        .BYTES_PER_WORD    (4)
    ) u_main_memory (
        .clk               (gpu_clk),
        // instruction
        .port_a_reset      (inst_reset),
        .port_a_address    (inst_addr),
        .port_a_rd_data    (inst_rd_data),
        .port_a_rd_en      (inst_rd_en),
        .port_a_wr_data    ('0),
        .port_a_wr_en      ('0),
        // data
        .port_b_reset      ('0),
        .port_b_address    (data_mem_addr),
        .port_b_rd_data    (data_mem_rd_data),
        .port_b_rd_en      ('1),
        .port_b_wr_data    (data_mem_wr_data),
        .port_b_wr_en      (data_mem_wr_en)
    );

    AxiGpuIORegisters u_AxiGpuIORegisters (
        // AXI4 interface
        .S_AXI_araddr      (S_AXI_araddr),
        .S_AXI_arburst     (S_AXI_arburst),
        .S_AXI_arcache     (S_AXI_arcache),
        .S_AXI_arlen       (S_AXI_arlen),
        .S_AXI_arlock      (S_AXI_arlock),
        .S_AXI_arprot      (S_AXI_arprot),
        .S_AXI_arready     (S_AXI_arready),
        .S_AXI_arsize      (S_AXI_arsize),
        .S_AXI_arvalid     (S_AXI_arvalid),
        .S_AXI_awaddr      (S_AXI_awaddr),
        .S_AXI_awburst     (S_AXI_awburst),
        .S_AXI_awcache     (S_AXI_awcache),
        .S_AXI_awlen       (S_AXI_awlen),
        .S_AXI_awlock      (S_AXI_awlock),
        .S_AXI_awprot      (S_AXI_awprot),
        .S_AXI_awready     (S_AXI_awready),
        .S_AXI_awsize      (S_AXI_awsize),
        .S_AXI_awvalid     (S_AXI_awvalid),
        .S_AXI_bready      (S_AXI_bready),
        .S_AXI_bresp       (S_AXI_bresp),
        .S_AXI_bvalid      (S_AXI_bvalid),
        .S_AXI_rdata       (S_AXI_rdata),
        .S_AXI_rlast       (S_AXI_rlast),
        .S_AXI_rready      (S_AXI_rready),
        .S_AXI_rresp       (S_AXI_rresp),
        .S_AXI_rvalid      (S_AXI_rvalid),
        .S_AXI_wdata       (S_AXI_wdata),
        .S_AXI_wlast       (S_AXI_wlast),
        .S_AXI_wready      (S_AXI_wready),
        .S_AXI_wstrb       (S_AXI_wstrb),
        .S_AXI_wvalid      (S_AXI_wvalid),
        .s_axi_aclk        (s_axi_aclk),
        .s_axi_aresetn     (s_axi_aresetn),
        // GPU interface
        .io_reg_addr       (io_reg_addr),
        .io_reg_clk        (gpu_clk),
        .io_reg_wr_data    (io_reg_wr_data),
        .io_reg_rd_data    (io_reg_rd_data),
        .io_reg_en         ('1),
        .io_reg_reset      (reset),
        .io_reg_wr_en      (io_reg_wr_en)
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

    logic [$clog2(RESOLUTION_X)-1:0] fb_rd_x;
    logic [$clog2(RESOLUTION_Y)-1:0] fb_rd_y;
    Framebuffer #(
        .RESOLUTION_X          (RESOLUTION_X),
        .RESOLUTION_Y          (RESOLUTION_Y),
        .PIXEL_BITS            (PIXEL_BITS)
    ) u_Framebuffer (
        .reset                 (reset),

        .wr_clk                (gpu_clk),
        .wr_pxl_addr           (fb_wr_addr),
        .wr_pxl_data           (fb_wr_data),
        .wr_en                 (fb_wr_en),

        .rd_clk                (vga_clk),
        .rd_en                 ('1),
        .rd_pxl_x              (fb_rd_x),
        .rd_pxl_y              (fb_rd_y),
        .rd_pxl_value          (palette_index)
    );

    VideoController #(
        .SYNC_LATENCY(SYNC_LATENCY)
    ) video_controller (
        .clk(vga_clk),
        .reset(reset),

        .fb_rd_x(fb_rd_x),
        .fb_rd_y(fb_rd_y),
        .color(color),

        .vga_hs(vga_hs),
        .vga_vs(vga_vs),

        .vga_r(vga_r),
        .vga_g(vga_g),
        .vga_b(vga_b)
    );

endmodule