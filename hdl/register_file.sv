module RegisterFile #(
    parameter REG_COUNT = 32,
    parameter REG_WIDTH = 32
) (
    input logic clk_i,
    input logic reset_i,

    input logic [$clog2(REG_COUNT)-1:0] address_1_i,
    input logic [$clog2(REG_COUNT)-1:0] address_2_i,

    output logic [REG_WIDTH-1:0] rd_data_1_o,
    output logic [REG_WIDTH-1:0] rd_data_2_o,

    input logic [$clog2(REG_COUNT)-1:0] address_3_i,
    input logic [REG_WIDTH-1:0] wr_data_i,
    input logic wr_en_i
);

    logic [REG_WIDTH-1:0] ram [REG_COUNT];

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            rd_data_1_o <= '0;
            rd_data_2_o <= '0;
        end else begin
            rd_data_1_o <= ram[address_1_i];
            rd_data_2_o <= ram[address_2_i];
            if (wr_en_i) begin
                ram[address_3_i] <= wr_data_i;
            end
        end
    end

endmodule