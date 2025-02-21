module Control (
    input logic clk_i,
    input logic reset_i,

    input logic zero,
    input logic [6:0] op,
    input logic [2:0] funct3,
    input logic funct7,

    output logic pc_write,
    output logic adr_src,
    output logic mem_write,
    output logic ir_write,
    output logic [1:0] result_src,
    output logic [2:0] alu_control,
    output logic [2:0] alu_src_a,
    output logic [2:0] alu_src_b,
    output logic [1:0] imm_src,
    output logic reg_write
);

endmodule