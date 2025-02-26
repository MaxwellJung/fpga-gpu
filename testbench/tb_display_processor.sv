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
        .INIT_FILE           ("build/gputest.mem"),
        .RESOLUTION_X        (RESOLUTION_X),
        .RESOLUTION_Y        (RESOLUTION_Y),
        .PALETTE_LENGTH      (PALETTE_LENGTH),
        .COLOR_BITS          (COLOR_BITS)
    ) u_DisplayProcessor (
        .clk                 (gpu_clk),
        .reset               (gpu_reset),
        // memory mapped i/o
        .status              (gpu_status),
        .control             (gpu_control),
        // color palette
        .palette_wr_index    (),
        .palette_wr_color    (),
        .palette_wr_en       (),
        // framebuffer
        .fb_pxl_index        (),
        .fb_pxl_value        (),
        .fb_wr_en            ()
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

        #(10000*GPU_CLK_PERIOD)

        $finish;
    end

endmodule
