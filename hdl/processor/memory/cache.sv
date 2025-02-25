module Cache #(
    // C (in words)
    parameter WORD_CAPACITY = 8,
    // b (in words)
    parameter WORDS_PER_BLOCK = 4,
    // N (1 <= N <= B)
    parameter WAY_COUNT = 1,
    // B
    localparam BLOCK_COUNT = WORD_CAPACITY/WORDS_PER_BLOCK,
    // S
    localparam SET_COUNT = BLOCK_COUNT/WAY_COUNT,
    parameter ADDR_BITS = 32,
    parameter WORD_BITS = 32,
    localparam BYTES_PER_WORD = WORD_BITS/8
) (
    input logic clk_i,
    input logic reset_i,

    input logic [ADDR_BITS-1:0] address_i,
    output logic [WAY_COUNT-1:0] hits_o,
    output logic [WORD_BITS-1:0] rd_word_o,
    input logic [WORDS_PER_BLOCK-1:0][WORD_BITS-1:0] wr_block_i,
    input logic [WAY_COUNT-1:0] wr_ens_i
);
    logic [ADDR_BITS-$clog2(SET_COUNT)-$clog2(WORDS_PER_BLOCK)-$clog2(BYTES_PER_WORD)-1:0] tag;
    logic [$clog2(SET_COUNT)-1:0] set_index;
    logic [$clog2(WORDS_PER_BLOCK)-1:0] word_index;
    logic [$clog2(BYTES_PER_WORD)-1:0] byte_index;
    CacheAddrDecoder #(
        .WORD_WORD_CAPACITY (WORD_CAPACITY),
        .WORDS_PER_BLOCK    (WORDS_PER_BLOCK),
        .WAY_COUNT          (WAY_COUNT),
        .ADDR_BITS          (ADDR_BITS),
        .WORD_BITS          (WORD_BITS)
    ) cache_addr_decoder (
        .address_i          (address_i),
        .tag_o              (tag),
        .set_index_o        (set_index),
        .word_index_o       (word_index),
        .byte_index_o       (byte_index)
    );

    // hit on way 0 = hits[0], ... , hit on way i = hits[i]
    // easier to perform array-wise OR on [7:0] hits than hits[8]
    logic [WAY_COUNT-1:0] hits;
    logic [WAY_COUNT-1:0][WORDS_PER_BLOCK-1:0][WORD_BITS-1:0] rd_blocks;
    generate
        genvar i;
        // instantiate new cache column for each way
        for (i = 0; i < WAY_COUNT; i = i+1) begin
            CacheWay #(
                .WORD_WORD_CAPACITY      (WORD_CAPACITY),
                .WORDS_PER_BLOCK    (WORDS_PER_BLOCK),
                .WAY_COUNT          (WAY_COUNT),
                .ADDR_BITS          (ADDR_BITS),
                .WORD_BITS          (WORD_BITS)
            ) cache_way (
                .clk_i              (clk_i),
                .reset_i            (reset_i),
                .tag_i              (tag),
                .set_index_i        (set_index),
                .word_index_i       (word_index),
                .byte_index_i       (byte_index),
                .hit_o              (hits[i]),
                .rd_block_o         (rd_blocks[i]),
                .wr_block_i         (wr_block_i),
                .wr_en_i            (wr_ens_i[i])
            );
        end
    endgenerate

    int j;
    always_comb begin
        hits_o = |hits;
        // default value if no hits
        rd_word_o = '0;
        for (j = 0; j < WAY_COUNT; j = j+1)
            if (hits[j])
                rd_word_o = rd_blocks[j][byte_index];
    end

endmodule

