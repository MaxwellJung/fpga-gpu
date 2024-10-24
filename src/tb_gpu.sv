`timescale 1ns / 1ps

module tb_gpu ();
    localparam CLK_PERIOD = 2;

    logic clk;
    logic rst;
    wire h_sync;
    wire v_sync;
    
    vga_gpu dut (
        .clk(clk),
        .rst(rst),

        .red(),
        .green(),
        .blue(),

        .h_sync(h_sync),
        .v_sync(v_sync)
    );

    initial clk = 0;
    always #(CLK_PERIOD / 2.0)
        clk = ~clk;

    initial begin
        // simulation files dumped to the tb_gpu file
        $dumpfile("tb_gpu.vcd");
        $dumpvars(0,tb_gpu);

        // hold reset for 10 ns
        rst <= 1;
        #10
        rst <= 0;

        // simulate 3 frames
        #(CLK_PERIOD*264*628*3)

        // hold reset for 50 ns
        rst <= 1;
        #50
        rst <= 0;

        #20 $finish;
    end

endmodule
