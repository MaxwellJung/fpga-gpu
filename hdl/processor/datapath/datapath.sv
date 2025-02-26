`include "./hdl/processor/defines.svh"

module Datapath #(
    parameter INIT_FILE = "data/gpu_inst_init.mem"
) (
    input logic clk,
    input logic reset,

    // memory bus
    output logic [31:0] bus_addr,
    input logic [31:0] bus_rd_data,
    output logic [31:0] bus_wr_data,
    output logic bus_wr_en,

    // control
    input imm_src_t imm_src_d,
    input alu_src_t alu_src_e,
    input alu_control_t alu_control_e,
    input logic invert_cond_e,
    input jump_src_t jump_src_e,
    input logic pc_src_e,
    input logic mem_write_m,
    input logic [1:0] result_src_w,
    input logic reg_write_w,
    output opcode_t op,
    output logic [2:0] funct3,
    output logic [6:0] funct7,
    output logic take_branch_e,

    // hazard
    input logic stall_f,
    input logic stall_d,
    input logic flush_d,
    input logic flush_e,
    input logic [1:0] forward_a_e,
    input logic [1:0] forward_b_e,
    output logic [4:0] rs1_d,
    output logic [4:0] rs2_d,
    output logic [4:0] rs1_e,
    output logic [4:0] rs2_e,
    output logic [4:0] rd_e,
    output logic [4:0] rd_m,
    output logic [4:0] rd_w
);
    logic [31:0] pc_target_e;

    logic [31:0] instruction_f;
    logic [31:0] pc_f;
    logic [31:0] pc_plus_4_f;
    Fetch #(
        .INIT_FILE(INIT_FILE)
    ) fetch (
        .clk(clk),
        .reset(reset),

        .stall_f(stall_f),

        .pc_src_e(pc_src_e),
        .pc_target_e(pc_target_e),

        .instruction_f(instruction_f),
        .pc_f(pc_f),
        .pc_plus_4_f(pc_plus_4_f)
    );

    logic [31:0] result_w;

    logic [31:0] rd1_d;
    logic [31:0] rd2_d;
    logic [31:0] pc_d;
    logic [4:0] rd_d;
    logic [31:0] imm_ext_d;
    logic [31:0] pc_plus_4_d;
    Decode decode (
        .clk(clk),
        .reset(reset),

        .instruction_f(instruction_f),
        .pc_f(pc_f),
        .pc_plus_4_f(pc_plus_4_f),

        .stall_d(stall_d),
        .flush_d(flush_d),
        .imm_src_d(imm_src_d),

        .rd_w(rd_w),
        .result_w(result_w),
        .reg_write_w(reg_write_w),

        .op(op),
        .funct3(funct3),
        .funct7(funct7),

        .rd1_d(rd1_d),
        .rd2_d(rd2_d),
        .pc_d(pc_d),
        .rs1_d(rs1_d),
        .rs2_d(rs2_d),
        .rd_d(rd_d),
        .imm_ext_d(imm_ext_d),
        .pc_plus_4_d(pc_plus_4_d)
    );

    logic [31:0] alu_result_m;

    logic [31:0] alu_result_e;
    logic [31:0] write_data_e;
    logic [31:0] pc_plus_4_e;
    Execute execute (
        .clk(clk),
        .reset(reset),

        .rd1_d(rd1_d),
        .rd2_d(rd2_d),
        .pc_d(pc_d),
        .rs1_d(rs1_d),
        .rs2_d(rs2_d),
        .rd_d(rd_d),
        .imm_ext_d(imm_ext_d),
        .pc_plus_4_d(pc_plus_4_d),

        .alu_result_m(alu_result_m),

        .result_w(result_w),

        .flush_e(flush_e),
        .forward_a_e(forward_a_e),
        .forward_b_e(forward_b_e),
        .alu_src_e(alu_src_e),
        .alu_control_e(alu_control_e),
        .invert_cond_e(invert_cond_e),
        .jump_src_e(jump_src_e),
        .rs1_e(rs1_e),
        .rs2_e(rs2_e),
        .pc_target_e(pc_target_e),
        .take_branch_e(take_branch_e),

        .alu_result_e(alu_result_e),
        .write_data_e(write_data_e),
        .rd_e(rd_e),
        .pc_plus_4_e(pc_plus_4_e)
    );

    logic [31:0] read_data_m;
    logic [31:0] pc_plus_4_m;
    Memory memory (
        .clk             (clk),
        .reset           (reset),
        // input from previous pipeline
        .alu_result_e    (alu_result_e),
        .write_data_e    (write_data_e),
        .rd_e            (rd_e),
        .pc_plus_4_e     (pc_plus_4_e),
        // control
        .mem_write_m     (mem_write_m),
        // memory bus
        .bus_addr            (bus_addr),
        .bus_rd_data         (bus_rd_data),
        .bus_wr_data         (bus_wr_data),
        .bus_wr_en           (bus_wr_en),
        // output to next pipeline
        .alu_result_m    (alu_result_m),
        .read_data_m     (read_data_m),
        .rd_m            (rd_m),
        .pc_plus_4_m     (pc_plus_4_m)
    );

    Writeback writeback (
        .clk(clk),
        .reset(reset),

        .alu_result_m(alu_result_m),
        .read_data_m(read_data_m),
        .rd_m(rd_m),
        .pc_plus_4_m(pc_plus_4_m),

        .result_src_w(result_src_w),

        .result_w(result_w),
        .rd_w(rd_w)
    );

endmodule
