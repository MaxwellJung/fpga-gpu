`include "./hdl/processor/defines.svh"

module Control (
    input opcode_t op,
    input logic [2:0] funct3,
    input logic [6:0] funct7,

    output logic reg_write,
    output logic [1:0] result_src,
    output logic mem_write,
    output logic jump,
    output logic branch,
    output alu_control_t alu_control,
    output alu_src_t alu_src,
    output imm_src_t imm_src,
    output logic invert_cond,
    output jump_src_t jump_src
);

    OpcodeDecoder opcode_decoder (
        .op            (op),

        .reg_write     (reg_write),
        .imm_src       (imm_src),
        .alu_src       (alu_src),
        .mem_write     (mem_write),
        .result_src    (result_src),
        .branch        (branch),
        .jump          (jump),
        .jump_src      (jump_src)
    );

    AluDecoder alu_decoder (
        .op(op),
        .funct3(funct3),
        .funct7(funct7),
        .alu_control(alu_control),
        .invert_cond(invert_cond)
    );

endmodule