`timescale 1ns / 1ps

module tb_gpu ();
    localparam GPU_CLK_PERIOD = 5; // 200MHz clock
    localparam VGA_CLK_PERIOD = 25; // 40MHz clock

    logic gpu_clk;
    logic vga_clk;
    logic reset;

    logic set_color_palette;

    wire [3:0] VGA_R, VGA_G, VGA_B;

    wire VGA_HS;
    wire VGA_VS;

    wire bram_en;
    wire [31:0] bram_addr, bram_data;

    Ram #(
        .INIT_FILE("data/32bit_ram_init.mem"),
        .WIDTH(32),
        .ADDR_BITS(8)
    ) bram (
        .write_clk_i(gpu_clk),
        .read_clk_i(gpu_clk),
        
        .read_enable_i(bram_en),
        .read_addr_i(bram_addr),
        .read_data_o(bram_data)
    );
    
    gpu dut (
        .gpu_clk_i(gpu_clk),
        .reset_i(reset),

        .bram_en_o(bram_en),
        .bram_addr_o(bram_addr),
        .bram_dout_i(bram_data),

        .vga_clk_i(vga_clk),

        .VGA_R_o(VGA_R),
        .VGA_G_o(VGA_G),
        .VGA_B_o(VGA_B),

        .VGA_HS_o(VGA_HS),
        .VGA_VS_o(VGA_VS)
    );

    initial gpu_clk = 0;
    always #(GPU_CLK_PERIOD / 2.0)
        gpu_clk = ~gpu_clk;

    initial vga_clk = 0;
    always #(VGA_CLK_PERIOD / 2.0)
        vga_clk = ~vga_clk;

    initial begin
        $dumpvars(0, tb_gpu);

        set_color_palette <= 0;
        // hold reset for 10 ns
        reset <= 1;
        #(VGA_CLK_PERIOD)
        reset <= 0;

        // simulate 3 frames
        #(VGA_CLK_PERIOD*1056*628*1)

        set_color_palette <= 1;
        #(VGA_CLK_PERIOD*5)
        set_color_palette <= 0;

        #(VGA_CLK_PERIOD*1056*628*2)

        // hold reset for 50 ns
        reset <= 1;
        #50
        reset <= 0;

        #20 $finish;
    end

endmodule
