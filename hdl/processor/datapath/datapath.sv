module Datapath(
    input logic clk_i,
    input logic reset_i,

    // control
    input logic [1:0] imm_src_d_i,
    input logic alu_src_e_i,
    input logic [2:0] alu_control_e_i,
    input logic pc_src_e_i,
    input logic mem_write_m_i,
    input logic [1:0] result_src_w_i,
    input logic reg_write_w_i,
    output logic [6:0] op_o,
    output logic [2:0] funct3_o,
    output logic funct7_o,
    output logic zero_e_o,

    // hazard
    input logic stall_f_i,
    input logic stall_d_i,
    input logic flush_d_i,
    input logic flush_e_i,
    input logic [1:0] forward_a_e_i,
    input logic [1:0] forward_b_e_i,
    output logic [4:0] rs1_d_o,
    output logic [4:0] rs2_d_o,
    output logic [4:0] rs1_e_o,
    output logic [4:0] rs2_e_o,
    output logic [4:0] rd_e_o,
    output logic [4:0] rd_m_o,
    output logic [4:0] rd_w_o
);
    logic [31:0] pc_target_e;

    logic [31:0] instruction_f;
    logic [31:0] pc_f;
    logic [31:0] pc_plus_4_f;
    Fetch fetch (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .stall_f_i(stall_f_i),

        .pc_src_e_i(pc_src_e_i),
        .pc_target_e_i(pc_target_e),

        .instruction_f_o(instruction_f),
        .pc_f_o(pc_f),
        .pc_plus_4_f_o(pc_plus_4_f)
    );

    logic [4:0] rd_w;
    logic [31:0] result_w;

    logic [6:0] op;
    logic [2:0] funct3;
    logic funct7;

    logic [31:0] rd1_d;
    logic [31:0] rd2_d;
    logic [31:0] pc_d;
    logic [4:0] rs1_d;
    logic [4:0] rs2_d;
    logic [4:0] rd_d;
    logic [31:0] imm_ext_d;
    logic [31:0] pc_plus_4_d;
    Decode decode (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .instruction_f_i(instruction_f),
        .pc_f_i(pc_f),
        .pc_plus_4_f_i(pc_plus_4_f),

        .stall_d_i(stall_d_i),
        .flush_d_i(flush_d_i),
        .imm_src_d_i(imm_src_d_i),

        .rd_w_i(rd_w),
        .result_w_i(result_w),
        .reg_write_w_i(reg_write_w_i),

        .op_o(op),
        .funct3_o(funct3),
        .funct7_o(funct7),

        .rd1_d_o(rd1_d),
        .rd2_d_o(rd2_d),
        .pc_d_o(pc_d),
        .rs1_d_o(rs1_d),
        .rs2_d_o(rs2_d),
        .rd_d_o(rd_d),
        .imm_ext_d_o(imm_ext_d),
        .pc_plus_4_d_o(pc_plus_4_d)
    );

    logic [31:0] alu_result_m;
    logic [4:0] rs1_e;
    logic [4:0] rs2_e;
    logic zero_e;

    logic [31:0] alu_result_e;
    logic [31:0] write_data_e;
    logic [4:0] rd_e;
    logic [31:0] pc_plus_4_e;
    Execute execute (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .rd1_d_i(rd1_d),
        .rd2_d_i(rd2_d),
        .pc_d_i(pc_d),
        .rs1_d_i(rs1_d),
        .rs2_d_i(rs2_d),
        .rd_d_i(rd_d),
        .imm_ext_d_i(imm_ext_d),
        .pc_plus_4_d_i(pc_plus_4_d),

        .alu_result_m_i(alu_result_m),

        .result_w_i(result_w),

        .flush_e_i(flush_e_i),
        .forward_a_e_i(forward_a_e_i),
        .forward_b_e_i(forward_b_e_i),
        .alu_src_e_i(alu_src_e_i),
        .alu_control_e_i(alu_control_e_i),
        .rs1_e_o(rs1_e),
        .rs2_e_o(rs2_e),
        .pc_target_e_o(pc_target_e),
        .zero_e_o(zero_e),

        .alu_result_e_o(alu_result_e),
        .write_data_e_o(write_data_e),
        .rd_e_o(rd_e),
        .pc_plus_4_e_o(pc_plus_4_e)
    );

    logic [31:0] read_data_m;
    logic [4:0] rd_m;
    logic [31:0] pc_plus_4_m;
    Memory memory (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .alu_result_e_i(alu_result_e),
        .write_data_e_i(write_data_e),
        .rd_e_i(rd_e),
        .pc_plus_4_e_i(pc_plus_4_e),

        .mem_write_m_i(mem_write_m_i),

        .alu_result_m_o(alu_result_m),
        .read_data_m_o(read_data_m),
        .rd_m_o(rd_m),
        .pc_plus_4_m_o(pc_plus_4_m)
    );

    Writeback writeback (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .alu_result_m_i(alu_result_m),
        .read_data_m_i(read_data_m),
        .rd_m_i(rd_m),
        .pc_plus_4_m_i(pc_plus_4_m),

        .result_src_w_i(result_src_w_i),

        .result_w_o(result_w),
        .rd_w_o(rd_w)
    );

    // output to control
    always_comb begin
        op_o = op;
        funct3_o = funct3;
        funct7_o = funct7;
        zero_e_o = zero_e;
    end

    // output to hazard
    always_comb begin
        rs1_d_o = rs1_d;
        rs2_d_o = rs2_d;
        rs1_e_o = rs1_e;
        rs2_e_o = rs2_e;
        rd_e_o = rd_e;
        rd_m_o = rd_m;
        rd_w_o = rd_w;
    end

endmodule