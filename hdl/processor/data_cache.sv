module DataCache #(
    parameter INIT_FILE = "data/gpu_data_init.mem",
    parameter WORD_COUNT = 64,
    parameter WORD_BITS = 32,
    localparam BYTES_PER_WORD = WORD_BITS/8,
    localparam ADDR_BITS = $clog2(WORD_COUNT*BYTES_PER_WORD)
) (
    input logic clk_i,
    input logic reset_i,

    input logic [ADDR_BITS-1:0] address_i,
    output logic [WORD_BITS-1:0] rd_data_o,
    input logic [WORD_BITS-1:0] wr_data_i,
    input logic wr_en_i
);
    logic [WORD_BITS-1:0] ram [WORD_COUNT];
    initial $readmemh(INIT_FILE, ram);

    logic [$clog2(WORD_COUNT)-1:0] word_addr;
    assign word_addr = address_i >> $clog2(BYTES_PER_WORD);

    always_ff @(posedge clk_i) begin
        if (wr_en_i) begin
            ram[word_addr] <= wr_data_i;
        end
    end

    always_comb begin
        rd_data_o = ram[word_addr];
    end

endmodule