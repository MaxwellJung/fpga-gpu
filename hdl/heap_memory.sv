module heap_memory #(
    parameter INIT_FILE = "build/firmware/gputest.mem",
    parameter CAPACITY_BYTES = 2048,
    parameter WORD_BYTES = 4
) (
    // Write interface from CPU side
    input  logic        port_a_clk,
    input  logic [31:0] port_a_addr,
    input  logic [31:0] port_a_wr_data,
    input  logic [3:0]  port_a_wr_en,

    // Read/Write interface from GPU side
    input  logic        port_b_clk,
    input  logic [31:0] port_b_address,
    output logic [31:0] port_b_rd_data,
    input  logic [31:0] port_b_wr_data,
    input  logic [3:0]  port_b_wr_en
);

    block_memory #(
        .INIT_FILE         (INIT_FILE),
        .CAPACITY_BYTES    (CAPACITY_BYTES),
        .WORD_BYTES        (WORD_BYTES)
    ) block_memory_inst_0 (
        // CPU data memory interface (write only)
        .port_a_clk        (port_a_clk),
        .port_a_reset      ('0),
        .port_a_address    (port_a_addr),
        .port_a_rd_data    (),
        .port_a_rd_en      ('0),
        .port_a_wr_data    (port_a_wr_data),
        .port_a_wr_en      (port_a_wr_en),
        // GPU data memory interface (read/write)
        .port_b_clk        (port_b_clk),
        .port_b_reset      ('0),
        .port_b_address    (port_b_address),
        .port_b_rd_data    (port_b_rd_data),
        .port_b_rd_en      ('1),
        .port_b_wr_data    (port_b_wr_data),
        .port_b_wr_en      (port_b_wr_en)
    );

endmodule
