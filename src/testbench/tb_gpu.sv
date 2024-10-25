`timescale 1ns / 1ps

module tb_gpu ();
    localparam CLK_PERIOD = 100; // 10MHz clock

    logic clk;
    logic aresetn;

    wire [3:0] red, green, blue;

    wire h_sync;
    wire v_sync;
    
    vga_gpu dut (
        .clk(clk),
        .aresetn(aresetn),

        .red(red),
        .green(green),
        .blue(blue),

        .h_sync(h_sync),
        .v_sync(v_sync)
    );

    initial clk = 0;
    always #(CLK_PERIOD / 2.0)
        clk = ~clk;

    initial begin
        $dumpvars(0, tb_gpu);

        // hold reset for 10 ns
        aresetn <= 0;
        #10
        aresetn <= 1;

        // simulate 3 frames
        #(CLK_PERIOD*264*628*3)

        // hold reset for 50 ns
        aresetn <= 0;
        #50
        aresetn <= 1;

        #20 $finish;
    end

endmodule
