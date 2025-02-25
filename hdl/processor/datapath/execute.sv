`include "./hdl/processor/defines.svh"

module Execute (
    input logic clk,
    input logic reset,
    
    input logic [31:0] rd1_d,
    input logic [31:0] rd2_d,
    input logic [31:0] pc_d,
    input logic [4:0] rs1_d,
    input logic [4:0] rs2_d,
    input logic [4:0] rd_d,
    input logic [31:0] imm_ext_d,
    input logic [31:0] pc_plus_4_d,

    input logic [31:0] alu_result_m,
    
    input logic [31:0] result_w,

    input logic flush_e,
    input logic [1:0] forward_a_e,
    input logic [1:0] forward_b_e,
    input alu_src_t alu_src_e,
    input alu_control_t alu_control_e,
    input logic invert_cond_e,
    input jump_src_t jump_src_e,
    output logic [4:0] rs1_e,
    output logic [4:0] rs2_e,
    output logic [31:0] pc_target_e,
    output logic take_branch_e,

    output logic [31:0] alu_result_e,
    output logic [31:0] write_data_e,
    output logic [4:0] rd_e,
    output logic [31:0] pc_plus_4_e
);
    logic [31:0] rd1_e;
    logic [31:0] rd2_e;
    logic [31:0] pc_e;
    logic [31:0] imm_ext_e;
    always_ff @(posedge clk) begin
        if (reset || flush_e) begin
            {rd1_e, rd2_e, pc_e, rs1_e, rs2_e, rd_e, imm_ext_e, pc_plus_4_e} <= '0;
        end else begin
            {rd1_e, rd2_e, pc_e, rs1_e, rs2_e, rd_e, imm_ext_e, pc_plus_4_e} <= 
            {rd1_d, rd2_d, pc_d, rs1_d, rs2_d, rd_d, imm_ext_d, pc_plus_4_d};
        end
    end

    logic [31:0] src_a_e;
    always_comb begin
        case (forward_a_e)
            2'b00: src_a_e = rd1_e;
            2'b01: src_a_e = result_w;
            2'b10: src_a_e = alu_result_m;
            default: src_a_e = '0;
        endcase
    end

    always_comb begin
        case (forward_b_e)
            2'b00: write_data_e = rd2_e;
            2'b01: write_data_e = result_w;
            2'b10: write_data_e = alu_result_m;
            default: write_data_e = '0;
        endcase
    end

    logic [31:0] src_b_e;
    always_comb begin
        case (alu_src_e)
            ALU_SRC_REG: src_b_e = write_data_e;
            ALU_SRCMM: src_b_e = imm_ext_e;
            default: src_b_e = '0;
        endcase
    end

    Alu alu (
        .src_a(src_a_e),
        .src_b(src_b_e),
        .control(alu_control_e),
        .invert_cond(invert_cond_e),

        .result(alu_result_e),
        .take_branch(take_branch_e)
    );

    always_comb begin
        case (jump_src_e)
            JUMP_SRC_PC:
                pc_target_e = pc_e + imm_ext_e;
            JUMP_SRC_REG: // equivalent to (src_a_e + imm_ext_e)
                pc_target_e = alu_result_e;
            default: begin // unknown jump
                pc_target_e = '0;
            end
        endcase
    end

endmodule
