`include "./hdl/processor/defines.svh"

module Alu (
    input logic [31:0] src_a_i,
    input logic [31:0] src_b_i,
    input alu_control_t control_i,
    input logic invert_cond_i,

    output logic [31:0] result_o,
    output logic take_branch_o
);
    logic [31:0] result;
    logic condition;
    logic take_branch;
    always_comb begin
        case (control_i)
            ALU_NOOP:  result = src_a_i + src_b_i;
            ALU_A:     result = src_a_i;
            ALU_B:     result = src_b_i;
            ALU_ADD:   result = src_a_i + src_b_i;
            ALU_SUB:   result = src_a_i - src_b_i;
            ALU_AND:   result = src_a_i & src_b_i;
            ALU_OR:    result = src_a_i | src_b_i;
            ALU_XOR:   result = src_a_i ^ src_b_i;
            ALU_SLT:   result = (src_a_i < src_b_i) ? 1 : 0;
            ALU_SLL:   result = src_a_i << src_b_i;
            ALU_SRL:   result = src_a_i >> src_b_i;
            ALU_SRA:   result = src_a_i >>> src_b_i;
            ALU_EQUAL: result = (src_a_i == src_b_i) ? 1 : 0;
            default: result = '0;
        endcase

        condition = result[0];
        take_branch = condition ^ invert_cond_i;
    end

    always_comb begin
        result_o = result;
        take_branch_o = take_branch;
    end

endmodule
