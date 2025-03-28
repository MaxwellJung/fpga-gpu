module main_memory #(
    parameter INIT_FILE = "build/gputest.mem",
    parameter WORD_BITS = 32,
    localparam BYTES_PER_WORD = WORD_BITS/8,
    parameter CAPACITY_BYTES = 128,
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

        for (int i = 0; i < BYTES_PER_WORD; i++) begin
            if (port_a_wr_en[i]) begin
                bram[port_a_word_index][i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
            end
        end
    end

    always_ff @(posedge clk) begin
        if (port_b_reset)
            port_b_rd_data <= '0;
        else
            if (port_b_rd_en)
                port_b_rd_data <= bram[port_b_word_index];

        for (int j = 0; j < BYTES_PER_WORD; j++) begin
            if (port_b_wr_en[j]) begin
                bram[port_b_word_index][j*8 +: 8] <= port_b_wr_data[j*8 +: 8];
            end
        end
    end

endmodule
