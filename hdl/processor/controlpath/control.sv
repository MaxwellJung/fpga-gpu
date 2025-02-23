`include "./hdl/processor/alu.sv"
`include "./hdl/processor/sign_extend.sv"

module Control (
    input logic [6:0] op_i,
    input logic [2:0] funct3_i,
    input logic [6:0] funct7_i,

    output logic reg_write_o,
    output logic [1:0] result_src_o,
    output logic mem_write_o,
    output logic jump_o,
    output logic branch_o,
    output alu_control_t alu_control_o,
    output logic alu_src_o,
    output imm_src_t imm_src_o,
    output logic invert_branch_cond_o
);
    logic reg_write;
    logic [1:0] result_src;
    logic mem_write;
    logic jump;
    logic branch;
    logic alu_src;
    imm_src_t imm_src;
    logic [1:0] alu_op;

    OpcodeDecoder opcode_decoder (
        .op_i            (op_i),

        .reg_write_o     (reg_write),
        .imm_src_o       (imm_src),
        .alu_src_o       (alu_src),
        .mem_write_o     (mem_write),
        .result_src_o    (result_src),
        .branch_o        (branch),
        .alu_op_o        (alu_op),
        .jump_o          (jump)
    );

    alu_control_t alu_control;
    AluDecoder alu_decoder (
        .op_i(op_i),
        .funct3_i(funct3_i),
        .funct7_i(funct7_i),
        .alu_op_i(alu_op),
        .alu_control_o(alu_control)
    );

    logic invert_branch_cond;
    BranchDecoder branch_decoder (
        .branch_i               (branch),
        .funct3_i               (funct3_i),
        .invert_branch_cond_o   (invert_branch_cond)
    );

    always_comb begin
        reg_write_o = reg_write;
        result_src_o = result_src;
        mem_write_o = mem_write;
        jump_o = jump;
        branch_o = branch;
        alu_control_o = alu_control;
        alu_src_o = alu_src;
        imm_src_o = imm_src;
        invert_branch_cond_o = invert_branch_cond;
    end

endmodule