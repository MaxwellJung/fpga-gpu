`include "./hdl/processor/defines.svh"

module AluDecoder (
    input opcode_t op,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    output alu_control_t alu_control,
    output logic invert_cond
);
    always_comb begin
        // NOOP default
        alu_control = ALU_NOOP;
        invert_cond = '0;
        case(op)
            OP_LOAD, OP_STORE:
                alu_control = ALU_ADD; // lw, sw
            OP_JAL:
                alu_control = ALU_ADD; // jal
            OP_BRANCH: begin
                case (funct3)
                    3'b000: begin
                        alu_control = ALU_EQUAL; // beq
                        invert_cond = 1'b0;
                    end
                    3'b001: begin
                        alu_control = ALU_EQUAL; // bne
                        invert_cond = 1'b1;
                    end
                    3'b100: begin
                        alu_control = ALU_SLT; // blt
                        invert_cond = 1'b0;
                    end
                    3'b101: begin
                        alu_control = ALU_SLT; // bge
                        invert_cond = 1'b1;
                    end
                    3'b110: begin
                        alu_control = ALU_SLTU; // bltu
                        invert_cond = 1'b0;
                    end
                    3'b111: begin
                        alu_control = ALU_SLTU; // bgeu
                        invert_cond = 1'b1;
                    end
                    default: begin
                        alu_control = ALU_NOOP; // NOOP
                        invert_cond = 1'b0;
                    end
                endcase
            end
            OP_ALU_R, OP_ALU_I: begin // R–type or I–type ALU
                case(funct3)
                    3'b000: begin
                        case ({op[5], funct7[6:5]})
                            3'b000: alu_control = ALU_ADD; // addi
                            // subi not possible because funct7[5] conflicts with immediate[10]
                            3'b001: alu_control = ALU_ADD; // addi
                            3'b010: alu_control = ALU_ADD; // addi
                            3'b011: alu_control = ALU_ADD; // addi
                            3'b100: alu_control = ALU_ADD; // add
                            3'b101: alu_control = ALU_SUB; // sub
                            3'b110: alu_control = ALU_XY_ADD; // addxy
                            3'b111: alu_control = ALU_XY_SUB; // subxy
                            default: alu_control = ALU_NOOP; // NOOP
                        endcase
                    end
                    3'b001: alu_control = ALU_SLL; // sll, slli
                    3'b010: alu_control = ALU_SLT; // slt, slti
                    3'b011: alu_control = ALU_SLTU; // sltu, sltiu
                    3'b100: alu_control = ALU_XOR; // xor, xori
                    3'b101: begin
                        case ({op[5], funct7[5]})
                            2'b00: alu_control = ALU_SRL; // srli
                            2'b01: alu_control = ALU_SRA; // srai
                            2'b10: alu_control = ALU_SRL; // srl
                            2'b11: alu_control = ALU_SRA; // sra
                            default: alu_control = ALU_NOOP; // NOOP
                        endcase
                    end
                    3'b110: alu_control = ALU_OR; // or, ori
                    3'b111: alu_control = ALU_AND; // and, andi
                    default: alu_control = ALU_NOOP; // NOOP
                endcase
            end
            OP_LUI: // U-type ALU
                alu_control = ALU_B; // lui
            OP_JALR:
                alu_control = ALU_ADD; // jalr
            OP_CUSTOM2:
                alu_control = ALU_A; // fbsw 
            OP_AUIPC:
                alu_control = ALU_ADD;
            default:
                alu_control = ALU_NOOP; // NOOP
        endcase
    end

endmodule
