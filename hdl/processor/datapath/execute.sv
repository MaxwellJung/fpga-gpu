`include "./hdl/processor/defines.svh"

module Execute (
    input logic clk_i,
    input logic reset_i,
    
    input logic [31:0] rd1_d_i,
    input logic [31:0] rd2_d_i,
    input logic [31:0] pc_d_i,
    input logic [4:0] rs1_d_i,
    input logic [4:0] rs2_d_i,
    input logic [4:0] rd_d_i,
    input logic [31:0] imm_ext_d_i,
    input logic [31:0] pc_plus_4_d_i,

    input logic [31:0] alu_result_m_i,
    
    input logic [31:0] result_w_i,

    input logic flush_e_i,
    input logic [1:0] forward_a_e_i,
    input logic [1:0] forward_b_e_i,
    input alu_src_t alu_src_e_i,
    input alu_control_t alu_control_e_i,
    input logic invert_condition_e_i,
    output logic [4:0] rs1_e_o,
    output logic [4:0] rs2_e_o,
    output logic [31:0] pc_target_e_o,
    output logic take_branch_e_o,

    output logic [31:0] alu_result_e_o,
    output logic [31:0] write_data_e_o,
    output logic [4:0] rd_e_o,
    output logic [31:0] pc_plus_4_e_o
);
    logic [31:0] rd1_e;
    logic [31:0] rd2_e;
    logic [31:0] pc_e;
    logic [4:0] rs1_e;
    logic [4:0] rs2_e;
    logic [4:0] rd_e;
    logic [31:0] imm_ext_e;
    logic [31:0] pc_plus_4_e;
    always_ff @(posedge clk_i) begin
        if (reset_i || flush_e_i) begin
            {rd1_e, rd2_e, pc_e, rs1_e, rs2_e, rd_e, imm_ext_e, pc_plus_4_e} <= '0;
        end else begin
            {rd1_e, rd2_e, pc_e, rs1_e, rs2_e, rd_e, imm_ext_e, pc_plus_4_e} <= 
            {rd1_d_i, rd2_d_i, pc_d_i, rs1_d_i, rs2_d_i, rd_d_i, imm_ext_d_i, pc_plus_4_d_i};
        end
    end

    logic [31:0] src_a_e;
    always_comb begin
        case (forward_a_e_i)
            2'b00: src_a_e = rd1_e;
            2'b01: src_a_e = result_w_i;
            2'b10: src_a_e = alu_result_m_i;
            default: src_a_e = '0;
        endcase
    end

    logic [31:0] write_data_e;
    always_comb begin
        case (forward_b_e_i)
            2'b00: write_data_e = rd2_e;
            2'b01: write_data_e = result_w_i;
            2'b10: write_data_e = alu_result_m_i;
            default: write_data_e = '0;
        endcase
    end

    logic [31:0] src_b_e;
    always_comb begin
        case (alu_src_e_i)
            ALU_SRC_REG: src_b_e = write_data_e;
            ALU_SRC_IMM: src_b_e = imm_ext_e;
            default: src_b_e = '0;
        endcase
    end

    logic [31:0] alu_result_e;
    logic take_branch_e;
    Alu alu (
        .src_a_i(src_a_e),
        .src_b_i(src_b_e),
        .control_i(alu_control_e_i),
        .invert_condition_i(invert_condition_e_i),

        .result_o(alu_result_e),
        .take_branch_o(take_branch_e)
    );

    logic [31:0] pc_target_e;
    always_comb begin
        pc_target_e = pc_e + imm_ext_e;
    end

    always_comb begin
        rs1_e_o = rs1_e;
        rs2_e_o = rs2_e;
        pc_target_e_o = pc_target_e;
        take_branch_e_o = take_branch_e;
    end

    always_comb begin
        alu_result_e_o = alu_result_e;
        write_data_e_o = write_data_e;
        rd_e_o = rd_e;
        pc_plus_4_e_o = pc_plus_4_e;
    end

endmodule