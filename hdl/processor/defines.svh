`ifndef DEFINES_H
`define DEFINES_H

typedef enum logic [6:0] {
    OP_LOAD     = 7'b0000011, // (3)
    OP_CUSTOM1  = 7'b0001011, // (11)
    OP_ALU_I    = 7'b0010011, // (19)
    OP_AUIPC    = 7'b0010111, // (23)
    OP_STORE    = 7'b0100011, // (35)
    OP_CUSTOM2  = 7'b0101011, // (43)
    OP_ALU_R    = 7'b0110011, // (51)
    OP_LUI      = 7'b0110111, // (55)
    OP_CUSTOM3  = 7'b1011011, // (91)
    OP_BRANCH   = 7'b1100011, // (99)
    OP_JALR     = 7'b1100111, // (103)
    OP_JAL      = 7'b1101111, // (111)
    OP_CUSTOM4  = 7'b1111011  // (123)
} opcode_t;

typedef enum logic [3:0] {
    ALU_NOOP,
    ALU_A,
    ALU_B,
    ALU_ADD,
    ALU_SUB,
    ALU_AND,
    ALU_OR,
    ALU_XOR,
    ALU_SLT,
    ALU_SLTU,
    ALU_SLL,
    ALU_SRL,
    ALU_SRA,
    ALU_EQUAL,
    ALU_XY_ADD,
    ALU_XY_SUB
} alu_control_t;

typedef enum logic [2:0] {
    IMM_I, // I−type
    IMM_S, // S−type (stores)
    IMM_B, // B−type (branches)
    IMM_J, // J−type (jal)
    IMM_U // U-type (lui)
} imm_src_t;

typedef enum logic {
    ALU_SRC_A_REG,
    ALU_SRC_A_PC
} alu_src_a_t;

typedef enum logic {
    ALU_SRC_B_REG,
    ALU_SRC_B_IMM
} alu_src_b_t;

typedef enum logic {
    JUMP_SRC_PC, // JTA/BTA = PC + immediate
    JUMP_SRC_REG // JTA/BTA = rs1 + immediate
} jump_src_t;

typedef enum logic {
    FB_NO_WRITE,
    FB_WRITE
} fb_write_t;

typedef enum logic [1:0] {
    RESULT_SRC_ALU,
    RESULT_SRC_MEMORY,
    RESULT_SRC_PC_PLUS_4
} result_src_t;

typedef enum logic [1:0] {
    MEM_SIZE_WORD,
    MEM_SIZE_HALF,
    MEM_SIZE_BYTE
} mem_size_t;

typedef enum logic {
    LOAD_SIGNED,
    LOAD_UNSIGNED
} load_sign_t;

typedef enum logic [3:0] {
    SELECT_NONE = 4'b0000,
    SELECT_MAIN_MEMORY = 4'b0001,
    SELECT_IO_REGISTERS = 4'b0010,
    SELECT_PALETTE = 4'b0100,
    SELECT_FRAMEBUFFER = 4'b1000
} device_select_t;

`endif // DEFINES_H
