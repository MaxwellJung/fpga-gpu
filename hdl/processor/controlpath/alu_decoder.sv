`include "./hdl/processor/alu.sv"

module AluDecoder (
    input logic [6:0] op_i,
    input logic [2:0] funct3_i,
    input logic [6:0] funct7_i,
    input logic [1:0] alu_op_i,
    output alu_control_t alu_control_o
);
    alu_control_t alu_control;
    always_comb
        case(alu_op_i)
            2'b00: alu_control = ALU_ADD; // lw, sw
            2'b01: alu_control = ALU_SUB; // beq
            2'b10: begin
                case(funct3_i) // R–type or I–type ALU
                    3'b000: begin
                        case ({op_i[5], funct7_i[5]})
                            2'b00: alu_control = ALU_ADD; // add, addi
                            2'b01: alu_control = ALU_ADD; // add, addi
                            2'b10: alu_control = ALU_ADD; // add, addi
                            2'b11: alu_control = ALU_SUB; // sub
                            default: alu_control = ALU_A; // ???
                        endcase
                    end
                    3'b001: alu_control = ALU_SLL; // sll, slli
                    3'b010: alu_control = ALU_SLT; // slt, slti
                    3'b011: alu_control = ALU_A; // sltu, sltiu
                    3'b100: alu_control = ALU_XOR; // xor, xori
                    3'b101: begin
                        case ({op_i[5], funct7_i[5]})
                            2'b00: alu_control = ALU_SRL; // srl, srli
                            2'b01: alu_control = ALU_SRL; // srl, srli
                            2'b10: alu_control = ALU_SRL; // srl, srli
                            2'b11: alu_control = ALU_A; // sra, srai
                            default: alu_control = ALU_A; // ???
                        endcase
                    end
                    3'b110: alu_control = ALU_OR; // or, ori
                    3'b111: alu_control = ALU_AND; // and, andi
                    default: alu_control = ALU_A; // ???
                endcase
            end
            2'b11: alu_control = ALU_B; // lui
            default: alu_control = ALU_A;
        endcase
    
    always_comb begin
        alu_control_o = alu_control;
    end
endmodule