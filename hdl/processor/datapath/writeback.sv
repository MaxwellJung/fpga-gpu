module Writeback (
    input logic clk,
    input logic reset,

    // input from memory stage
    input logic [31:0] m_alu_result,
    input logic [4:0] m_rd,
    input logic [31:0] m_pc_plus_4,

    // input from data memory
    input logic [31:0] w_read_data,

    // input from control
    input logic [1:0] w_result_src,

    // output to register file
    output logic [31:0] w_result,
    output logic [4:0] w_rd
);
    logic [31:0] w_alu_result;
    logic [31:0] w_pc_plus_4;
    always_ff @(posedge clk) begin
        if (reset) begin
            {w_alu_result, w_rd, w_pc_plus_4} <= '0;
        end else begin
            {w_alu_result, w_rd, w_pc_plus_4} <= 
            {m_alu_result, m_rd, m_pc_plus_4};
        end
    end

    always_comb begin
        case (w_result_src)
            2'b00: w_result = w_alu_result;
            2'b01: w_result = w_read_data;
            2'b10: w_result = w_pc_plus_4;
            default: w_result = '0;
        endcase
    end

endmodule
