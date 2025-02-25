module Writeback (
    input logic clk,
    input logic reset,

    input logic [31:0] alu_result_m,
    input logic [31:0] read_data_m,
    input logic [4:0] rd_m,
    input logic [31:0] pc_plus_4_m,

    input logic [1:0] result_src_w,

    output logic [31:0] result_w,
    output logic [4:0] rd_w
);
    logic [31:0] alu_result_w;
    logic [31:0] read_data_w;
    logic [31:0] pc_plus_4_w;
    always_ff @(posedge clk) begin
        if (reset) begin
            {alu_result_w, read_data_w, rd_w, pc_plus_4_w} <= '0;
        end else begin
            {alu_result_w, read_data_w, rd_w, pc_plus_4_w} <= 
            {alu_result_m, read_data_m, rd_m, pc_plus_4_m};
        end
    end

    always_comb begin
        case (result_src_w)
            2'b00: result_w = alu_result_w;
            2'b01: result_w = read_data_w;
            2'b10: result_w = pc_plus_4_w;
            default: result_w = '0;
        endcase
    end

endmodule
