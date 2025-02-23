`ifndef ALU_H
`define ALU_H

typedef enum {
    ALU_A,
    ALU_B,
    ALU_ADD,
    ALU_SUB,
    ALU_AND,
    ALU_OR,
    ALU_XOR,
    ALU_SLT,
    ALU_SLL,
    ALU_SRL
} alu_control_t;

module Alu (
    input logic [31:0] src_a_i,
    input logic [31:0] src_b_i,
    input alu_control_t control_i,

    output logic [31:0] result_o,
    output logic zero_o
);
    logic [31:0] result;
    logic zero;
    always_comb begin
        case (control_i)
            ALU_A: result = src_a_i;
            ALU_B: result = src_b_i;
            ALU_ADD: result = src_a_i + src_b_i;
            ALU_SUB: result = src_a_i - src_b_i;
            ALU_AND: result = src_a_i & src_b_i;
            ALU_OR: result = src_a_i | src_b_i;
            ALU_XOR: result = src_a_i ^ src_b_i;
            ALU_SLT: result = (src_a_i < src_b_i) ? 1 : 0;
            ALU_SLL: result = src_a_i << src_b_i;
            ALU_SRL: result = src_a_i >> src_b_i;
            default: result = '0;
        endcase

        zero = (result == 0) ? 1 : 0;
    end

    always_comb begin
        result_o = result;
        zero_o = zero;
    end

endmodule

`endif // ALU_H
