module RegisterFile #(
    parameter REG_COUNT = 32,
    parameter REG_WIDTH = 32
) (
    input logic clk,
    input logic reset,

    input logic [$clog2(REG_COUNT)-1:0] address_1,
    input logic [$clog2(REG_COUNT)-1:0] address_2,

    output logic [REG_WIDTH-1:0] rd_data_1,
    output logic [REG_WIDTH-1:0] rd_data_2,

    input logic [$clog2(REG_COUNT)-1:0] address_3,
    input logic [REG_WIDTH-1:0] wr_data,
    input logic wr_en
);

    logic [REG_COUNT-1:0][REG_WIDTH-1:0] registers;

    always_ff @(negedge clk) begin
        if (reset) begin
            registers <= '0;
        end else begin
            if (wr_en && (address_3 != 0)) begin
                registers[address_3] <= wr_data;
            end
        end
    end

    always_comb begin
        rd_data_1 = registers[address_1];
        rd_data_2 = registers[address_2];
    end

endmodule