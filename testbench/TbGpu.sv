`timescale 1ns / 1ps

module TbGpu();
    localparam GPU_CLK_PERIOD = 10; // 100MHz clock
    localparam SIMU_CLK_CYCLES = 100000; // number of clock cycles to simulate
    localparam VGA_CLK_PERIOD = 25; // 40MHz clock

    logic gpu_clk, vga_clk;
    logic reset;

    Gpu u_Gpu (
        .gpu_clk               (gpu_clk),
        .vga_clk               (vga_clk),
        .reset                 (reset),
        // I/O register interface
        .cpu_io_reg_addr       (cpu_io_reg_addr),
        .cpu_io_reg_clk        (cpu_io_reg_clk),
        .cpu_io_reg_din        (cpu_io_reg_din),
        .cpu_io_reg_dout       (cpu_io_reg_dout),
        .cpu_io_reg_en         (cpu_io_reg_en),
        .cpu_io_reg_rst        (cpu_io_reg_rst),
        .cpu_io_reg_we         (cpu_io_reg_we),
        // Video out interface
        .vga_hs                (vga_hs),
        .vga_vs                (vga_vs),
        .vga_r                 (vga_r),
        .vga_g                 (vga_g),
        .vga_b                 (vga_b)
    );

    // generate clock
    always begin
        gpu_clk <= 1; # (GPU_CLK_PERIOD/2); gpu_clk <= 0; # (GPU_CLK_PERIOD/2);
    end
    always begin
        vga_clk <= 1; # (VGA_CLK_PERIOD/2+0.5); vga_clk <= 0; # (VGA_CLK_PERIOD/2+0.5);
    end

    // check results
    initial begin
        $dumpfile("./build/sim/TbGpu.vcd"); 
        $dumpvars(0, TbGpu);

        // hold reset for 2 VGA clk
        reset <= 1; # (2*VGA_CLK_PERIOD); reset <= 0;

        #(SIMU_CLK_CYCLES*GPU_CLK_PERIOD)

        $finish;
    end

endmodule
