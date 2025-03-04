`include "./hdl/processor/defines.svh"

module RISCVCore (
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
    output logic dbus_wr_en
);

    // control wires
    imm_src_t d_imm_src;
    alu_src_t e_alu_src;
    alu_control_t e_alu_control;
    logic e_invert_cond;
    jump_src_t e_jump_src;
    logic e_pc_src;
    logic m_mem_write;
    logic [1:0] w_result_src;
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

    Datapath u_Datapath (
        .clk              (clk),
        .reset            (reset),
        // instr bus
        .inst_reset       (inst_reset),
        .inst_addr        (inst_addr),
        .inst_rd_data     (inst_rd_data),
        .inst_rd_en       (inst_rd_en),
        // data bus
        .dbus_addr         (dbus_addr),
        .dbus_rd_data      (dbus_rd_data),
        .dbus_wr_data      (dbus_wr_data),
        .dbus_wr_en        (dbus_wr_en),
        // control
        .d_imm_src        (d_imm_src),
        .e_alu_src        (e_alu_src),
        .e_alu_control    (e_alu_control),
        .e_invert_cond    (e_invert_cond),
        .e_jump_src       (e_jump_src),
        .e_pc_src         (e_pc_src),
        .m_mem_write      (m_mem_write),
        .w_result_src     (w_result_src),
        .w_reg_write      (w_reg_write),
        .op               (op),
        .funct3           (funct3),
        .funct7           (funct7),
        .e_take_branch    (e_take_branch),
        // hazard
        .f_stall          (f_stall),
        .d_stall          (d_stall),
        .d_flush          (d_flush),
        .e_flush          (e_flush),
        .e_forward_a      (e_forward_a),
        .e_forward_b      (e_forward_b),
        .d_rs1            (d_rs1),
        .d_rs2            (d_rs2),
        .e_rs1            (e_rs1),
        .e_rs2            (e_rs2),
        .e_rd             (e_rd),
        .m_rd             (m_rd),
        .w_rd             (w_rd)
    );

    logic [1:0] e_result_src;
    Controlpath controlpath (
        .clk                (clk),
        .reset              (reset),
        // input from datapath
        .op                 (op),
        .funct3             (funct3),
        .funct7             (funct7),
        .e_take_branch      (e_take_branch),
        .e_flush            (e_flush),
        // output to datapath
        .d_imm_src          (d_imm_src),
        .e_alu_src          (e_alu_src),
        .e_alu_control      (e_alu_control),
        .e_invert_cond      (e_invert_cond),
        .e_jump_src         (e_jump_src),
        .e_pc_src           (e_pc_src),
        .m_mem_write        (m_mem_write),
        .m_reg_write        (m_reg_write),
        .w_result_src       (w_result_src),
        .w_reg_write        (w_reg_write),
        // output to hazard
        .e_result_src       (e_result_src)
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
