`include "./hdl/processor/defines.svh"

module Datapath #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256,
    parameter COLOR_BITS = 12
) (
    input logic clk,
    input logic reset,

    // instr bus
    output logic inst_reset,
    output logic [31:0] inst_addr,
    input logic [31:0] inst_rd_data,
    output logic inst_rd_en,

    // data bus
    output logic [31:0] dbus_addr,
    input logic [31:0] dbus_rd_data,
    output logic [31:0] dbus_wr_data,
    output logic [3:0] dbus_wr_en,

    // framebuffer
    output logic fb_wr_en,
    output logic [$clog2(RESOLUTION_X)-1:0] fb_wr_pxl_x,
    output logic [$clog2(RESOLUTION_Y)-1:0] fb_wr_pxl_y,
    output logic [$clog2(PALETTE_LENGTH)-1:0] fb_wr_pxl_value,

    // control
    input imm_src_t d_imm_src,
    input alu_src_a_t e_alu_src_a,
    input alu_src_b_t e_alu_src_b,
    input alu_control_t e_alu_control,
    input logic e_invert_cond,
    input jump_src_t e_jump_src,
    input logic e_pc_src,
    input mem_size_t m_mem_size,
    input logic m_mem_write,
    input logic m_fb_write,
    input result_src_t w_result_src,
    input mem_size_t w_mem_size,
    input load_sign_t w_load_sign,
    input logic w_reg_write,
    output opcode_t op,
    output logic [2:0] funct3,
    output logic [6:0] funct7,
    output logic e_take_branch,

    // hazard
    input logic f_stall,
    input logic d_stall,
    input logic d_flush,
    input logic e_flush,
    input logic [1:0] e_forward_a,
    input logic [1:0] e_forward_b,
    output logic [4:0] d_rs1,
    output logic [4:0] d_rs2,
    output logic [4:0] e_rs1,
    output logic [4:0] e_rs2,
    output logic [4:0] e_rd,
    output logic [4:0] m_rd,
    output logic [4:0] w_rd
);
    logic [31:0] e_pc_target;

    logic [31:0] f_pc;
    logic [31:0] f_pc_plus_4;
    fetch u_fetch (
        .clk            (clk),
        .reset          (reset),
        .f_stall        (f_stall),
        .e_pc_src       (e_pc_src),
        .e_pc_target    (e_pc_target),
        .f_pc           (f_pc),
        .f_pc_plus_4    (f_pc_plus_4)
    );
    
    assign inst_reset = d_flush;
    assign inst_addr = f_pc;
    logic [31:0] d_instruction;
    assign d_instruction = inst_rd_data;
    assign inst_rd_en = !d_stall;

    logic [31:0] w_result;

    logic [31:0] d_rs1_value;
    logic [31:0] d_rs2_value;
    logic [31:0] d_pc;
    logic [4:0] d_rd;
    logic [31:0] d_imm_ext;
    logic [31:0] d_pc_plus_4;

    decode u_decode (
        .clk              (clk),
        .reset            (reset),
        // input from fetch stage
        .f_pc             (f_pc),
        .f_pc_plus_4      (f_pc_plus_4),
        // input from instruction memory
        .d_instruction    (d_instruction),
        // input from hazard unit
        .d_stall          (d_stall),
        .d_flush          (d_flush),
        // input from writeback stage
        .w_rd             (w_rd),
        .w_result         (w_result),
        .w_reg_write      (w_reg_write),
        // output to control unit
        .op               (op),
        .funct3           (funct3),
        .funct7           (funct7),
        // input from control unit
        .d_imm_src        (d_imm_src),
        // output to execute pipeline
        .d_rs1_value      (d_rs1_value),
        .d_rs2_value      (d_rs2_value),
        .d_pc             (d_pc),
        .d_rs1            (d_rs1),
        .d_rs2            (d_rs2),
        .d_rd             (d_rd),
        .d_imm_ext        (d_imm_ext),
        .d_pc_plus_4      (d_pc_plus_4)
    );

    logic [31:0] m_alu_result;

    logic [31:0] e_alu_result;
    logic [31:0] e_write_data;
    logic [31:0] e_pc_plus_4;

    Execute u_Execute (
        .clk              (clk),
        .reset            (reset),
        // input from previous pipeline
        .d_rs1_value      (d_rs1_value),
        .d_rs2_value      (d_rs2_value),
        .d_pc             (d_pc),
        .d_rs1            (d_rs1),
        .d_rs2            (d_rs2),
        .d_rd             (d_rd),
        .d_imm_ext        (d_imm_ext),
        .d_pc_plus_4      (d_pc_plus_4),
        // forward
        .m_alu_result     (m_alu_result),
        .w_result         (w_result),
        // hazard
        .e_flush          (e_flush),
        .e_forward_a      (e_forward_a),
        .e_forward_b      (e_forward_b),
        // control
        .e_alu_src_a      (e_alu_src_a),
        .e_alu_src_b      (e_alu_src_b),
        .e_alu_control    (e_alu_control),
        .e_invert_cond    (e_invert_cond),
        .e_jump_src       (e_jump_src),
        .e_rs1            (e_rs1),
        .e_rs2            (e_rs2),
        .e_pc_target      (e_pc_target),
        .e_take_branch    (e_take_branch),
        // output to next pipeline
        .e_alu_result     (e_alu_result),
        .e_write_data     (e_write_data),
        .e_rd             (e_rd),
        .e_pc_plus_4      (e_pc_plus_4)
    );

    logic [31:0] m_pc_plus_4;
    Memory #(
        .RESOLUTION_X       (RESOLUTION_X),
        .RESOLUTION_Y       (RESOLUTION_Y),
        .PALETTE_LENGTH     (PALETTE_LENGTH)
    ) u_Memory (
        .clk                (clk),
        .reset              (reset),
        // input from previous pipeline
        .e_alu_result       (e_alu_result),
        .e_write_data       (e_write_data),
        .e_rd               (e_rd),
        .e_pc_plus_4        (e_pc_plus_4),
        // control
        .m_mem_size         (m_mem_size),
        .m_mem_write        (m_mem_write),
        .m_fb_write         (m_fb_write),
        // data bus
        .dbus_addr          (dbus_addr),
        .dbus_wr_data       (dbus_wr_data),
        .dbus_wr_en         (dbus_wr_en),
        // framebuffer
        .fb_wr_en           (fb_wr_en),
        .fb_wr_pxl_x        (fb_wr_pxl_x),
        .fb_wr_pxl_y        (fb_wr_pxl_y),
        .fb_wr_pxl_value    (fb_wr_pxl_value),
        // output to next pipeline
        .m_alu_result       (m_alu_result),
        .m_rd               (m_rd),
        .m_pc_plus_4        (m_pc_plus_4)
    );

    Writeback u_Writeback (
        .clk             (clk),
        .reset           (reset),
        // input from memory stage
        .m_alu_result    (m_alu_result),
        .m_rd            (m_rd),
        .m_pc_plus_4     (m_pc_plus_4),
        // input from data memory
        .w_read_data     (dbus_rd_data),
        // input from control
        .w_result_src    (w_result_src),
        .w_mem_size      (w_mem_size),
        .w_load_sign     (w_load_sign),
        // output to register file
        .w_result        (w_result),
        .w_rd            (w_rd)
    );

endmodule
