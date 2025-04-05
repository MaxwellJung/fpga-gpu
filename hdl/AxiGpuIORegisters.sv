module AxiGpuIORegisters (
    // AXI4 interface
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
    
    // GPU interface
    input logic [11:0] io_reg_addr,
    input logic io_reg_clk,
    input logic [31:0] io_reg_wr_data,
    output logic [31:0] io_reg_rd_data,
    input logic io_reg_en,
    input logic io_reg_reset,
    input logic [3:0] io_reg_wr_en
);
    logic [11:0] cpu_io_reg_addr;
    logic cpu_io_reg_clk;
    logic [31:0] cpu_io_reg_din;
    logic [31:0] cpu_io_reg_dout;
    logic cpu_io_reg_en;
    logic cpu_io_reg_rst;
    logic [3:0] cpu_io_reg_we;

    AxiBramController AxiBramController_0 (
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

        .BRAM_PORTA_addr(cpu_io_reg_addr),
        .BRAM_PORTA_clk(cpu_io_reg_clk),
        .BRAM_PORTA_din(cpu_io_reg_din),
        .BRAM_PORTA_dout(cpu_io_reg_dout),
        .BRAM_PORTA_en(cpu_io_reg_en),
        .BRAM_PORTA_rst(cpu_io_reg_rst),
        .BRAM_PORTA_we(cpu_io_reg_we)
    );

endmodule
