module io_registers #(
    parameter CAPACITY_BYTES = 128,
    parameter WORD_BYTES = 4
) (
    // CPU interface
    input logic port_a_clk,
    input logic port_a_reset,
    input logic [$clog2(CAPACITY_BYTES)-1:0] port_a_address,
    output logic [8*WORD_BYTES-1:0] port_a_rd_data,
    input logic port_a_rd_en,
    input logic [8*WORD_BYTES-1:0] port_a_wr_data,
    input logic [WORD_BYTES-1:0] port_a_wr_en,

    // GPU interface
    input logic port_b_clk,
    input logic port_b_reset,
    input logic [$clog2(CAPACITY_BYTES)-1:0] port_b_address,
    output logic [8*WORD_BYTES-1:0] port_b_rd_data,
    input logic port_b_rd_en,
    input logic [8*WORD_BYTES-1:0] port_b_wr_data,
    input logic [WORD_BYTES-1:0] port_b_wr_en
);

    block_memory #(
        .CAPACITY_BYTES    (CAPACITY_BYTES),
        .WORD_BYTES        (WORD_BYTES)
    ) block_memory_inst_0 (
        // CPU side interface
        .port_a_clk        (port_a_clk),
        .port_a_reset      (port_a_reset),
        .port_a_address    (port_a_address),
        .port_a_rd_data    (port_a_rd_data),
        .port_a_rd_en      (port_a_rd_en),
        .port_a_wr_data    (port_a_wr_data),
        .port_a_wr_en      (port_a_wr_en),
        // GPU side interface
        .port_b_clk        (port_b_clk),
        .port_b_reset      (port_b_reset),
        .port_b_address    (port_b_address),
        .port_b_rd_data    (port_b_rd_data),
        .port_b_rd_en      (port_b_rd_en),
        .port_b_wr_data    (port_b_wr_data),
        .port_b_wr_en      (port_b_wr_en)
    );

endmodule
