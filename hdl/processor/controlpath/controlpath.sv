`include "./hdl/processor/defines.svh"

module Controlpath (
    input logic clk,
    input logic reset,

    input opcode_t op,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    input logic e_take_branch,

    input logic e_flush,

    // output to datapath
    output imm_src_t d_imm_src,
    output alu_src_a_t e_alu_src_a,
    output alu_src_b_t e_alu_src_b,
    output alu_control_t e_alu_control,
    output logic e_invert_cond,
    output jump_src_t e_jump_src,
    output logic e_pc_src,
    output mem_size_t m_mem_size,
    output logic m_mem_write,
    output logic m_fb_write,
    output result_src_t w_result_src,
    output mem_size_t w_mem_size,
    output load_sign_t w_load_sign,
    output logic w_reg_write,

    // output to hazard
    output result_src_t e_result_src,
    output logic m_reg_write
);
    logic d_reg_write;
    result_src_t d_result_src;
    mem_size_t d_mem_size;
    load_sign_t d_load_sign;
    logic d_mem_write;
    logic d_fb_write;
    logic d_jump;
    logic d_branch;
    alu_control_t d_alu_control;
    alu_src_a_t d_alu_src_a;
    alu_src_b_t d_alu_src_b;
    logic d_invert_cond;
    logic d_jump_src;

    Control u_Control (
        .op               (op),
        .funct3           (funct3),
        .funct7           (funct7),
        .d_reg_write      (d_reg_write),
        .d_result_src     (d_result_src),
        .d_mem_size       (d_mem_size),
        .d_load_sign      (d_load_sign),
        .d_mem_write      (d_mem_write),
        .d_fb_write       (d_fb_write),
        .d_jump           (d_jump),
        .d_branch         (d_branch),
        .d_alu_control    (d_alu_control),
        .d_alu_src_a      (d_alu_src_a),
        .d_alu_src_b      (d_alu_src_b),
        .d_imm_src        (d_imm_src),
        .d_invert_cond    (d_invert_cond),
        .d_jump_src       (d_jump_src)
    );

    logic e_reg_write;
    mem_size_t e_mem_size;
    load_sign_t e_load_sign;
    logic e_mem_write;
    logic e_fb_write;
    logic e_jump;
    logic e_branch;
    always_ff @(posedge clk) begin
        if (reset || e_flush) begin
            {e_reg_write, e_result_src, e_mem_size, e_load_sign, e_mem_write, e_fb_write, e_jump, e_branch, 
            e_alu_control, e_alu_src_a, e_alu_src_b, e_invert_cond, e_jump_src} <= '0;
        end else begin
            {e_reg_write, e_result_src, e_mem_size, e_load_sign, e_mem_write, e_fb_write, e_jump, e_branch, 
            e_alu_control, e_alu_src_a, e_alu_src_b, e_invert_cond, e_jump_src} <= 
            {d_reg_write, d_result_src, d_mem_size, d_load_sign, d_mem_write, d_fb_write, d_jump, d_branch, 
            d_alu_control, d_alu_src_a, d_alu_src_b, d_invert_cond, d_jump_src};
        end
    end

    result_src_t m_result_src;
    load_sign_t m_load_sign;
    always_ff @(posedge clk) begin
        if (reset) begin
            {m_reg_write, m_result_src, m_mem_size, m_load_sign, m_mem_write, m_fb_write} <= '0;
        end else begin
            {m_reg_write, m_result_src, m_mem_size, m_load_sign, m_mem_write, m_fb_write} <= 
            {e_reg_write, e_result_src, e_mem_size, e_load_sign, e_mem_write, e_fb_write};
        end
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            {w_reg_write, w_result_src, w_mem_size, w_load_sign} <= '0;
        end else begin
            {w_reg_write, w_result_src, w_mem_size, w_load_sign} <= 
            {m_reg_write, m_result_src, m_mem_size, m_load_sign};
        end
    end

    always_comb begin
        e_pc_src = (e_take_branch && e_branch) || e_jump;
    end

endmodule