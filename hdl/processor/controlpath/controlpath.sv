`include "./hdl/processor/defines.svh"

module Controlpath (
    input logic clk_i,
    input logic reset_i,

    input opcode_t op_i,
    input logic [2:0] funct3_i,
    input logic [6:0] funct7_i,
    input logic take_branch_e_i,

    input logic flush_e_i,

    // output to datapath
    output imm_src_t imm_src_d_o,
    output alu_src_t alu_src_e_o,
    output alu_control_t alu_control_e_o,
    output logic invert_cond_e_o,
    output jump_src_t jump_src_e_o,
    output logic pc_src_e_o,
    output logic mem_write_m_o,
    output logic reg_write_m_o,
    output logic [1:0] result_src_w_o,
    output logic reg_write_w_o,

    // output to hazard
    output logic [1:0] result_src_e_o
);
    logic reg_write_d;
    logic [1:0] result_src_d;
    logic mem_write_d;
    logic jump_d;
    logic branch_d;
    alu_control_t alu_control_d;
    alu_src_t alu_src_d;
    imm_src_t imm_src_d;
    logic invert_cond_d;
    Control control_unit (
        .op_i                    (op_i),
        .funct3_i                (funct3_i),
        .funct7_i                (funct7_i),
        .reg_write_o             (reg_write_d),
        .result_src_o            (result_src_d),
        .mem_write_o             (mem_write_d),
        .jump_o                  (jump_d),
        .branch_o                (branch_d),
        .alu_control_o           (alu_control_d),
        .alu_src_o               (alu_src_d),
        .imm_src_o               (imm_src_d),
        .invert_cond_o           (invert_cond_d),
        .jump_src_o              (jump_src_d)
    );

    logic reg_write_e;
    logic [1:0] result_src_e;
    logic mem_write_e;
    logic jump_e;
    logic branch_e;
    alu_control_t alu_control_e;
    alu_src_t alu_src_e;
    logic invert_cond_e;
    jump_src_t jump_src_e;
    always_ff @(posedge clk_i) begin
        if (reset_i || flush_e_i) begin
            {reg_write_e, result_src_e, mem_write_e, jump_e, branch_e, alu_control_e, alu_src_e, invert_cond_e, jump_src_e} <= '0;
        end else begin
            {reg_write_e, result_src_e, mem_write_e, jump_e, branch_e, alu_control_e, alu_src_e, invert_cond_e, jump_src_e} <= 
            {reg_write_d, result_src_d, mem_write_d, jump_d, branch_d, alu_control_d, alu_src_d, invert_cond_d, jump_src_d};
        end
    end

    logic reg_write_m;
    logic [1:0] result_src_m;
    logic mem_write_m;
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            {reg_write_m, result_src_m, mem_write_m} <= '0;
        end else begin
            {reg_write_m, result_src_m, mem_write_m} <= 
            {reg_write_e, result_src_e, mem_write_e};
        end
    end

    logic reg_write_w;
    logic [1:0] result_src_w;
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            {reg_write_w, result_src_w} <= '0;
        end else begin
            {reg_write_w, result_src_w} <= 
            {reg_write_m, result_src_m};
        end
    end


    always_comb begin
        imm_src_d_o = imm_src_d;
        alu_src_e_o = alu_src_e;
        alu_control_e_o = alu_control_e;
        invert_cond_e_o = invert_cond_e;
        jump_src_e_o = jump_src_e;
        pc_src_e_o = (take_branch_e_i && branch_e) || jump_e;
        mem_write_m_o = mem_write_m;
        reg_write_m_o = reg_write_m;
        result_src_w_o = result_src_w;
        reg_write_w_o = reg_write_w;
        result_src_e_o = result_src_e;
    end

endmodule