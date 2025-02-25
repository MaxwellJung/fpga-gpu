module AluDec (
    input logic op_i,
    input logic [2:0] funct3_i,
    input logic funct7_i,
    input logic [1:0] alu_op_i,
    output logic [2:0] alu_control_o
);
    logic r_type_sub;
    assign r_type_sub = funct7_i & op_i; // TRUE for R–type subtract
    always_comb
    case(alu_op_i)
        2'b00: alu_control_o = 3'b000; // addition
        2'b01: alu_control_o = 3'b001; // subtraction
        default: case(funct3_i) // R–type or I–type ALU
            3'b000: begin 
                if (r_type_sub)
                    alu_control_o = 3'b001; // sub
                else
                    alu_control_o = 3'b000; // add, addi
            end
            3'b010: alu_control_o = 3'b101; // slt, slti
            3'b110: alu_control_o = 3'b011; // or, ori
            3'b111: alu_control_o = 3'b010; // and, andi
            default: alu_control_o = '0; // ???
        endcase
    endcase
endmodule