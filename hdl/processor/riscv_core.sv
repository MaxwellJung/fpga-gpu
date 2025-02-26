`include "./hdl/processor/defines.svh"

module RISCVCore #(
    parameter INIT_FILE = "build/gputest.mem"
) (
    input logic clk,
    input logic reset,
    
    // memory bus
    output logic [31:0] bus_addr,
    input logic [31:0] bus_rd_data,
    output logic [31:0] bus_wr_data,
    output logic bus_wr_en
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

    Datapath #(
        .INIT_FILE(INIT_FILE)
    ) datapath (
        .clk              (clk),
        .reset            (reset),
        // memory bus
        .bus_addr         (bus_addr),
        .bus_rd_data      (bus_rd_data),
        .bus_wr_data      (bus_wr_data),
        .bus_wr_en        (bus_wr_en),
        // control
        .imm_src_d        (imm_src_d),
        .alu_src_e        (alu_src_e),
        .alu_control_e    (alu_control_e),
        .invert_cond_e    (invert_cond_e),
        .jump_src_e       (jump_src_e),
        .pc_src_e         (pc_src_e),
        .mem_write_m      (mem_write_m),
        .result_src_w     (result_src_w),
        .reg_write_w      (reg_write_w),
        .op               (op),
        .funct3           (funct3),
        .funct7           (funct7),
        .take_branch_e     (take_branch_e),
        // hazard
        .stall_f          (stall_f),
        .stall_d          (stall_d),
        .flush_d          (flush_d),
        .flush_e          (flush_e),
        .forward_a_e      (forward_a_e),
        .forward_b_e      (forward_b_e),
        .rs1_d            (rs1_d),
        .rs2_d            (rs2_d),
        .rs1_e            (rs1_e),
        .rs2_e            (rs2_e),
        .rd_e             (rd_e),
        .rd_m             (rd_m),
        .rd_w             (rd_w)
    );

    logic [1:0] result_src_e;
    Controlpath controlpath (
        .clk                (clk),
        .reset              (reset),
        // input from datapath
        .op                 (op),
        .funct3             (funct3),
        .funct7             (funct7),
        .take_branch_e      (take_branch_e),
        .flush_e            (flush_e),
        // output to datapath
        .imm_src_d          (imm_src_d),
        .alu_src_e          (alu_src_e),
        .alu_control_e      (alu_control_e),
        .invert_cond_e      (invert_cond_e),
        .jump_src_e         (jump_src_e),
        .pc_src_e           (pc_src_e),
        .mem_write_m        (mem_write_m),
        .reg_write_m        (reg_write_m),
        .result_src_w       (result_src_w),
        .reg_write_w        (reg_write_w),
        // output to hazard
        .result_src_e       (result_src_e)
    );

    Hazard hazard (
        // input from datapath
        .rs1_d           (rs1_d),
        .rs2_d           (rs2_d),
        .rs1_e           (rs1_e),
        .rs2_e           (rs2_e),
        .rd_e            (rd_e),
        .rd_m            (rd_m),
        .rd_w            (rd_w),
        // input from control
        .pc_src_e        (pc_src_e),
        .result_src_e    (result_src_e),
        .reg_write_m     (reg_write_m),
        .reg_write_w     (reg_write_w),
        // output to datapath
        .stall_f         (stall_f),
        .stall_d         (stall_d),
        .flush_d         (flush_d),
        .flush_e         (flush_e),
        .forward_a_e     (forward_a_e),
        .forward_b_e     (forward_b_e)
    );

endmodule
