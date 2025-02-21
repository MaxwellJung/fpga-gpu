module Datapath(
    input logic clk_i,
    input logic reset_i,

    input logic pc_write_i,
    input logic adr_src_i,
    input logic mem_write_i,
    input logic ir_write_i,
    input logic [1:0] result_src_i,
    input logic [2:0] alu_control_i,
    input logic [2:0] alu_src_a_i,
    input logic [2:0] alu_src_b_i,
    input logic [1:0] imm_src_i,
    input logic reg_write_i,

    output logic [6:0] op_o,
    output logic [2:0] funct3_o,
    output logic funct7_o,
    output logic zero_o
);

    logic [31:0] program_counter;
    logic [31:0] program_counter_next;
    logic [31:0] result;
    assign program_counter_next = result;
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            program_counter <= '0;
        end else begin
            if (pc_write_i) begin
                program_counter <= program_counter_next;
            end
        end
    end

    logic [31:0] gpu_mem_address;
    always_comb begin
        case (adr_src_i)
            1'b0: gpu_mem_address = program_counter;
            1'b1: gpu_mem_address = result;
            default: gpu_mem_address = '0;
        endcase
    end

    logic [31:0] gpu_mem_rd_data;
    logic [31:0] write_data;
    GpuMemory gpu_memory (
        .clk_i(gpu_clk_i),
        .reset_i(reset_i),

        .address_i(gpu_mem_address),
        .rd_data_o(gpu_mem_rd_data),
        .wr_data_i(write_data),
        .wr_en_i(mem_write_i)
    );

    logic [31:0] instruction;
    logic [31:0] old_program_counter;
    always_ff @(posedge gpu_clk_i) begin
        if (reset_i) begin
            instruction <= '0;
            old_program_counter <= '0;
        end else begin
            if (ir_write_i) begin
                instruction <= gpu_mem_rd_data;
                old_program_counter <= program_counter;
            end
        end
    end

    logic [31:0] data;
    always_ff @(posedge gpu_clk_i) begin
        if (reset_i) begin
            data <= '0;
        end else begin
            data <= gpu_mem_rd_data;
        end
    end

    assign op_o = instruction[6:0];
    assign funct3_o = instruction[14:12];
    assign funct7_o = instruction[30];

    logic [31:0] gpu_rf_rd_data_1;
    logic [31:0] gpu_rf_rd_data_2;
    RegisterFile register_file (
        .clk_i(gpu_clk_i),
        .reset_i(reset_i),

        .address_1_i(instruction[19:15]),
        .address_2_i(instruction[24:20]),
        
        .rd_data_1_o(gpu_rf_rd_data_1),
        .rd_data_2_o(gpu_rf_rd_data_2),

        .address_3_i(instruction[11:7]),
        .wr_data_i(result),
        .wr_en_i(reg_write_i)
    );

    logic [31:0] a;
    always_ff @(posedge gpu_clk_i) begin
        if (reset_i) begin
            a <= '0;
            write_data <= '0;
        end else begin
            a <= gpu_rf_rd_data_1;
            write_data <= gpu_rf_rd_data_2;
        end
    end

    logic [31:0] imm_ext;
    SignExtend sign_extend (
        .instr_i(instruction[31:7]),
        .imm_src_i(imm_src_i),
        .imm_ext_o(imm_ext)
    );

    logic [31:0] src_a;
    always_comb begin
        case (alu_src_a_i)
            2'b00: src_a = program_counter;
            2'b01: src_a = old_program_counter;
            2'b10: src_a = a;
            default: src_a = '0;
        endcase
    end

    logic [31:0] src_b;
    always_comb begin
        case (alu_src_b_i)
            2'b00: src_b = write_data;
            2'b01: src_b = imm_ext;
            2'b10: src_b = 4;
            default: src_b = '0;
        endcase
    end

    logic [31:0] alu_result;
    Alu alu (
        .src_a_i(src_a),
        .src_b_i(src_b),
        .control_i(alu_control_i),

        .result_o(alu_result),
        .zero_o(zero_o)
    );

    logic [31:0] alu_out;
    always_ff @(posedge gpu_clk_i) begin
        if (reset_i) begin
            alu_out <= '0;
        end else begin
            alu_out <= alu_result;
        end
    end

    always_comb begin
        case (result_src_i)
            2'b00: result = alu_out;
            2'b01: result = data;
            2'b10: result = alu_result;
            default: result = '0;
        endcase
    end

endmodule