module Decode (
    input logic clk_i,
    input logic reset_i,

    input logic [31:0] instruction_f_i,
    input logic [31:0] pc_f_i,
    input logic [31:0] pc_plus_4_f_i,

    input logic stall_d_i,
    input logic flush_d_i,
    input logic [1:0] imm_src_d_i,

    input logic [4:0] rd_w_i,
    input logic [31:0] result_w_i,
    input logic reg_write_w_i,

    output logic [6:0] op_o,
    output logic [2:0] funct3_o,
    output logic funct7_o,

    output logic [31:0] rd1_d_o,
    output logic [31:0] rd2_d_o,
    output logic [31:0] pc_d_o,
    output logic [4:0] rs1_d_o,
    output logic [4:0] rs2_d_o,
    output logic [4:0] rd_d_o,
    output logic [31:0] imm_ext_d_o,
    output logic [31:0] pc_plus_4_d_o
);
    logic [31:0] instruction_d;
    logic [31:0] pc_d;
    logic [31:0] pc_plus_4_d;
    always_ff @(posedge clk_i) begin
        if (reset_i || flush_d_i) begin
            {instruction_d, pc_d, pc_plus_4_d} <= '0;
        end else begin
            if (!stall_d_i) begin
                {instruction_d, pc_d, pc_plus_4_d} <= 
                {instruction_f_i, pc_f_i, pc_plus_4_f_i};
            end
        end
    end

    logic [6:0] op;
    logic [2:0] funct3;
    logic funct7;
    logic [4:0] rs1_d;
    logic [4:0] rs2_d;
    logic [4:0] rd_d;
    always_comb begin
        op = instruction_d[6:0];
        funct3 = instruction_d[14:12];
        funct7 = instruction_d[30];
        rs1_d = instruction_d[19:15];
        rs2_d = instruction_d[24:20];
        rd_d = instruction_d[11:7];
    end

    logic [31:0] rd1_d;
    logic [31:0] rd2_d;
    RegisterFile register_file (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .address_1_i(rs1_d),
        .address_2_i(rs2_d),
        
        .rd_data_1_o(rd1_d),
        .rd_data_2_o(rd2_d),

        .address_3_i(rd_w_i),
        .wr_data_i(result_w_i),
        .wr_en_i(reg_write_w_i)
    );

    logic [31:0] imm_ext_d;
    SignExtend sign_extend (
        .instr_i(instruction_d[31:7]),
        .imm_src_i(imm_src_d_i),
        .imm_ext_o(imm_ext_d)
    );

    always_comb begin
        op_o = op;
        funct3_o = funct3;
        funct7_o = funct7;
    end

    always_comb begin
        rd1_d_o = rd1_d;
        rd2_d_o = rd2_d;
        pc_d_o = pc_d;
        rs1_d_o = rs1_d;
        rs2_d_o = rs2_d;
        rd_d_o = rd_d;
        imm_ext_d_o = imm_ext_d;
        pc_plus_4_d_o = pc_plus_4_d;
    end

endmodule