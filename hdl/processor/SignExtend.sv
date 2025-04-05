`include "./hdl/processor/defines.svh"

module SignExtend (
    input logic [31:7] instr,
    input imm_src_t imm_src,
    output logic [31:0] imm_ext
);

    always_comb begin
        case(imm_src)
            IMM_I: imm_ext = {{20{instr[31]}}, instr[31:20]};
            IMM_S: imm_ext = {{20{instr[31]}}, instr[31:25], instr[11:7]};
            IMM_B: imm_ext = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
            IMM_J: imm_ext = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
            IMM_U: imm_ext = {instr[31:12], 12'b0};
            default: imm_ext = '0; // undefined
        endcase
    end

endmodule
