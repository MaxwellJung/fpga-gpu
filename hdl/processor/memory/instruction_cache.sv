module InstructionCache #(
    parameter INIT_FILE = "build/gputest.mem",
    parameter WORD_COUNT = 64,
    parameter WORD_BITS = 32,
    localparam BYTES_PER_WORD = WORD_BITS/8,
    localparam ADDR_BITS = $clog2(WORD_COUNT*BYTES_PER_WORD)
) (
    input logic [ADDR_BITS-1:0] address,
    output logic [WORD_BITS-1:0] rd_data
);
    logic [WORD_BITS-1:0] ram[WORD_COUNT];
    initial $readmemh(INIT_FILE, ram);

    logic [$clog2(WORD_COUNT)-1:0] wordndex;
    always_comb begin
        wordndex = address[ADDR_BITS-1:$clog2(BYTES_PER_WORD)];
        rd_data = ram[wordndex];
    end

endmodule
