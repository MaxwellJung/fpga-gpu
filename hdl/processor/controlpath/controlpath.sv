`include "./hdl/processor/defines.svh"

module Controlpath (
    input logic clk,
    input logic reset,

    input opcode_t op,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    input logic take_branch_e,

    input logic flush_e,

    // output to datapath
    output imm_src_t imm_src_d,
    output alu_src_t alu_src_e,
    output alu_control_t alu_control_e,
    output logic invert_cond_e,
    output jump_src_t jump_src_e,
    output logic pc_src_e,
    output logic mem_write_m,
    output logic reg_write_m,
    output logic [1:0] result_src_w,
    output logic reg_write_w,

    // output to hazard
    output logic [1:0] result_src_e
);
    logic reg_write_d;
    logic [1:0] result_src_d;
    logic mem_write_d;
    logic jump_d;
    logic branch_d;
    alu_control_t alu_control_d;
    alu_src_t alu_src_d;
    logic invert_cond_d;
    Control control_unit (
        .op                    (op),
        .funct3                (funct3),
        .funct7                (funct7),
        .reg_write             (reg_write_d),
        .result_src            (result_src_d),
        .mem_write             (mem_write_d),
        .jump                  (jump_d),
        .branch                (branch_d),
        .alu_control           (alu_control_d),
        .alu_src               (alu_src_d),
        .imm_src               (imm_src_d),
        .invert_cond           (invert_cond_d),
        .jump_src              (jump_src_d)
    );

    logic reg_write_e;
    logic mem_write_e;
    logic jump_e;
    logic branch_e;
    always_ff @(posedge clk) begin
        if (reset || flush_e) begin
            {reg_write_e, result_src_e, mem_write_e, jump_e, branch_e, alu_control_e, alu_src_e, invert_cond_e, jump_src_e} <= '0;
        end else begin
            {reg_write_e, result_src_e, mem_write_e, jump_e, branch_e, alu_control_e, alu_src_e, invert_cond_e, jump_src_e} <= 
            {reg_write_d, result_src_d, mem_write_d, jump_d, branch_d, alu_control_d, alu_src_d, invert_cond_d, jump_src_d};
        end
    end

    logic [1:0] result_src_m;
    always_ff @(posedge clk) begin
        if (reset) begin
            {reg_write_m, result_src_m, mem_write_m} <= '0;
        end else begin
            {reg_write_m, result_src_m, mem_write_m} <= 
            {reg_write_e, result_src_e, mem_write_e};
        end
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            {reg_write_w, result_src_w} <= '0;
        end else begin
            {reg_write_w, result_src_w} <= 
            {reg_write_m, result_src_m};
        end
    end

    always_comb begin
        pc_src_e = (take_branch_e && branch_e) || jump_e;
    end

endmodule