`ifndef DEFINES_H
`define DEFINES_H

typedef enum logic [6:0] {
    OP_LOAD     = 7'b0000011, // (3)
    OP_ALU_I    = 7'b0010011, // (19)
    OP_AUIPC    = 7'b0010111, // (23)
    OP_STORE    = 7'b0100011, // (35)
    OP_ALU_R    = 7'b0110011, // (51)
    OP_LUI      = 7'b0110111, // (55)
    OP_BRANCH   = 7'b1100011, // (99)
    OP_JUMP_I   = 7'b1100111, // (103)
    OP_JUMP     = 7'b1101111  // (111)
} opcode_t;

typedef enum {
    ALU_A,
    ALU_B,
    ALU_ADD,
    ALU_SUB,
    ALU_AND,
    ALU_OR,
    ALU_XOR,
    ALU_SLT,
    ALU_SLL,
    ALU_SRL,
    ALU_SRA,
    ALU_EQUAL
} alu_control_t;

typedef enum logic [2:0] {
    IMM_I, // I−type
    IMM_S, // S−type (stores)
    IMM_B, // B−type (branches)
    IMM_J, // J−type (jal)
    IMM_U // U-type (lui)
} imm_src_t;

typedef enum logic {
    ALU_SRC_REG,
    ALU_SRC_IMM
} alu_src_t;

`endif // DEFINES_H
