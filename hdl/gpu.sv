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
    input logic gpu_clk_i,
    input logic vga_clk_i,
    input logic reset_i,

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
    output logic vga_hs_o,
    output logic vga_vs_o,
    output logic [RED_BITS-1:0] vga_r_o,
    output logic [GREEN_BITS-1:0] vga_g_o,
    output logic [BLUE_BITS-1:0] vga_b_o
);
    logic [31:0] gpu_cp_x;
    logic [31:0] gpu_cp_y;
    logic [31:0] gpu_index;

    AxiGpuRegisters #() axi_gpu_registers(
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
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),

        .gpu_cp_x_o(gpu_cp_x),
        .gpu_cp_y_o(gpu_cp_y),
        .gpu_index_o(gpu_index)
    );

    logic [$clog2(RESOLUTION_X)-1:0] cp_x;
    logic [$clog2(RESOLUTION_Y)-1:0] cp_y;
    logic [$clog2(PALETTE_LENGTH)-1:0] index;

    DisplayProcessor #(
        .RESOLUTION_X(RESOLUTION_X),
        .RESOLUTION_Y(RESOLUTION_Y),
        .PALETTE_LENGTH(PALETTE_LENGTH)
    ) display_processor (
        .clk_i(gpu_clk_i),
        .reset_i(reset_i),

        .x_i(gpu_cp_x),
        .y_i(gpu_cp_y),
        .index_i(gpu_index),

        .cp_x_o(cp_x),
        .cp_y_o(cp_y),
        .index_o(index)
    );

    logic [$clog2(RESOLUTION_X)-1:0] fb_rd_x;
    logic [$clog2(RESOLUTION_Y)-1:0] fb_rd_y;
    logic [$clog2(PALETTE_LENGTH)-1:0] palette_index;
    logic [COLOR_BITS-1:0] color;

    Framebuffer #(
        .RESOLUTION_X(RESOLUTION_X),
        .RESOLUTION_Y(RESOLUTION_Y),
        .PALETTE_LENGTH(PALETTE_LENGTH)
    ) framebuffer (
        .reset_i(reset_i),
        
        .rd_clk_i(vga_clk_i),
        .re_i('1),
        .pxl_x_i(fb_rd_x),
        .pxl_y_i(fb_rd_y),
        .palette_index_o(palette_index),

        .wr_clk_i(gpu_clk_i),
        .we_i('1),
        .wr_pxl_x_i(cp_x),
        .wr_pxl_y_i(cp_y),
        .wr_palette_index_i(index)
    );

    Palette #(
        .PALETTE_LENGTH(PALETTE_LENGTH),
        .COLOR_BITS(COLOR_BITS)
    ) palette (
        .reset_i(reset_i),

        .rd_clk_i(vga_clk_i),
        .rd_en_i('1),
        .rd_index_i(palette_index),
        .rd_color_o(color),

        .wr_clk_i(gpu_clk_i),
        .wr_en_i('0)
    );

    VideoController #(
        .SYNC_LATENCY(SYNC_LATENCY)
    ) video_controller (
        .clk_i(vga_clk_i),
        .reset_i(reset_i),

        .fb_rd_x_o(fb_rd_x),
        .fb_rd_y_o(fb_rd_y),
        .color_i(color),

        .vga_hs_o(vga_hs_o),
        .vga_vs_o(vga_vs_o),

        .vga_r_o(vga_r_o),
        .vga_g_o(vga_g_o),
        .vga_b_o(vga_b_o)
    );

endmodule