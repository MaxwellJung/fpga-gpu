module register_file #(
    parameter REG_COUNT = 32,
    parameter REG_WIDTH = 32
) (
    input logic clk,
    input logic reset,

    input logic [$clog2(REG_COUNT)-1:0] rs1,
    input logic [$clog2(REG_COUNT)-1:0] rs2,

    output logic [REG_WIDTH-1:0] rs1_value,
    output logic [REG_WIDTH-1:0] rs2_value,

    input logic [$clog2(REG_COUNT)-1:0] rd,
    input logic [REG_WIDTH-1:0] rd_value,
    input logic wr_en
);

    logic [REG_COUNT-1:0][REG_WIDTH-1:0] registers;

    always_ff @(negedge clk) begin
        if (reset) begin
            registers <= '0;
        end else begin
            if (wr_en && (rd != 0)) begin
                registers[rd] <= rd_value;
            end
        end
    end

    always_comb begin
        rs1_value = registers[rs1];
        rs2_value = registers[rs2];
    end

endmodule