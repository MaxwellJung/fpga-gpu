module Alu (
    input logic [31:0] src_a_i,
    input logic [31:0] src_b_i,
    input logic [2:0] control_i,

    output logic [31:0] result_o
);

    always_comb begin
        case (control_i)
            // add
            3'b000: result_o = src_a_i + src_b_i;
            // sub
            3'b001: result_o = src_a_i - src_b_i;
            // and
            3'b010: result_o = src_a_i & src_b_i;
            // or
            3'b011: result_o = src_a_i | src_b_i;
            // slt
            3'b101: result_o = (src_a_i < src_b_i) ? 1 : 0;
            default: result_o = '0; // undefined
        endcase
    end
    
endmodule