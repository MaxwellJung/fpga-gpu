`include "./hdl/processor/defines.svh"

module Decode (
    input logic clk,
    input logic reset,

    input logic [31:0] instruction_f,
    input logic [31:0] pc_f,
    input logic [31:0] pc_plus_4_f,

    input logic stall_d,
    input logic flush_d,
    input imm_src_t imm_src_d,

    input logic [4:0] rd_w,
    input logic [31:0] result_w,
    input logic reg_write_w,

    output opcode_t op,
    output logic [2:0] funct3,
    output logic [6:0] funct7,

    output logic [31:0] rd1_d,
    output logic [31:0] rd2_d,
    output logic [31:0] pc_d,
    output logic [4:0] rs1_d,
    output logic [4:0] rs2_d,
    output logic [4:0] rd_d,
    output logic [31:0] imm_ext_d,
    output logic [31:0] pc_plus_4_d
);
    logic [31:0] instruction_d;
    always_ff @(posedge clk) begin
        if (reset || flush_d) begin
            {instruction_d, pc_d, pc_plus_4_d} <= '0;
        end else begin
            if (!stall_d) begin
                {instruction_d, pc_d, pc_plus_4_d} <= 
                {instruction_f, pc_f, pc_plus_4_f};
            end
        end
    end

    always_comb begin
        {funct7, rs2_d, rs1_d, funct3, rd_d, op} = instruction_d;
    end

    RegisterFile register_file (
        .clk(clk),
        .reset(reset),

        .address_1(rs1_d),
        .address_2(rs2_d),
        
        .rd_data_1(rd1_d),
        .rd_data_2(rd2_d),

        .address_3(rd_w),
        .wr_data(result_w),
        .wr_en(reg_write_w)
    );

    SignExtend sign_extend (
        .instr(instruction_d[31:7]),
        .imm_src(imm_src_d),
        .imm_ext(imm_ext_d)
    );

endmodule