`ifndef SIGN_EXTEND_H
`define SIGN_EXTEND_H

typedef enum logic [2:0] {
    IMM_I, // I−type
    IMM_S, // S−type (stores)
    IMM_B, // B−type (branches)
    IMM_J, // J−type (jal)
    IMM_U // U-type (lui)
} imm_src_t;

module SignExtend (
    input logic [31:7] instr_i,
    input imm_src_t imm_src_i,
    output logic [31:0] imm_ext_o
);
    logic [31:0] imm_ext;
    always_comb begin
        case(imm_src_i)
            IMM_I: imm_ext = {{20{instr_i[31]}}, instr_i[31:20]};
            IMM_S: imm_ext = {{20{instr_i[31]}}, instr_i[31:25], instr_i[11:7]};
            IMM_B: imm_ext = {{20{instr_i[31]}}, instr_i[7], instr_i[30:25], instr_i[11:8], 1'b0};
            IMM_J: imm_ext = {{12{instr_i[31]}}, instr_i[19:12], instr_i[20], instr_i[30:21], 1'b0};
            IMM_U: imm_ext = {instr_i[31:12], 12'b0};
            default: imm_ext = '0; // undefined
        endcase
    end

    always_comb begin
        imm_ext_o = imm_ext;
    end

endmodule

`endif // SIGN_EXTEND_H
