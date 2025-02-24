module ControlFSM (
    input logic clk_i,
    input logic reset_i,

    input logic [6:0] op_i,
    input logic zero_i,

    output logic pc_write_o,
    output logic reg_write_o,
    output logic mem_write_o,
    output logic ir_write_o,
    output logic [1:0] result_src_o,
    output logic [2:0] alu_src_a_o,
    output logic [2:0] alu_src_b_o,
    output logic adr_src_o,

    output logic [1:0] alu_op_o
);

    enum int unsigned {
        FETCH, // S0
        DECODE, // S1
        MEM_ADR, // S2
        MEM_READ, // S3
        MEM_WB, // S4
        MEM_WRITE, // S5
        EXECUTE_R, // S6
        ALU_WB, // S7
        EXECUTE_I, // S8
        JAL, // S9
        BEQ // S10
    } state, next_state;

    always_comb begin : next_state_logic
        case(state)
            FETCH: next_state = DECODE;
            DECODE: begin
                case (op_i)
                    // lw
                    7'b0000011: next_state = MEM_ADR;
                    // sw
                    7'b0100011: next_state = MEM_ADR;
                    // R-type
                    7'b0110011: next_state = EXECUTE_R;
                    // I-type
                    7'b0010011: next_state = EXECUTE_I;
                    // jal
                    7'b1101111: next_state = JAL;
                    // beq
                    7'b1100011: next_state = BEQ;
                    default: next_state = state;
                endcase
            end
            MEM_ADR: begin
                case (op_i)
                    // lw
                    7'b0000011: next_state = MEM_READ;
                    // sw
                    7'b0100011: next_state = MEM_WRITE;
                    default: next_state = state;
                endcase
            end
            MEM_READ: next_state = MEM_WB;
            MEM_WB: next_state = FETCH;
            MEM_WRITE: next_state = FETCH;
            EXECUTE_R: next_state = ALU_WB;
            ALU_WB: next_state = FETCH;
            EXECUTE_I: next_state = ALU_WB;
            JAL: next_state = ALU_WB;
            BEQ: next_state = FETCH;
            default: next_state = state;
        endcase
    end

    logic pc_update;
    logic branch;
    assign pc_write_o = (zero_i && branch) || pc_update;
    always_comb begin
        pc_update = '0;
        branch = '0;
        reg_write_o = '0;
        mem_write_o = '0;
        ir_write_o = '0;
        result_src_o = '0;
        alu_src_a_o = '0;
        alu_src_b_o = '0;
        adr_src_o = '0;
        alu_op_o = '0;
        case(state)
            FETCH: begin
                adr_src_o = 1'b0;
                ir_write_o = '1;
                alu_src_a_o = 2'b00;
                alu_src_b_o = 2'b10;
                alu_op_o = 2'b00;
                result_src_o = 2'b10;
                pc_update = '1;
            end DECODE: begin
                alu_src_a_o = 2'b01;
                alu_src_b_o = 2'b01;
                alu_op_o = 2'b00;
            end MEM_ADR: begin
                alu_src_a_o = 2'b10;
                alu_src_b_o = 2'b01;
                alu_op_o = 2'b00;
            end MEM_READ: begin
                result_src_o = 2'b00;
                adr_src_o = 1'b1;
            end MEM_WB: begin
                result_src_o = 2'b01;
                reg_write_o = '1;
            end MEM_WRITE: begin
                result_src_o = 2'b00;
                adr_src_o = 1'b1;
                mem_write_o = '1;
            end EXECUTE_R: begin
                alu_src_a_o = 2'b10;
                alu_src_b_o = 2'b00;
                alu_op_o = 2'b10;
            end ALU_WB: begin
                result_src_o = 2'b00;
                reg_write_o = '1;
            end EXECUTE_I: begin
                alu_src_a_o = 2'b10;
                alu_src_b_o = 2'b01;
                alu_op_o = 2'b10;
            end JAL: begin
                alu_src_a_o = 2'b01;
                alu_src_b_o = 2'b10;
                alu_op_o = 2'b00;
                result_src_o = 2'b00;
                pc_update = '1;
            end BEQ: begin
                alu_src_a_o = 2'b10;
                alu_src_b_o = 2'b00;
                alu_op_o = 2'b01;
                result_src_o = 2'b00;
                branch = '1;
            end
        endcase
    end

    always_ff@(posedge clk_i) begin
        if(reset_i)
            state <= FETCH;
        else
            state <= next_state;
    end

endmodule
