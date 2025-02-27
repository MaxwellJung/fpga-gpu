`include "./hdl/processor/defines.svh"

module Control (
    input opcode_t op,
    input logic [2:0] funct3,
    input logic [6:0] funct7,

    output logic d_reg_write,
    output logic [1:0] d_result_src,
    output logic d_mem_write,
    output logic d_fb_write,
    output logic d_jump,
    output logic d_branch,
    output alu_control_t d_alu_control,
    output alu_src_a_t d_alu_src_a,
    output alu_src_b_t d_alu_src_b,
    output imm_src_t d_imm_src,
    output logic d_invert_cond,
    output jump_src_t d_jump_src
);

    OpcodeDecoder u_OpcodeDecoder (
        .op            (op),
        .reg_write     (d_reg_write),
        .imm_src       (d_imm_src),
        .alu_src_a     (d_alu_src_a),
        .alu_src_b     (d_alu_src_b),
        .mem_write     (d_mem_write),
        .fb_write      (d_fb_write),
        .result_src    (d_result_src),
        .branch        (d_branch),
        .jump          (d_jump),
        .jump_src      (d_jump_src)
    );

    AluDecoder alu_decoder (
        .op(op),
        .funct3(funct3),
        .funct7(funct7),
        .alu_control(d_alu_control),
        .invert_cond(d_invert_cond)
    );

endmodule