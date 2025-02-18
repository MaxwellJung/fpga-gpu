module SignExtend (
    input logic [31:0] imm_i,
    input logic [1:0] imm_src_i,
    output logic [31:0] imm_ext_o
);

    always_comb begin
        case (imm_src_i)
            0: imm_ext_o = {{20{imm_i[11]}}, imm_i[11:0]};
            1: imm_ext_o = {{19{imm_i[12]}}, imm_i[12:0]};
            2: imm_ext_o = {{11{imm_i[20]}}, imm_i[20:0]};
            default: imm_ext_o = '0;
        endcase
    end

endmodule