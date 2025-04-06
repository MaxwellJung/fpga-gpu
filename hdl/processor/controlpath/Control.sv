`include "./hdl/processor/defines.svh"

module Control (
    input opcode_t op,
    input logic [2:0] funct3,
    input logic [6:0] funct7,

    output logic d_reg_write,
    output result_src_t d_result_src,
    output mem_size_t d_mem_size,
    output load_sign_t d_load_sign,
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

    always_comb begin
        case (funct3[1:0])
            2'b00: d_mem_size = MEM_SIZE_BYTE;
            2'b01: d_mem_size = MEM_SIZE_HALF;
            2'b10: d_mem_size = MEM_SIZE_WORD;
            default: d_mem_size = MEM_SIZE_WORD;
        endcase

        case (funct3[2])
            1'b0: d_load_sign = LOAD_SIGNED;
            1'b1: d_load_sign = LOAD_UNSIGNED;
            default: d_load_sign = LOAD_SIGNED;
        endcase
    end

endmodule
