module GpuTop #(
    parameter INIT_FILE = "build/gputest.mem"
) (
    input wire gpu_clk,
    input wire vga_clk,
    input wire reset,

    // host interface
    input wire [11:0]S_AXI_araddr,
    input wire [1:0]S_AXI_arburst,
    input wire [3:0]S_AXI_arcache,
    input wire [7:0]S_AXI_arlen,
    input wire S_AXI_arlock,
    input wire [2:0]S_AXI_arprot,
    output wire S_AXI_arready,
    input wire [2:0]S_AXI_arsize,
    input wire S_AXI_arvalid,

    input wire [11:0]S_AXI_awaddr,
    input wire [1:0]S_AXI_awburst,
    input wire [3:0]S_AXI_awcache,
    input wire [7:0]S_AXI_awlen,
    input wire S_AXI_awlock,
    input wire [2:0]S_AXI_awprot,
    output wire S_AXI_awready,
    input wire [2:0]S_AXI_awsize,
    input wire S_AXI_awvalid,

    input wire S_AXI_bready,
    output wire [1:0]S_AXI_bresp,
    output wire S_AXI_bvalid,

    output wire [31:0]S_AXI_rdata,
    output wire S_AXI_rlast,
    input wire S_AXI_rready,
    output wire [1:0]S_AXI_rresp,
    output wire S_AXI_rvalid,

    input wire [31:0]S_AXI_wdata,
    input wire S_AXI_wlast,
    output wire S_AXI_wready,
    input wire [3:0]S_AXI_wstrb,
    input wire S_AXI_wvalid,
    
    input wire s_axi_aclk,
    input wire s_axi_aresetn,

    // video interface
    output wire vga_hs,
    output wire vga_vs,
    output wire [3:0] vga_r,
    output wire [3:0] vga_g,
    output wire [3:0] vga_b
);
    Gpu #(
        .INIT_FILE(INIT_FILE)
    ) gpu_0 (
        .gpu_clk(gpu_clk),
        .vga_clk(vga_clk),
        .reset(reset),

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

        .vga_hs(vga_hs),
        .vga_vs(vga_vs),
        .vga_r(vga_r),
        .vga_g(vga_g),
        .vga_b(vga_b)
    );

endmodule