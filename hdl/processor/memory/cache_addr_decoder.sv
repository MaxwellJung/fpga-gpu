module CacheAddrDecoder #(
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
    input logic [ADDR_BITS-1:0] address_i,
    
    output logic [ADDR_BITS-$clog2(SET_COUNT)-$clog2(WORDS_PER_BLOCK)-$clog2(BYTES_PER_WORD)-1:0] tag_o,
    output logic [$clog2(SET_COUNT)-1:0] set_index_o,
    output logic [$clog2(WORDS_PER_BLOCK)-1:0] word_index_o,
    output logic [$clog2(BYTES_PER_WORD)-1:0] byte_index_o
);
    assign {tag_o, set_index_o, word_index_o, byte_index_o} = address_i;

endmodule
