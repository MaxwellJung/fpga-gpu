module Control (
    input logic clk_i,
    input logic reset_i,

    input logic zero_i,
    input logic [6:0] op_i,
    input logic [2:0] funct3_i,
    input logic funct7_i,

    output logic pc_write_o,
    output logic adr_src_o,
    output logic mem_write_o,
    output logic ir_write_o,
    output logic [1:0] result_src_o,
    output logic [2:0] alu_control_o,
    output logic [2:0] alu_src_a_o,
    output logic [2:0] alu_src_b_o,
    output logic [1:0] imm_src_o,
    output logic reg_write_o
);

    logic [1:0] alu_op;
    ControlFSM control_fsm (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .op_i(op_i),
        .zero_i(zero_i),

        .pc_write_o(pc_write_o),
        .reg_write_o(reg_write_o),
        .mem_write_o(mem_write_o),
        .ir_write_o(ir_write_o),
        .result_src_o(result_src_o),
        .alu_src_a_o(alu_src_a_o),
        .alu_src_b_o(alu_src_b_o),
        .adr_src_o(adr_src_o),

        .alu_op_o(alu_op)
    );

    AluDec alu_decoder (
        .op_i(op_i[5]),
        .funct3_i(funct3_i),
        .funct7_i(funct7_i),
        .alu_op_i(alu_op),
        .alu_control_o(alu_control_o)
    );

    InstDecoder instruction_decoder (
        .op_i(op_i),
        .imm_src_o(imm_src_o)
    );

endmodule