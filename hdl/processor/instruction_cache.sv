module InstructionCache #(
    parameter INIT_FILE = "data/gpu_inst_init.mem",
    parameter WORD_COUNT = 64,
    parameter WORD_BITS = 32,
    localparam BYTES_PER_WORD = WORD_BITS/8,
    localparam ADDR_BITS = $clog2(WORD_COUNT*BYTES_PER_WORD)
) (
    input logic [ADDR_BITS-1:0] address_i,
    output logic [WORD_BITS-1:0] rd_data_o
);
    logic [WORD_BITS-1:0] ram [WORD_COUNT];
    initial $readmemh(INIT_FILE, ram);

    logic [$clog2(WORD_COUNT)-1:0] word_addr;
    always_comb begin
        word_addr = address_i >> $clog2(BYTES_PER_WORD);
        rd_data_o = ram[word_addr];
    end

endmodule