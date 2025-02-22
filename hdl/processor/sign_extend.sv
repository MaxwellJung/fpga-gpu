module SignExtend (
    input logic [31:7] instr_i,
    input logic [1:0] imm_src_i,
    output logic [31:0] imm_ext_o
);

    always_comb begin
        case(imm_src_i)
            // I−type
            2'b00: imm_ext_o = {{20{instr_i[31]}}, instr_i[31:20]};
            // S−type (stores)
            2'b01: imm_ext_o = {{20{instr_i[31]}}, instr_i[31:25], instr_i[11:7]};
            // B−type (branches)
            2'b10: imm_ext_o = {{20{instr_i[31]}}, instr_i[7], instr_i[30:25], instr_i[11:8], 1'b0};
            // J−type (jal)
            2'b11: imm_ext_o = {{12{instr_i[31]}}, instr_i[19:12], instr_i[20], instr_i[30:21], 1'b0};
            default: imm_ext_o = '0; // undefined
        endcase
    end

endmodule