`include "./hdl/processor/alu.sv"

module BranchDecoder (
    input logic branch_i,
    input logic [2:0] funct3_i,
    output logic invert_branch_cond_o
);
    logic invert_branch_cond;
    always_comb
        if (branch_i) begin
            case (funct3_i[0])
                1'b0: invert_branch_cond = 1'b0; // beq
                1'b1: invert_branch_cond = 1'b1; // bne
                default: invert_branch_cond = '0; // ???
            endcase
        end else begin
            invert_branch_cond = '0; // ???
        end
    
    always_comb begin
        invert_branch_cond_o = invert_branch_cond;
    end
endmodule