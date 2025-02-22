module Control (
    input logic zero_i,
    input logic [6:0] op_i,
    input logic [2:0] funct3_i,
    input logic funct7_i,

    output logic reg_write_o,
    output logic [1:0] result_src_o,
    output logic mem_write_o,
    output logic jump_o,
    output logic branch_o,
    output logic [2:0] alu_control_o,
    output logic alu_src_o,
    output logic [1:0] imm_src_o
);
    logic reg_write;
    logic [1:0] result_src;
    logic mem_write;
    logic jump;
    logic branch;
    logic alu_src;
    logic [1:0] imm_src;
    logic [1:0] alu_op;
    MainDecoder main_decoder (
        .op_i(op_i),

        .branch_o(branch),
        .jump_o(jump),
        .result_src_o(result_src),
        .mem_write_o(mem_write),
        .alu_src_o(alu_src),
        .imm_src_o(imm_src),
        .reg_write_o(reg_write),

        .alu_op_o(alu_op)
    );

    logic [2:0] alu_control;
    AluDecoder alu_decoder (
        .op_i(op_i[5]),
        .funct3_i(funct3_i),
        .funct7_i(funct7_i),
        .alu_op_i(alu_op),
        .alu_control_o(alu_control)
    );

    always_comb begin
        reg_write_o = reg_write;
        result_src_o = result_src;
        mem_write_o = mem_write;
        jump_o = jump;
        branch_o = branch;
        alu_control_o = alu_control;
        alu_src_o = alu_src;
        imm_src_o = imm_src;
    end

endmodule