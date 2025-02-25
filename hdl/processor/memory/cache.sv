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
    input logic clk,
    input logic reset,

    input logic [ADDR_BITS-1:0] address,
    // hit on way 0 = hits[0], ... , hit on way i = hits[i]
    output logic [WAY_COUNT-1:0] hits,
    output logic [WORD_BITS-1:0] rd_word,
    input logic [WORDS_PER_BLOCK-1:0][WORD_BITS-1:0] wr_block,
    input logic [WAY_COUNT-1:0] wr_ens
);
    logic [ADDR_BITS-$clog2(SET_COUNT)-$clog2(WORDS_PER_BLOCK)-$clog2(BYTES_PER_WORD)-1:0] tag;
    logic [$clog2(SET_COUNT)-1:0] setndex;
    logic [$clog2(WORDS_PER_BLOCK)-1:0] wordndex;
    logic [$clog2(BYTES_PER_WORD)-1:0] bytendex;
    CacheAddrDecoder #(
        .WORD_WORD_CAPACITY (WORD_CAPACITY),
        .WORDS_PER_BLOCK    (WORDS_PER_BLOCK),
        .WAY_COUNT          (WAY_COUNT),
        .ADDR_BITS          (ADDR_BITS),
        .WORD_BITS          (WORD_BITS)
    ) cache_addr_decoder (
        .address          (address),
        .tag              (tag),
        .set_index        (setndex),
        .word_index       (wordndex),
        .byte_index       (bytendex)
    );

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
                .clk              (clk),
                .reset            (reset),
                .tag              (tag),
                .set_index        (setndex),
                .word_index       (wordndex),
                .byte_index       (bytendex),
                .hit              (hits[i]),
                .rd_block         (rd_blocks[i]),
                .wr_block         (wr_block),
                .wr_en            (wr_ens[i])
            );
        end
    endgenerate

    int j;
    always_comb begin
        // default value if no hits
        rd_word = '0;
        for (j = 0; j < WAY_COUNT; j = j+1)
            if (hits[j])
                rd_word = rd_blocks[j][bytendex];
    end

endmodule

