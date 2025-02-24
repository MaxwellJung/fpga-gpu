`timescale 1ns / 1ps

module TbDisplayProcessor();
    localparam GPU_CLK_PERIOD = 10; // 100MHz clock
    localparam RESOLUTION_X = 400;
    localparam RESOLUTION_Y = 300;
    localparam PALETTE_LENGTH = 256;
    localparam COLOR_BITS = 12;
    
    logic gpu_clk;
    logic gpu_reset;
    logic [31:0] gpu_status;
    logic [31:0] gpu_control;

    // instantiate device to be tested
    DisplayProcessor #(
        .RESOLUTION_X(RESOLUTION_X),
        .RESOLUTION_Y(RESOLUTION_Y),
        .PALETTE_LENGTH(PALETTE_LENGTH),
        .COLOR_BITS(COLOR_BITS)
    ) display_processor (
        .clk_i(gpu_clk),
        .reset_i(gpu_reset),

        .status_o(gpu_status),
        .control_i(gpu_control),

        .fb_wr_x_o(),
        .fb_wr_y_o(),
        .fb_wr_index_o(),
        .fb_wr_en_o(),

        .palette_wr_index_o(),
        .palette_wr_color_o(),
        .palette_wr_en_o()
    );

    // generate clock to sequence tests
    always begin
        gpu_clk <= 1; # (GPU_CLK_PERIOD/2); gpu_clk <= 0; # (GPU_CLK_PERIOD/2);
    end

    // check results
    initial begin
        $dumpvars(0, TbDisplayProcessor);

        gpu_control <= 0;
        // hold gpu_reset for 22 ns
        gpu_reset <= 1; # 22; gpu_reset <= 0;

        // simulate 500 gpu cycles
        #(500*GPU_CLK_PERIOD)

        $finish;
    end

endmodule