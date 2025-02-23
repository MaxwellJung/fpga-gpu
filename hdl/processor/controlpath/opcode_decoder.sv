`include "./hdl/processor/sign_extend.sv"

module OpcodeDecoder (
    input logic [6:0] op_i,

    output logic reg_write_o,
    output imm_src_t imm_src_o,
    output logic alu_src_o,
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
            7'b0000011: controls = {1'b1, IMM_I, 8'b1_0_01_0_00_0}; // lw
            7'b0100011: controls = {1'b0, IMM_S, 8'b1_1_00_0_00_0}; // sw
            7'b0110011: controls = {1'b1, IMM_I, 8'b0_0_00_0_10_0}; // R–type
            7'b1100011: controls = {1'b0, IMM_B, 8'b0_0_00_1_01_0}; // beq
            7'b0010011: controls = {1'b1, IMM_I, 8'b1_0_00_0_10_0}; // I–type ALU
            7'b1101111: controls = {1'b1, IMM_J, 8'b0_0_10_0_00_1}; // jal
            7'b0110111: controls = {1'b1, IMM_U, 8'b1_0_00_0_11_0}; // lui
            default: controls = '0; // ???
        endcase

    assign {reg_write_o, imm_src_o, alu_src_o, mem_write_o,
    result_src_o, branch_o, alu_op_o, jump_o} = controls;

endmodule