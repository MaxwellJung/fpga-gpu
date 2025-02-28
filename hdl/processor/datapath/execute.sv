`include "./hdl/processor/defines.svh"

module Execute (
    input logic clk,
    input logic reset,
    
    // input from previous pipeline
    input logic [31:0] d_rs1_value,
    input logic [31:0] d_rs2_value,
    input logic [31:0] d_pc,
    input logic [4:0] d_rs1,
    input logic [4:0] d_rs2,
    input logic [4:0] d_rd,
    input logic [31:0] d_imm_ext,
    input logic [31:0] d_pc_plus_4,

    // forward
    input logic [31:0] m_alu_result,
    input logic [31:0] w_result,

    // hazard
    input logic e_flush,
    input logic [1:0] e_forward_a,
    input logic [1:0] e_forward_b,

    // control
    input alu_src_b_t e_alu_src_a,
    input alu_src_b_t e_alu_src_b,
    input alu_control_t e_alu_control,
    input logic e_invert_cond,
    input jump_src_t e_jump_src,
    output logic [4:0] e_rs1,
    output logic [4:0] e_rs2,
    output logic [31:0] e_pc_target,
    output logic e_take_branch,

    // output to next pipeline
    output logic [31:0] e_alu_result,
    output logic [31:0] e_write_data,
    output logic [4:0] e_rd,
    output logic [31:0] e_pc_plus_4
);
    logic [31:0] e_rs1_value;
    logic [31:0] e_rs2_value;
    logic [31:0] e_pc;
    logic [31:0] e_imm_ext;
    always_ff @(posedge clk) begin
        if (reset || e_flush) begin
            {e_rs1_value, e_rs2_value, e_pc, e_rs1, e_rs2, e_rd, e_imm_ext, e_pc_plus_4} <= '0;
        end else begin
            {e_rs1_value, e_rs2_value, e_pc, e_rs1, e_rs2, e_rd, e_imm_ext, e_pc_plus_4} <= 
            {d_rs1_value, d_rs2_value, d_pc, d_rs1, d_rs2, d_rd, d_imm_ext, d_pc_plus_4};
        end
    end

    logic [31:0] e_src_a_rs1;
    logic [31:0] e_src_a;
    always_comb begin
        case (e_forward_a)
            2'b00: e_src_a_rs1 = e_rs1_value;
            2'b01: e_src_a_rs1 = w_result;
            2'b10: e_src_a_rs1 = m_alu_result;
            default: e_src_a_rs1 = '0;
        endcase

        case (e_alu_src_a)
            ALU_SRC_A_REG: e_src_a = e_src_a_rs1;
            ALU_SRC_A_PC: e_src_a = e_pc;
            default: e_src_a = '0;
    endcase
    end

    logic [31:0] e_src_b_rs2;
    logic [31:0] e_src_b;
    always_comb begin
        case (e_forward_b)
            2'b00: e_src_b_rs2 = e_rs2_value;
            2'b01: e_src_b_rs2 = w_result;
            2'b10: e_src_b_rs2 = m_alu_result;
            default: e_src_b_rs2 = '0;
        endcase

        e_write_data = e_src_b_rs2;

        case (e_alu_src_b)
            ALU_SRC_B_REG: e_src_b = e_src_b_rs2;
            ALU_SRC_B_IMM: e_src_b = e_imm_ext;
            default: e_src_b = '0;
        endcase
    end

    Alu alu (
        .src_a(e_src_a),
        .src_b(e_src_b),
        .control(e_alu_control),
        .invert_cond(e_invert_cond),

        .result(e_alu_result),
        .take_branch(e_take_branch)
    );

    always_comb begin
        case (e_jump_src)
            JUMP_SRC_PC:
                e_pc_target = e_pc + e_imm_ext;
            JUMP_SRC_REG: // equivalent to (e_src_a + e_imm_ext)
                e_pc_target = e_alu_result;
            default: begin // unknown jump
                e_pc_target = '0;
            end
        endcase
    end

endmodule
