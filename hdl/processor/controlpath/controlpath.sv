module Controlpath (
    input logic clk_i,
    input logic reset_i,

    input logic [6:0] op_i,
    input logic [2:0] funct3_i,
    input logic funct7_i,
    input logic zero_e_i,

    input logic flush_e_i,

    // output to datapath
    output logic [1:0] imm_src_d_o,
    output logic alu_src_e_o,
    output logic [2:0] alu_control_e_o,
    output logic pc_src_e_o,
    output logic mem_write_m_o,
    output logic reg_write_m_o,
    output logic [1:0] result_src_w_o,
    output logic reg_write_w_o,

    // output to hazard
    output logic [1:0] result_src_e_o
);
    logic reg_write_d;
    logic [1:0] result_src_d;
    logic mem_write_d;
    logic jump_d;
    logic branch_d;
    logic [2:0] alu_control_d;
    logic alu_src_d;
    logic [1:0] imm_src_d;

    logic [1:0] alu_op;
    Control control_unit (
        .zero_i(zero_i),
        .op_i(op_i),
        .funct3_i(funct3_i),
        .funct7_i(funct7_i),

        .reg_write_o(reg_write_d),
        .result_src_o(result_src_d),
        .mem_write_o(mem_write_d),
        .jump_o(jump_d),
        .branch_o(branch_d),
        .alu_control_o(alu_control_d),
        .alu_src_o(alu_src_d),
        .imm_src_o(imm_src_d)
    );
    assign imm_src_d_o = imm_src_d;

    logic reg_write_e;
    logic [1:0] result_src_e;
    logic mem_write_e;
    logic jump_e;
    logic branch_e;
    logic [2:0] alu_control_e;
    logic alu_src_e;
    always_ff @(posedge clk_i) begin
        if (reset_i || flush_e_i) begin
            {reg_write_e, result_src_e, mem_write_e, jump_e, branch_e, alu_control_e, alu_src_e} <= '0;
        end else begin
            {reg_write_e, result_src_e, mem_write_e, jump_e, branch_e, alu_control_e, alu_src_e} <= 
            {reg_write_d, result_src_d, mem_write_d, jump_d, branch_d, alu_control_d, alu_src_d};
        end
    end
    assign alu_src_e_o = alu_src_e;
    assign alu_control_e_o = alu_control_e;
    assign pc_src_e_o = (zero_e_i && branch_e) || jump_e;
    assign result_src_e_o = result_src_e;

    logic reg_write_m;
    logic [1:0] result_src_m;
    logic mem_write_m;
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            {reg_write_m, result_src_m, mem_write_m} <= '0;
        end else begin
            {reg_write_m, result_src_m, mem_write_m} <= 
            {reg_write_e, result_src_e, mem_write_e};
        end
    end
    assign mem_write_m_o = mem_write_m;
    assign reg_write_m_o = reg_write_m;

    logic reg_write_w;
    logic [1:0] result_src_w;
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            {reg_write_w, result_src_w} <= '0;
        end else begin
            {reg_write_w, result_src_w} <= 
            {reg_write_m, result_src_m};
        end
    end
    assign reg_write_w_o = reg_write_w;
    assign result_src_w_o = result_src_w;

endmodule