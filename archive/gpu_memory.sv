module GpuMemory #(
    parameter INIT_FILE = "data/gpu_mem_init.mem",
    parameter WORD_COUNT = 64,
    parameter WORD_BITS = 32,
    localparam BYTES_PER_WORD = WORD_BITS/8,
    localparam ADDR_BITS = $clog2(WORD_COUNT*BYTES_PER_WORD)
) (
    input logic clk,
    input logic reset,

    input logic [ADDR_BITS-1:0] address,
    output logic [WORD_BITS-1:0] rd_data,
    input logic [WORD_BITS-1:0] wr_data,
    input logic wr_en
);
    logic [WORD_BITS-1:0] ram [WORD_COUNT];
    initial $readmemh(INIT_FILE, ram);

    logic [$clog2(WORD_COUNT)-1:0] word_addr;
    assign word_addr = address >> $clog2(BYTES_PER_WORD);

    always_ff @(posedge clk) begin
        if (wr_en) begin
            ram[word_addr] <= wr_data;
        end
    end

    always_comb begin
        rd_data = ram[word_addr];
    end

endmodule