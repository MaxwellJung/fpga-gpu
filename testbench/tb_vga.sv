`timescale 1ns / 1ps

module tb_vga ();
    localparam CLK_PERIOD = 100; // 10MHz clock

    logic clk;
    logic resetn;

    wire [3:0] red, green, blue;

    wire h_sync;
    wire v_sync;
    
    vga dut (
        .clk(clk),
        .resetn(resetn),

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
        $dumpvars(0, tb_vga);

        // hold reset for 10 ns
        resetn <= 0;
        #(CLK_PERIOD+10)
        resetn <= 1;

        // simulate 3 frames
        #(CLK_PERIOD*1056*628*3)

        // hold reset for 50 ns
        resetn <= 0;
        #50
        resetn <= 1;

        #20 $finish;
    end

endmodule
