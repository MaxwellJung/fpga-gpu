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

    logic [REG_WIDTH-1:0] registers [REG_COUNT];

    int i;
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            for (i = 0; i < REG_COUNT; i=i+1) begin
                registers[i] <= '0;
            end
        end else begin
            if (wr_en_i) begin
                registers[address_3_i] <= wr_data_i;
            end
        end
    end

    always_comb begin
        rd_data_1_o = registers[address_1_i];
        rd_data_2_o = registers[address_2_i];
    end

endmodule