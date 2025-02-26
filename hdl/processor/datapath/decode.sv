`include "./hdl/processor/defines.svh"

module decode (
    input logic clk,
    input logic reset,

    // input from fetch stage
    input logic [31:0] f_pc,
    input logic [31:0] f_pc_plus_4,

    // input from instruction memory
    input logic [31:0] d_instruction,

    // input from hazard unit
    input logic d_stall,
    input logic d_flush,

    // input from writeback stage
    input logic [4:0] w_rd,
    input logic [31:0] w_result,
    input logic w_reg_write,

    // output to control unit
    output opcode_t op,
    output logic [2:0] funct3,
    output logic [6:0] funct7,

    // input from control unit
    input imm_src_t d_imm_src,

    // output to execute pipeline
    output logic [31:0] d_rs1_value,
    output logic [31:0] d_rs2_value,
    output logic [31:0] d_pc,
    output logic [4:0] d_rs1,
    output logic [4:0] d_rs2,
    output logic [4:0] d_rd,
    output logic [31:0] d_imm_ext,
    output logic [31:0] d_pc_plus_4
);
    always_ff @(posedge clk) begin
        if (reset || d_flush) begin
            {d_pc, d_pc_plus_4} <= '0;
        end else begin
            if (!d_stall) begin
                {d_pc, d_pc_plus_4} <= 
                {f_pc, f_pc_plus_4};
            end
        end
    end

    always_comb begin
        {funct7, d_rs2, d_rs1, funct3, d_rd, op} = d_instruction;
    end

    register_file u_register_file (
        .clk          (clk),
        .reset        (reset),

        .rs1          (d_rs1),
        .rs2          (d_rs2),

        .rs1_value    (d_rs1_value),
        .rs2_value    (d_rs2_value),
        
        .rd           (w_rd),
        .rd_value     (w_result),
        .wr_en        (w_reg_write)
    );

    SignExtend sign_extend (
        .instr(d_instruction[31:7]),
        .imm_src(d_imm_src),
        .imm_ext(d_imm_ext)
    );

endmodule