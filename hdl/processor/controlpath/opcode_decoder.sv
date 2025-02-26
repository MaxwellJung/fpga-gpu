`include "./hdl/processor/defines.svh"

module OpcodeDecoder (
    input opcode_t op,

    output logic reg_write,
    output imm_src_t imm_src,
    output alu_src_t alu_src,
    output logic mem_write,
    output logic [1:0] result_src,
    output logic branch,
    output logic jump,
    output jump_src_t jump_src
);
    logic [10:0] controls;
    always_comb
        case(op)
            // RegWritemmSrc_ALUSrc_MemWrite_ResultSrc_Branch_Jump_JumpSrc
            OP_LOAD:
                controls = {1'b1, IMM, ALU_SRCMM, 5'b0_01_0_0, JUMP_SRC_PC}; // lw
            OP_ALU:
                controls = {1'b1, IMM, ALU_SRCMM, 5'b0_00_0_0, JUMP_SRC_PC}; // I–type
            OP_STORE:
                controls = {1'b0, IMM_S, ALU_SRCMM, 5'b1_00_0_0, JUMP_SRC_PC}; // sw
            OP_ALU_R:
                controls = {1'b1, IMM, ALU_SRC_REG, 5'b0_00_0_0, JUMP_SRC_PC}; // R–type
            OP_LUI:
                controls = {1'b1, IMM_U, ALU_SRCMM, 5'b0_00_0_0, JUMP_SRC_PC}; // lui
            OP_BRANCH:
                controls = {1'b0, IMM_B, ALU_SRC_REG, 5'b0_00_1_0, JUMP_SRC_PC}; // beq
            OP_JALR:
                controls = {1'b1, IMM, ALU_SRCMM, 5'b0_10_0_1, JUMP_SRC_REG}; // jalr
            OP_JAL:
                controls = {1'b1, IMM_J, ALU_SRC_REG, 5'b0_10_0_1, JUMP_SRC_PC}; // jal
            default:
                controls = '0; // unknown
        endcase

    assign {reg_write, imm_src, alu_src, mem_write,
    result_src, branch, jump, jump_src} = controls;

endmodule