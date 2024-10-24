`timescale 1ns / 1ps

module tb_counter ();
    localparam NUM_BITS = 8;
    localparam CLK_PERIOD = 2;

    logic clk;
    logic rst;
    logic enable;
    logic [NUM_BITS-1:0] count;
    
    counter c0 (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .count(count)
    );

    initial clk = 0;
    always #(CLK_PERIOD / 2.0)
        clk = ~clk;

    initial begin
        // pause counter
        enable <= 0;

        // hold reset for 10 ns
        rst <= 1;
        #10
        rst <= 0;

        // start counter for 50 ns
        #10
        enable <= 1;
        #50
        enable <= 0;

        // resume counter for 50 ns
        #10
        enable <= 1;
        #50
        enable <= 0;

        // hold reset for 50 ns
        rst <= 1;
        #50
        rst <= 0;

        #20 $finish;
    end

endmodule
