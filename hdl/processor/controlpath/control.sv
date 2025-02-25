`include "./hdl/processor/defines.svh"

module Control (
    input opcode_t op_i,
    input logic [2:0] funct3_i,
    input logic [6:0] funct7_i,

    output logic reg_write_o,
    output logic [1:0] result_src_o,
    output logic mem_write_o,
    output logic jump_o,
    output logic branch_o,
    output alu_control_t alu_control_o,
    output alu_src_t alu_src_o,
    output imm_src_t imm_src_o,
    output logic invert_cond_o,
    output jump_src_t jump_src_o
);
    logic reg_write;
    imm_src_t imm_src;
    alu_src_t alu_src;
    logic mem_write;
    logic [1:0] result_src;
    logic branch;
    logic jump;
    jump_src_t jump_src;
    OpcodeDecoder opcode_decoder (
        .op_i            (op_i),

        .reg_write_o     (reg_write),
        .imm_src_o       (imm_src),
        .alu_src_o       (alu_src),
        .mem_write_o     (mem_write),
        .result_src_o    (result_src),
        .branch_o        (branch),
        .jump_o          (jump),
        .jump_src_o      (jump_src)
    );

    alu_control_t alu_control;
    logic invert_cond;
    AluDecoder alu_decoder (
        .op_i(op_i),
        .funct3_i(funct3_i),
        .funct7_i(funct7_i),
        .alu_control_o(alu_control),
        .invert_cond_o(invert_cond)
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
        invert_cond_o = invert_cond;
        jump_src_o = jump_src;
    end

endmodule