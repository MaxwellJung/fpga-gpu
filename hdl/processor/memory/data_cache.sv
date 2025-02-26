module DataCache #(
    parameter WORD_COUNT = 128,
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
    logic [WORD_BITS-1:0] ram[WORD_COUNT];

    logic [$clog2(WORD_COUNT)-1:0] wordindex;
    assign wordindex = address[ADDR_BITS-1:$clog2(BYTES_PER_WORD)];

    always_ff @(posedge clk) begin
        if (reset) begin
//            ram <= '0;
        end
        else begin
            if (wr_en) begin
                ram[wordindex] <= wr_data;
            end
        end
    end

    always_comb begin
        rd_data = ram[wordindex];
    end

endmodule
