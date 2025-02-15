`timescale 1ns / 1ps

module tb_counter ();
    localparam NUM_BITS = 8;
    localparam CLK_PERIOD = 2;

    logic clk;
    logic resetn;
    logic enable;
    wire [NUM_BITS-1:0] count;
    
    counter c0 (
        .clk(clk),
        .resetn(resetn),
        .enable(enable),
        .count(count)
    );

    initial clk = 0;
    always #(CLK_PERIOD / 2.0)
        clk = ~clk;

    initial begin
        $dumpvars(0, tb_counter);
        // pause counter
        enable <= 0;

        // hold reset for 10 ns
        resetn <= 0;
        #10
        resetn <= 1;

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
        resetn <= 0;
        #50
        resetn <= 1;

        #20 $finish;
    end

endmodule
