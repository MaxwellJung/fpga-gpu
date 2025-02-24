`include "./hdl/processor/defines.svh"

module OpcodeDecoder (
    input opcode_t op_i,

    output logic reg_write_o,
    output imm_src_t imm_src_o,
    output alu_src_t alu_src_o,
    output logic mem_write_o,
    output logic [1:0] result_src_o,
    output logic branch_o,
    output logic [1:0] alu_op_o,
    output logic jump_o
);
    logic [11:0] controls;
    always_comb
        case(op_i)
            // RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUOp_Jump
            OP_LOAD:
                controls = {1'b1, IMM_I, ALU_SRC_IMM, 7'b0_01_0_00_0}; // lw
            OP_STORE:
                controls = {1'b0, IMM_S, ALU_SRC_IMM, 7'b1_00_0_00_0}; // sw
            OP_ALU_R:
                controls = {1'b1, IMM_I, ALU_SRC_REG, 7'b0_00_0_10_0}; // R–type
            OP_BRANCH:
                controls = {1'b0, IMM_B, ALU_SRC_REG, 7'b0_00_1_01_0}; // beq
            OP_ALU_I:
                controls = {1'b1, IMM_I, ALU_SRC_IMM, 7'b0_00_0_10_0}; // I–type ALU
            OP_JUMP:
                controls = {1'b1, IMM_J, ALU_SRC_REG, 7'b0_10_0_00_1}; // jal
            OP_LUI:
                controls = {1'b1, IMM_U, ALU_SRC_IMM, 7'b0_00_0_11_0}; // lui
            default:
                controls = '0; // ???
        endcase

    assign {reg_write_o, imm_src_o, alu_src_o, mem_write_o,
    result_src_o, branch_o, alu_op_o, jump_o} = controls;

endmodule