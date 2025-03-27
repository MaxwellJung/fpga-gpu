`include "./hdl/processor/defines.svh"

module OpcodeDecoder (
    input opcode_t op,

    output logic reg_write,
    output imm_src_t imm_src,
    output alu_src_a_t alu_src_a,
    output alu_src_b_t alu_src_b,
    output logic mem_write,
    output logic fb_write,
    output result_src_t result_src,
    output logic branch,
    output logic jump,
    output jump_src_t jump_src
);
    logic [12:0] controls;
    always_comb
        case(op)
            // RegWrit_ImmSrc_ALUSrcA_ALUSrcB_MemWrite_FbWrite_
            // ResultSrc_Branch_Jump_JumpSrc
            OP_LOAD:
                controls = {1'b1, IMM_I, ALU_SRC_A_REG, ALU_SRC_B_IMM, 1'b0, FB_NO_WRITE, 
                RESULT_SRC_MEMORY, 2'b0_0, JUMP_SRC_PC}; // lw
            OP_ALU_I:
                controls = {1'b1, IMM_I, ALU_SRC_A_REG, ALU_SRC_B_IMM, 1'b0, FB_NO_WRITE, 
                RESULT_SRC_ALU, 2'b0_0, JUMP_SRC_PC}; // I–type
            OP_AUIPC:
                controls = {1'b1, IMM_U, ALU_SRC_A_PC, ALU_SRC_B_IMM, 1'b0, FB_NO_WRITE, 
                RESULT_SRC_ALU, 1'b0, 1'b0, JUMP_SRC_PC}; // auipc
            OP_STORE:
                controls = {1'b0, IMM_S, ALU_SRC_A_REG, ALU_SRC_B_IMM, 1'b1, FB_NO_WRITE, 
                RESULT_SRC_ALU, 2'b0_0, JUMP_SRC_PC}; // sw
            OP_CUSTOM2:
                controls = {1'b0, IMM_S, ALU_SRC_A_REG, ALU_SRC_B_IMM, 1'b0, FB_WRITE, 
                RESULT_SRC_ALU, 2'b0_0, JUMP_SRC_PC}; // fbsw
            OP_ALU_R:
                controls = {1'b1, IMM_I, ALU_SRC_A_REG, ALU_SRC_B_REG, 1'b0, FB_NO_WRITE, 
                RESULT_SRC_ALU, 2'b0_0, JUMP_SRC_PC}; // R–type
            OP_LUI:
                controls = {1'b1, IMM_U, ALU_SRC_A_REG, ALU_SRC_B_IMM, 1'b0, FB_NO_WRITE, 
                RESULT_SRC_ALU, 2'b0_0, JUMP_SRC_PC}; // lui
            OP_BRANCH:
                controls = {1'b0, IMM_B, ALU_SRC_A_REG, ALU_SRC_B_REG, 1'b0, FB_NO_WRITE, 
                RESULT_SRC_ALU, 2'b1_0, JUMP_SRC_PC}; // beq
            OP_JALR:
                controls = {1'b1, IMM_I, ALU_SRC_A_REG, ALU_SRC_B_IMM, 1'b0, FB_NO_WRITE, 
                RESULT_SRC_PC_PLUS_4, 2'b0_1, JUMP_SRC_REG}; // jalr
            OP_JAL:
                controls = {1'b1, IMM_J, ALU_SRC_A_REG, ALU_SRC_B_REG, 1'b0, FB_NO_WRITE, 
                RESULT_SRC_PC_PLUS_4, 2'b0_1, JUMP_SRC_PC}; // jal
            default:
                controls = '0; // unknown
        endcase

    assign {reg_write, imm_src, alu_src_a, alu_src_b, mem_write, fb_write, 
        result_src, branch, jump, jump_src} = controls;

endmodule