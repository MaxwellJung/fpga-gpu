`include "./hdl/processor/defines.svh"

module AluDecoder (
    input opcode_t op_i,
    input logic [2:0] funct3_i,
    input logic [6:0] funct7_i,
    input logic [1:0] alu_op_i,
    output alu_control_t alu_control_o,
    output logic invert_condition_o
);
    alu_control_t alu_control;
    logic invert_condition;
    always_comb begin
        invert_condition = '0; // NOOP
        case(alu_op_i)
            2'b00: alu_control = ALU_ADD; // lw, sw
            2'b01: begin
                case (funct3_i)
                    3'b000: begin
                        alu_control = ALU_EQUAL; // beq
                        invert_condition = 1'b0;
                    end
                    3'b001: begin
                        alu_control = ALU_EQUAL; // bne
                        invert_condition = 1'b1;
                    end
                    3'b100: begin
                        alu_control = ALU_SLT; // blt
                        invert_condition = 1'b0;
                    end
                    3'b101: begin
                        alu_control = ALU_SLT; // bge
                        invert_condition = 1'b1;
                    end
                    default: begin
                        alu_control = ALU_A; // NOOP
                        invert_condition = 1'b0;
                    end
                endcase
            end
            2'b10: begin
                case(funct3_i) // R–type or I–type ALU
                    3'b000: begin
                        case ({op_i[5], funct7_i[5]})
                            2'b00: alu_control = ALU_ADD; // addi
                            // subi not possible because funct7[5] conflicts with immediate[10]
                            2'b01: alu_control = ALU_ADD; // addi 
                            2'b10: alu_control = ALU_ADD; // add
                            2'b11: alu_control = ALU_SUB; // sub
                            default: alu_control = ALU_A; // NOOP
                        endcase
                    end
                    3'b001: alu_control = ALU_SLL; // sll, slli
                    3'b010: alu_control = ALU_SLT; // slt, slti
                    3'b011: alu_control = ALU_A; // sltu, sltiu
                    3'b100: alu_control = ALU_XOR; // xor, xori
                    3'b101: begin
                        case ({op_i[5], funct7_i[5]})
                            2'b00: alu_control = ALU_SRL; // srli
                            2'b01: alu_control = ALU_SRA; // srai
                            2'b10: alu_control = ALU_SRL; // srl
                            2'b11: alu_control = ALU_SRA; // sra
                            default: alu_control = ALU_A; // NOOP
                        endcase
                    end
                    3'b110: alu_control = ALU_OR; // or, ori
                    3'b111: alu_control = ALU_AND; // and, andi
                    default: alu_control = ALU_A; // NOOP
                endcase
            end
            2'b11: alu_control = ALU_B; // lui
            default: alu_control = ALU_A; // NOOP
        endcase
    end

    always_comb begin
        alu_control_o = alu_control;
        invert_condition_o = invert_condition;
    end
endmodule