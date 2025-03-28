`include "./hdl/processor/defines.svh"

module RISCVCore #(
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
    output logic [$clog2(PALETTE_LENGTH)-1:0] fb_wr_pxl_value
);

    // control wires
    imm_src_t d_imm_src;
    alu_src_a_t e_alu_src_a;
    alu_src_b_t e_alu_src_b;
    alu_control_t e_alu_control;
    logic e_invert_cond;
    jump_src_t e_jump_src;
    logic e_pc_src;
    mem_size_t m_mem_size;
    logic m_mem_write;
    logic m_fb_write;
    logic m_reg_write;
    result_src_t w_result_src;
    mem_size_t w_mem_size;
    load_sign_t w_load_sign;
    logic w_reg_write;
    opcode_t op;
    logic [2:0] funct3;
    logic [6:0] funct7;
    logic e_take_branch;

    // hazard wires
    logic f_stall;
    logic d_stall;
    logic d_flush;
    logic e_flush;
    logic [1:0] e_forward_a;
    logic [1:0] e_forward_b;
    logic [4:0] d_rs1;
    logic [4:0] d_rs2;
    logic [4:0] e_rs1;
    logic [4:0] e_rs2;
    logic [4:0] e_rd;
    logic [4:0] m_rd;
    logic [4:0] w_rd;


    Datapath #() u_Datapath (
        .clk                (clk),
        .reset              (reset),
        // instr bus
        .inst_reset         (inst_reset),
        .inst_addr          (inst_addr),
        .inst_rd_data       (inst_rd_data),
        .inst_rd_en         (inst_rd_en),
        // data bus
        .dbus_addr          (dbus_addr),
        .dbus_rd_data       (dbus_rd_data),
        .dbus_wr_data       (dbus_wr_data),
        .dbus_wr_en         (dbus_wr_en),
        // framebuffer
        .fb_wr_en           (fb_wr_en),
        .fb_wr_pxl_x        (fb_wr_pxl_x),
        .fb_wr_pxl_y        (fb_wr_pxl_y),
        .fb_wr_pxl_value    (fb_wr_pxl_value),
        // control
        .d_imm_src          (d_imm_src),
        .e_alu_src_a        (e_alu_src_a),
        .e_alu_src_b        (e_alu_src_b),
        .e_alu_control      (e_alu_control),
        .e_invert_cond      (e_invert_cond),
        .e_jump_src         (e_jump_src),
        .e_pc_src           (e_pc_src),
        .m_mem_size         (m_mem_size),
        .m_mem_write        (m_mem_write),
        .m_fb_write         (m_fb_write),
        .w_result_src       (w_result_src),
        .w_mem_size         (w_mem_size),
        .w_load_sign        (w_load_sign),
        .w_reg_write        (w_reg_write),
        .op                 (op),
        .funct3             (funct3),
        .funct7             (funct7),
        .e_take_branch      (e_take_branch),
        // hazard
        .f_stall            (f_stall),
        .d_stall            (d_stall),
        .d_flush            (d_flush),
        .e_flush            (e_flush),
        .e_forward_a        (e_forward_a),
        .e_forward_b        (e_forward_b),
        .d_rs1              (d_rs1),
        .d_rs2              (d_rs2),
        .e_rs1              (e_rs1),
        .e_rs2              (e_rs2),
        .e_rd               (e_rd),
        .m_rd               (m_rd),
        .w_rd               (w_rd)
    );

    result_src_t e_result_src;
    Controlpath u_Controlpath (
        .clk              (clk),
        .reset            (reset),
        .op               (op),
        .funct3           (funct3),
        .funct7           (funct7),
        .e_take_branch    (e_take_branch),
        .e_flush          (e_flush),
        // output to datapath
        .d_imm_src        (d_imm_src),
        .e_alu_src_a      (e_alu_src_a),
        .e_alu_src_b      (e_alu_src_b),
        .e_alu_control    (e_alu_control),
        .e_invert_cond    (e_invert_cond),
        .e_jump_src       (e_jump_src),
        .e_pc_src         (e_pc_src),
        .m_mem_size       (m_mem_size),
        .m_mem_write      (m_mem_write),
        .m_fb_write       (m_fb_write),
        .w_result_src     (w_result_src),
        .w_mem_size       (w_mem_size),
        .w_load_sign      (w_load_sign),
        .w_reg_write      (w_reg_write),
        // output to hazard
        .e_result_src     (e_result_src),
        .m_reg_write      (m_reg_write)
    );

    Hazard hazard (
        // input from datapath
        .d_rs1           (d_rs1),
        .d_rs2           (d_rs2),
        .e_rs1           (e_rs1),
        .e_rs2           (e_rs2),
        .e_rd            (e_rd),
        .m_rd            (m_rd),
        .w_rd            (w_rd),
        // input from control
        .e_pc_src        (e_pc_src),
        .e_result_src    (e_result_src),
        .m_reg_write     (m_reg_write),
        .w_reg_write     (w_reg_write),
        // output to datapath
        .f_stall         (f_stall),
        .d_stall         (d_stall),
        .d_flush         (d_flush),
        .e_flush         (e_flush),
        .e_forward_a     (e_forward_a),
        .e_forward_b     (e_forward_b)
    );

endmodule
