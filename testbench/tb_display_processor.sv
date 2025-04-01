`timescale 1ns / 1ps

module TbDisplayProcessor();
    localparam GPU_CLK_PERIOD = 10; // 100MHz clock
    localparam SIMU_CLK_CYCLES = 10000; // number of clock cycles to simulate
    localparam INIT_FILE = "build/gputest.mem";
    localparam MAIN_MEMORY_BYTES = 2048;
    localparam RESOLUTION_X = 400;
    localparam RESOLUTION_Y = 300;
    localparam PALETTE_LENGTH = 256;
    localparam COLOR_BITS = 12;
    
    logic clk;
    logic reset;

    logic inst_reset;
    logic [$clog2(MAIN_MEMORY_BYTES)-1:0] inst_addr;
    logic [31:0] inst_rd_data;
    logic inst_rd_en;

    logic [$clog2(MAIN_MEMORY_BYTES)-1:0] data_mem_addr;
    logic [31:0] data_mem_rd_data;
    logic [31:0] data_mem_wr_data;
    logic [3:0] data_mem_wr_en;

    // instantiate device to be tested
    DisplayProcessor u_DisplayProcessor (
        .clk                 (clk),
        .reset               (reset),
        // Instruction memory
        .inst_reset          (inst_reset),
        .inst_addr           (inst_addr),
        .inst_rd_data        (inst_rd_data),
        .inst_rd_en          (inst_rd_en),
        // Data memory
        .data_mem_addr       (data_mem_addr),
        .data_mem_rd_data    (data_mem_rd_data),
        .data_mem_wr_data    (data_mem_wr_data),
        .data_mem_wr_en      (data_mem_wr_en),
        // I/O reg
        .io_reg_addr         (io_reg_addr),
        .io_reg_rd_data      (io_reg_rd_data),
        .io_reg_wr_data      (io_reg_wr_data),
        .io_reg_wr_en        (io_reg_wr_en),
        // color palette
        .palette_wr_addr     (palette_wr_addr),
        .palette_wr_data     (palette_wr_data),
        .palette_wr_en       (palette_wr_en),
        // framebuffer
        .fb_wr_addr          (fb_wr_addr),
        .fb_wr_data          (fb_wr_data),
        .fb_wr_en            (fb_wr_en)
    );

    main_memory #(
        .INIT_FILE         (INIT_FILE),
        .WORD_BITS         (32),
        .CAPACITY_BYTES    (MAIN_MEMORY_BYTES)
    ) u_main_memory (
        .clk               (clk),
        // instruction
        .port_a_reset      (inst_reset),
        .port_a_address    (inst_addr),
        .port_a_rd_data    (inst_rd_data),
        .port_a_rd_en      (inst_rd_en),
        .port_a_wr_data    ('0),
        .port_a_wr_en      ('0),
        // data
        .port_b_reset      ('0),
        .port_b_address    (data_mem_addr),
        .port_b_rd_data    (data_mem_rd_data),
        .port_b_rd_en      ('1),
        .port_b_wr_data    (data_mem_wr_data),
        .port_b_wr_en      (data_mem_wr_en)
    );

    // generate clock to sequence tests
    always begin
        clk <= 1; # (GPU_CLK_PERIOD/2); clk <= 0; # (GPU_CLK_PERIOD/2);
    end

    // check results
    initial begin
        $dumpvars(0, TbDisplayProcessor);

        // hold gpu_reset for 22 ns
        reset <= 1; # 22; reset <= 0;

        #(SIMU_CLK_CYCLES*GPU_CLK_PERIOD)

        $finish;
    end

endmodule
