`ifndef WRITEBACK_H
`define WRITEBACK_H

module Writeback (
    input logic clk_i,
    input logic reset_i,

    input logic [31:0] alu_result_m_i,
    input logic [31:0] read_data_m_i,
    input logic [4:0] rd_m_i,
    input logic [31:0] pc_plus_4_m_i,

    input logic [1:0] result_src_w_i,

    output logic [31:0] result_w_o,
    output logic [4:0] rd_w_o
);
    logic [31:0] alu_result_w;
    logic [31:0] read_data_w;
    logic [4:0] rd_w;
    logic [31:0] pc_plus_4_w;
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            {alu_result_w, read_data_w, rd_w, pc_plus_4_w} <= '0;
        end else begin
            {alu_result_w, read_data_w, rd_w, pc_plus_4_w} <= 
            {alu_result_m_i, read_data_m_i, rd_m_i, pc_plus_4_m_i};
        end
    end

    logic [31:0] result_w;
    always_comb begin
        case (result_src_w_i)
            2'b00: result_w = alu_result_w;
            2'b01: result_w = read_data_w;
            2'b10: result_w = pc_plus_4_w;
            default: result_w = '0;
        endcase
    end

    always_comb begin
        result_w_o = result_w;
        rd_w_o = rd_w;
    end

endmodule

`endif // WRITEBACK_H