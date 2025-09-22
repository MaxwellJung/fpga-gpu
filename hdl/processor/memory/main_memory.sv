module main_memory #(
    parameter INIT_FILE = "data/gpu_mem_init.mem",
    parameter CAPACITY_BYTES = 4096,
    parameter WORD_BYTES = 4
) (
    input logic clk,

    input  logic                              port_a_reset,
    input  logic [$clog2(CAPACITY_BYTES)-1:0] port_a_address,
    output logic [8*WORD_BYTES-1:0]           port_a_rd_data,
    input  logic                              port_a_rd_en,
    input  logic [8*WORD_BYTES-1:0]           port_a_wr_data,
    input  logic [WORD_BYTES-1:0]             port_a_wr_en,

    input  logic                              port_b_reset,
    input  logic [$clog2(CAPACITY_BYTES)-1:0] port_b_address,
    output logic [8*WORD_BYTES-1:0]           port_b_rd_data,
    input  logic                              port_b_rd_en,
    input  logic [8*WORD_BYTES-1:0]           port_b_wr_data,
    input  logic [WORD_BYTES-1:0]             port_b_wr_en
);
    block_memory #(
        .INIT_FILE         (INIT_FILE),
        .CAPACITY_BYTES    (CAPACITY_BYTES),
        .WORD_BYTES    (WORD_BYTES)
    ) block_memory_inst_0 (
        // Port A
        .port_a_clk        (clk),
        .port_a_reset      (port_a_reset),
        .port_a_address    (port_a_address),
        .port_a_rd_data    (port_a_rd_data),
        .port_a_rd_en      (port_a_rd_en),
        .port_a_wr_data    (port_a_wr_data),
        .port_a_wr_en      (port_a_wr_en),
        // Port B
        .port_b_clk        (clk),
        .port_b_reset      (port_b_reset),
        .port_b_address    (port_b_address),
        .port_b_rd_data    (port_b_rd_data),
        .port_b_rd_en      (port_b_rd_en),
        .port_b_wr_data    (port_b_wr_data),
        .port_b_wr_en      (port_b_wr_en)
    );

endmodule
