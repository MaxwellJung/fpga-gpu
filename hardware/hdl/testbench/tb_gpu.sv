`timescale 1ns / 1ps

module tb_gpu ();
    localparam CLK_PERIOD = 100; // 10MHz clock

    logic clk;
    logic resetn;

    wire [3:0] red, green, blue;

    wire h_sync;
    wire v_sync;

    reg [18:0] addr;
    reg [5:0] data;
    
    gpu_top #(
        .RED_CHANNEL_WIDTH(3),
        .GREEN_CHANNEL_WIDTH(3),
        .BLUE_CHANNEL_WIDTH(3)
    ) dut (
        .vga_clk(clk),
        .resetn(resetn),

        .VGA_R(red),
        .VGA_G(green),
        .VGA_B(blue),

        .VGA_HS(h_sync),
        .VGA_VS(v_sync)
    );

    initial clk = 0;
    always #(CLK_PERIOD / 2.0)
        clk = ~clk;

    initial begin
        $dumpvars(0, tb_gpu);

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

    initial begin
        #500
        addr <= 500;
        data <= 5;
    end

endmodule
