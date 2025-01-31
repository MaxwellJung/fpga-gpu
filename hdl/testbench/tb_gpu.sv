`timescale 1ns / 1ps

module tb_gpu ();
    localparam GPU_CLK_PERIOD = 5; // 200MHz clock
    localparam VGA_CLK_PERIOD = 25; // 40MHz clock

    logic gpu_clk;
    logic vga_clk;
    logic reset;
    logic enable;

    logic [11:0] VGA_RGB;
    logic VGA_HS, VGA_VS;

    gpu dut
    (.S_AXI_araddr(S_AXI_araddr),
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
    .VGA_HS(VGA_HS),
    .VGA_RGB(VGA_RGB),
    .VGA_VS(VGA_VS),
    .gpu_clk_i(gpu_clk),
    .reset_i(reset),
    .s_axi_aclk(s_axi_aclk),
    .s_axi_aresetn(s_axi_aresetn),
    .vga_clk_i(vga_clk));

    initial gpu_clk = 0;
    always #(GPU_CLK_PERIOD / 2.0)
        gpu_clk = ~gpu_clk;

    initial vga_clk = 0;
    always #(VGA_CLK_PERIOD / 2.0)
        vga_clk = ~vga_clk;

    initial begin
        $dumpvars(0, tb_gpu);

        enable <= 1;
        // hold reset for 3 VGA clock
        reset <= 1;
        #(3*VGA_CLK_PERIOD)
        reset <= 0;

        // wait 5 vga clock before starting
        // #(VGA_CLK_PERIOD*5)
        // enable <= 1;

        // simulate 3 frames
        #(VGA_CLK_PERIOD*1056*628*1)

        #(VGA_CLK_PERIOD*1056*628*2)

        // hold reset for 50 ns
        reset <= 1;
        #50
        reset <= 0;

        #20 $finish;
    end

endmodule
