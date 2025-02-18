module Alu #(
    
) (
    input logic [31:0] src_a_i,
    input logic [31:0] src_b_i,
    input logic [2:0] control_i,

    output logic [31:0] result_o
);

    always_comb begin
        case (control_i)
            3'b000: result_o = src_a_i + src_b_i;
            3'b001: result_o = src_a_i - src_b_i;
            3'b010: result_o = src_a_i & src_b_i;
            3'b011: result_o = src_a_i | src_b_i;
            3'b101: result_o = src_a_i | src_b_i;
            default: result_o = '0;
        endcase
    end
    
endmodule