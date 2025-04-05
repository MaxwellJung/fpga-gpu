// Create a single way (a.k.a direct mapped cache set)
// read/write to cache location that maches set
// without checking for hit/miss or other conditions
module CacheWay #(
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

    input logic [ADDR_BITS-$clog2(SET_COUNT)-$clog2(WORDS_PER_BLOCK)-$clog2(BYTES_PER_WORD)-1:0] tag,
    input logic [$clog2(SET_COUNT)-1:0] set_index,
    input logic [$clog2(WORDS_PER_BLOCK)-1:0] word_index,
    input logic [$clog2(BYTES_PER_WORD)-1:0] byte_index,
    output logic hit,
    output logic [WORDS_PER_BLOCK-1:0][WORD_BITS-1:0] rd_block,
    input logic [WORDS_PER_BLOCK-1:0][WORD_BITS-1:0] wr_block,
    input logic wr_en
);
    typedef struct packed {
        logic valid;
        logic [ADDR_BITS-$clog2(SET_COUNT)-$clog2(WORDS_PER_BLOCK)-$clog2(BYTES_PER_WORD)-1:0] tag;
        logic [WORDS_PER_BLOCK-1:0][WORD_BITS-1:0] block;
    } cache_entry_t;
    
    cache_entry_t cache_sets[SET_COUNT];

    int i;
    always_ff @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < SET_COUNT; i++) begin
                cache_sets[i] <= '0;
            end
        end
        else begin
            if (wr_en) begin
                cache_sets[set_index].valid <= 1'b1;
                cache_sets[set_index].tag <= tag;
                cache_sets[set_index].block <= wr_block;
            end
        end
    end

    always_comb begin
        hit = cache_sets[set_index].valid && (cache_sets[set_index].tag == tag);
        rd_block = cache_sets[set_index].block;
    end

endmodule
