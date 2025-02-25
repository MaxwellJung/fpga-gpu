`include "./hdl/processor/defines.svh"

module RISCVCore (
    input logic clk_i,
    input logic reset_i,
    
    // memory bus
    output logic [31:0] bus_addr_o,
    input logic [31:0] bus_rd_data_i,
    output logic [31:0] bus_wr_data_o,
    output logic bus_wr_en_o
);

    // control wires
    imm_src_t imm_src_d;
    alu_src_t alu_src_e;
    alu_control_t alu_control_e;
    logic invert_cond_e;
    jump_src_t jump_src_e;
    logic pc_src_e;
    logic mem_write_m;
    logic [1:0] result_src_w;
    logic reg_write_w;
    opcode_t op;
    logic [2:0] funct3;
    logic [6:0] funct7;
    logic take_branch_e;

    // hazard wires
    logic stall_f;
    logic stall_d;
    logic flush_d;
    logic flush_e;
    logic [1:0] forward_a_e;
    logic [1:0] forward_b_e;
    logic [4:0] rs1_d;
    logic [4:0] rs2_d;
    logic [4:0] rs1_e;
    logic [4:0] rs2_e;
    logic [4:0] rd_e;
    logic [4:0] rd_m;
    logic [4:0] rd_w;

    Datapath datapath (
        .clk_i              (clk_i),
        .reset_i            (reset_i),
        // memory bus
        .bus_addr_o         (bus_addr_o),
        .bus_rd_data_i      (bus_rd_data_i),
        .bus_wr_data_o      (bus_wr_data_o),
        .bus_wr_en_o        (bus_wr_en_o),
        // control
        .imm_src_d_i        (imm_src_d),
        .alu_src_e_i        (alu_src_e),
        .alu_control_e_i    (alu_control_e),
        .invert_cond_e_i    (invert_cond_e),
        .jump_src_e_i       (jump_src_e),
        .pc_src_e_i         (pc_src_e),
        .mem_write_m_i      (mem_write_m),
        .result_src_w_i     (result_src_w),
        .reg_write_w_i      (reg_write_w),
        .op_o               (op),
        .funct3_o           (funct3),
        .funct7_o           (funct7),
        .take_branch_e_o     (take_branch_e),
        // hazard
        .stall_f_i          (stall_f),
        .stall_d_i          (stall_d),
        .flush_d_i          (flush_d),
        .flush_e_i          (flush_e),
        .forward_a_e_i      (forward_a_e),
        .forward_b_e_i      (forward_b_e),
        .rs1_d_o            (rs1_d),
        .rs2_d_o            (rs2_d),
        .rs1_e_o            (rs1_e),
        .rs2_e_o            (rs2_e),
        .rd_e_o             (rd_e),
        .rd_m_o             (rd_m),
        .rd_w_o             (rd_w)
    );

    logic [1:0] result_src_e;
    Controlpath controlpath (
        .clk_i                (clk_i),
        .reset_i              (reset_i),
        // input from datapath
        .op_i                 (op),
        .funct3_i             (funct3),
        .funct7_i             (funct7),
        .take_branch_e_i      (take_branch_e),
        .flush_e_i            (flush_e),
        // output to datapath
        .imm_src_d_o          (imm_src_d),
        .alu_src_e_o          (alu_src_e),
        .alu_control_e_o      (alu_control_e),
        .invert_cond_e_o      (invert_cond_e),
        .jump_src_e_o         (jump_src_e),
        .pc_src_e_o           (pc_src_e),
        .mem_write_m_o        (mem_write_m),
        .reg_write_m_o        (reg_write_m),
        .result_src_w_o       (result_src_w),
        .reg_write_w_o        (reg_write_w),
        // output to hazard
        .result_src_e_o       (result_src_e)
    );

    Hazard hazard (
        // input from datapath
        .rs1_d_i           (rs1_d),
        .rs2_d_i           (rs2_d),
        .rs1_e_i           (rs1_e),
        .rs2_e_i           (rs2_e),
        .rd_e_i            (rd_e),
        .rd_m_i            (rd_m),
        .rd_w_i            (rd_w),
        // input from control
        .pc_src_e_i        (pc_src_e),
        .result_src_e_i    (result_src_e),
        .reg_write_m_i     (reg_write_m),
        .reg_write_w_i     (reg_write_w),
        // output to datapath
        .stall_f_o         (stall_f),
        .stall_d_o         (stall_d),
        .flush_d_o         (flush_d),
        .flush_e_o         (flush_e),
        .forward_a_e_o     (forward_a_e),
        .forward_b_e_o     (forward_b_e)
    );

endmodule
