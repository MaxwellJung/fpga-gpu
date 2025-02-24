`include "./hdl/processor/defines.svh"

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
