`include "./hdl/processor/defines.svh"

module Alu (
    input logic [31:0] src_a,
    input logic [31:0] src_b,
    input alu_control_t control,
    input logic invert_cond,

    output logic [31:0] result,
    output logic take_branch
);
    logic condition;
    always_comb begin
        case (control)
            ALU_NOOP:
                result = '0;
            ALU_A:
                result = src_a;
            ALU_B:
                result = src_b;
            ALU_ADD:
                result = src_a + src_b;
            ALU_SUB:
                result = src_a - src_b;
            ALU_AND:
                result = src_a & src_b;
            ALU_OR:
                result = src_a | src_b;
            ALU_XOR:
                result = src_a ^ src_b;
            ALU_SLT:
                result = (src_a < src_b) ? 1 : 0;
            ALU_SLTU:
                result = ($unsigned(src_a) < $unsigned(src_b)) ? 1 : 0;
            ALU_SLL:
                result = src_a << src_b[4:0];
            ALU_SRL:
                result = src_a >> src_b[4:0];
            ALU_SRA:
                result = src_a >>> src_b[4:0];
            ALU_EQUAL:
                result = (src_a == src_b) ? 1 : 0;
            ALU_XY_ADD:
                result = {src_a[31:16] + src_b[31:16], src_a[15:0] + src_b[15:0]};
            ALU_XY_SUB: 
                result = {src_a[31:16] - src_b[31:16], src_a[15:0] - src_b[15:0]};
            default: result = '0;
        endcase

        condition = result[0];
        take_branch = condition ^ invert_cond;
    end

endmodule
