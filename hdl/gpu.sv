module Gpu #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256,

    parameter SYNC_LATENCY = 3, // latency between video controller requesting pixel to palette outputting pixel

    parameter RED_BITS = 4,
    parameter GREEN_BITS = 4,
    parameter BLUE_BITS = 4,
    localparam COLOR_BITS = RED_BITS + GREEN_BITS + BLUE_BITS
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
    logic [31:0] gpu_status, gpu_control;

    AxiGpuRegisters #() axi_gpu_registers(
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),

        .S_AXI_araddr(S_AXI_araddr),
        .S_AXI_arburst(S_AXI_arburst),
        .S_AXI_arcache(S_AXI_arcache),
        .S_AXI_arlen(S_AXI_arlen),
        .S_AXI_arlock(S_AXI_arlock),
        .S_AXI_arprot(S_AXI_arprot),
        .S_AXI_arready(S_AXI_arready),
        .S_AXI_arsize(S_AXI_arsize),
        .S_AXI_arvalid(S_AXI_arvalid),
        .S_AXI_awaddr(S_AXI_awaddr),
        .S_AXI_awburst(S_AXI_awburst),
        .S_AXI_awcache(S_AXI_awcache),
        .S_AXI_awlen(S_AXI_awlen),
        .S_AXI_awlock(S_AXI_awlock),
        .S_AXI_awprot(S_AXI_awprot),
        .S_AXI_awready(S_AXI_awready),
        .S_AXI_awsize(S_AXI_awsize),
        .S_AXI_awvalid(S_AXI_awvalid),
        .S_AXI_bready(S_AXI_bready),
        .S_AXI_bresp(S_AXI_bresp),
        .S_AXI_bvalid(S_AXI_bvalid),
        .S_AXI_rdata(S_AXI_rdata),
        .S_AXI_rlast(S_AXI_rlast),
        .S_AXI_rready(S_AXI_rready),
        .S_AXI_rresp(S_AXI_rresp),
        .S_AXI_rvalid(S_AXI_rvalid),
        .S_AXI_wdata(S_AXI_wdata),
        .S_AXI_wlast(S_AXI_wlast),
        .S_AXI_wready(S_AXI_wready),
        .S_AXI_wstrb(S_AXI_wstrb),
        .S_AXI_wvalid(S_AXI_wvalid),

        .gpu_status(gpu_status),
        .gpu_control(gpu_control)
    );

    // handle clock domain crossing (s_axi_aclk -> gpu_clk)
    logic [31:0] control;

    Latency #(
        .LENGTH(2),
        .WIDTH(1*32)
    ) gpu_reg_synchronizer (
        .clk(gpu_clk),
        .reset(reset),

        .data({gpu_control}),
        .data({control})
    );

    logic [$clog2(RESOLUTION_X)-1:0] fb_wr_x;
    logic [$clog2(RESOLUTION_Y)-1:0] fb_wr_y;
    logic [$clog2(PALETTE_LENGTH)-1:0] fb_wrndex;
    logic fb_wr_en;

    DisplayProcessor #(
        .RESOLUTION_X(RESOLUTION_X),
        .RESOLUTION_Y(RESOLUTION_Y),
        .PALETTE_LENGTH(PALETTE_LENGTH),
        .COLOR_BITS(COLOR_BITS)
    ) display_processor (
        .clk(gpu_clk),
        .reset(reset),

        .status(gpu_status),
        .control(control),

        .fb_wr_x(fb_wr_x),
        .fb_wr_y(fb_wr_y),
        .fb_wr_index(fb_wrndex),
        .fb_wr_en(fb_wr_en),

        .palette_wr_index(),
        .palette_wr_color(),
        .palette_wr_en()
    );

    logic [$clog2(RESOLUTION_X)-1:0] fb_rd_x;
    logic [$clog2(RESOLUTION_Y)-1:0] fb_rd_y;
    logic [$clog2(PALETTE_LENGTH)-1:0] palettendex;
    logic [COLOR_BITS-1:0] color;

    Framebuffer #(
        .RESOLUTION_X(RESOLUTION_X),
        .RESOLUTION_Y(RESOLUTION_Y),
        .PALETTE_LENGTH(PALETTE_LENGTH)
    ) framebuffer (
        .reset(reset),
        
        .rd_clk(vga_clk),
        .re('1),
        .pxl_x(fb_rd_x),
        .pxl_y(fb_rd_y),
        .palette_index(palettendex),

        .wr_clk(gpu_clk),
        .we(fb_wr_en),
        .wr_pxl_x(fb_wr_x),
        .wr_pxl_y(fb_wr_y),
        .wr_palette_index(fb_wrndex)
    );

    Palette #(
        .PALETTE_LENGTH(PALETTE_LENGTH),
        .COLOR_BITS(COLOR_BITS)
    ) palette (
        .reset(reset),

        .rd_clk(vga_clk),
        .rd_en('1),
        .rd_index(palettendex),
        .rd_color(color),

        .wr_clk(gpu_clk),
        .wr_en('0)
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