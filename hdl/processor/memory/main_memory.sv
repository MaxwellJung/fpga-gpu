module main_memory #(
    parameter INIT_FILE = "build/gputest.mem",
    parameter WORD_COUNT = 64,
    parameter WORD_BITS = 32,
    localparam BYTES_PER_WORD = WORD_BITS/8,
    localparam ADDR_BITS = $clog2(WORD_COUNT*BYTES_PER_WORD)
) (
    input logic clk,

    input logic port_a_reset,
    input logic [ADDR_BITS-1:0] port_a_address,
    output logic [WORD_BITS-1:0] port_a_rd_data,
    input logic port_a_rd_en,
    input logic [WORD_BITS-1:0] port_a_wr_data,
    input logic port_a_wr_en,

    input logic port_b_reset,
    input logic [ADDR_BITS-1:0] port_b_address,
    output logic [WORD_BITS-1:0] port_b_rd_data,
    input logic port_b_rd_en,
    input logic [WORD_BITS-1:0] port_b_wr_data,
    input logic port_b_wr_en
);
    logic [WORD_BITS-1:0] bram [WORD_COUNT];
    initial $readmemh(INIT_FILE, bram);

    logic [$clog2(WORD_COUNT)-1:0] port_a_word_index, port_b_word_index;
    assign port_a_word_index = port_a_address[ADDR_BITS-1:$clog2(BYTES_PER_WORD)];
    assign port_b_word_index = port_b_address[ADDR_BITS-1:$clog2(BYTES_PER_WORD)];

    always_ff @(posedge clk) begin
        if (port_a_reset)
            port_a_rd_data <= '0;
        else
            if (port_a_rd_en)
                port_a_rd_data <= bram[port_a_word_index];

        if (port_a_wr_en) begin
            bram[port_a_word_index] <= port_a_wr_data;
        end
    end

    always_ff @(posedge clk) begin
        if (port_b_reset)
            port_b_rd_data <= '0;
        else
            if (port_b_rd_en)
                port_b_rd_data <= bram[port_b_word_index];

        if (port_b_wr_en) begin
            bram[port_b_word_index] <= port_b_wr_data;
        end
    end

endmodule
