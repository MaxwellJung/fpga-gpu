module Writeback (
    input logic clk,
    input logic reset,

    // input from memory stage
    input logic [31:0] m_alu_result,
    input logic [4:0] m_rd,
    input logic [31:0] m_pc_plus_4,

    // input from data memory
    input logic [31:0] w_read_data,

    // input from control
    input result_src_t w_result_src,
    input mem_size_t w_mem_size,
    input load_sign_t w_load_sign,

    // output to register file
    output logic [31:0] w_result,
    output logic [4:0] w_rd
);
    logic [31:0] w_alu_result;
    logic [31:0] w_pc_plus_4;
    always_ff @(posedge clk) begin
        if (reset) begin
            {w_alu_result, w_rd, w_pc_plus_4} <= '0;
        end else begin
            {w_alu_result, w_rd, w_pc_plus_4} <= 
            {m_alu_result, m_rd, m_pc_plus_4};
        end
    end

    logic [31:0] read_addr;
    logic [31:0] read_word;
    logic [15:0] read_half;
    logic [7:0] read_byte;
    logic [31:0] read_data;
    always_comb begin
        read_addr = w_alu_result;
        read_word = w_read_data;
        read_half = w_read_data[16*read_addr[1]+:16];
        read_byte = w_read_data[8*read_addr[1:0]+:8];

        case (w_mem_size)
            MEM_SIZE_WORD: read_data = read_word;
            MEM_SIZE_HALF: begin
                case (w_load_sign)
                    LOAD_SIGNED: read_data = {{16{read_half[15]}}, read_half};
                    LOAD_UNSIGNED: read_data = {{16{1'b0}}, read_half};
                    default: read_data = {{16{read_half[15]}}, read_half};
                endcase
            end
            MEM_SIZE_BYTE: begin
                case (w_load_sign)
                    LOAD_SIGNED: read_data = {{24{read_byte[7]}}, read_byte};
                    LOAD_UNSIGNED: read_data = {{24{1'b0}}, read_byte};
                    default: read_data = {{24{read_byte[7]}}, read_byte};
                endcase
            end
            default: read_data = read_word;
        endcase
    end

    always_comb begin
        case (w_result_src)
            RESULT_SRC_ALU: w_result = w_alu_result;
            RESULT_SRC_MEMORY: w_result = read_data;
            RESULT_SRC_PC_PLUS_4: w_result = w_pc_plus_4;
            default: w_result = '0;
        endcase
    end

endmodule
