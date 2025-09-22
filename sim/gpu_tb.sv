`timescale 1ns / 1ps

module gpu_tb();
    localparam CPU_CLK_PERIOD = 10; // 100MHz clock
    localparam GPU_CLK_PERIOD = 10; // 100MHz clock
    localparam VGA_CLK_PERIOD = 25; // 40MHz clock

    localparam SIMU_CLK_CYCLES = 1000000; // number of clock cycles to simulate
    localparam INIT_FILE = "build/gputest.mem";
    localparam MAIN_MEMORY_BYTES = 2048;
    localparam RESOLUTION_X = 400;
    localparam RESOLUTION_Y = 300;
    localparam PALETTE_LENGTH = 256;
    localparam COLOR_BITS = 12;
    
    logic cpu_clk;
    logic gpu_clk;
    logic vga_clk;
    logic reset;

    // instantiate device to be tested
    gpu gpu_inst_0 (
        .gpu_clk                 (gpu_clk),
        .reset                   (reset),

        // IO registers interface
        .io_reg_port_a_clk       (cpu_clk),
        .io_reg_port_a_reset     (reset),
        .io_reg_port_a_addr      (8),
        .io_reg_port_a_rd_data   (),
        .io_reg_port_a_rd_en     ('0),
        .io_reg_port_a_wr_data   (32'h00000010),
        .io_reg_port_a_wr_en     (4'b1111),

        // AXI-Stream interface to data memory
        .axis_clk               (cpu_clk),
        .axis_aresetn           (!reset),

        .axis_tdata             (32'hF0F0F0F0),
        .axis_tkeep             (4'b1111),
        .axis_tlast             (),
        .axis_tvalid            (1),
        .axis_tready            (),

        // vga interface
        .vga_clk (vga_clk),
        .vga_hs  (),
        .vga_vs  (),
        .vga_r   (),
        .vga_g   (),
        .vga_b   ()
    );

    // generate clocks
    always begin
        cpu_clk <= 1; # (CPU_CLK_PERIOD/2); cpu_clk <= 0; # (CPU_CLK_PERIOD/2);
    end
    always begin
        gpu_clk <= 1; # (GPU_CLK_PERIOD/2); gpu_clk <= 0; # (GPU_CLK_PERIOD/2);
    end
    always begin
        vga_clk <= 1; # (VGA_CLK_PERIOD/2); vga_clk <= 0; # (VGA_CLK_PERIOD/2);
    end

    // check results
    initial begin
        $dumpfile("gpu_tb.vcd");
        $dumpvars(0, gpu_tb);

        // hold gpu_reset for 22 ns
        reset <= 1; # 22; reset <= 0;

        #(SIMU_CLK_CYCLES*GPU_CLK_PERIOD)

        $finish;
    end

endmodule
