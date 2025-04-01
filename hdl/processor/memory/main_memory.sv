module main_memory #(
    parameter INIT_FILE = "build/gputest.mem",
    parameter CAPACITY_BYTES = 128,
    parameter BYTES_PER_WORD = 4,
    localparam WORD_BITS = BYTES_PER_WORD*8,
    localparam WORD_COUNT = CAPACITY_BYTES/BYTES_PER_WORD,
    localparam ADDR_BITS = $clog2(CAPACITY_BYTES)
) (
    input logic clk,

    input logic port_a_reset,
    input logic [ADDR_BITS-1:0] port_a_address,
    output logic [WORD_BITS-1:0] port_a_rd_data,
    input logic port_a_rd_en,
    input logic [WORD_BITS-1:0] port_a_wr_data,
    input logic [BYTES_PER_WORD-1:0] port_a_wr_en,

    input logic port_b_reset,
    input logic [ADDR_BITS-1:0] port_b_address,
    output logic [WORD_BITS-1:0] port_b_rd_data,
    input logic port_b_rd_en,
    input logic [WORD_BITS-1:0] port_b_wr_data,
    input logic [BYTES_PER_WORD-1:0] port_b_wr_en
);
    BlockMemory #(
        .INIT_FILE         (INIT_FILE),
        .CAPACITY_BYTES    (CAPACITY_BYTES),
        .BYTES_PER_WORD    (BYTES_PER_WORD)
    ) u_BlockMemory (
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
