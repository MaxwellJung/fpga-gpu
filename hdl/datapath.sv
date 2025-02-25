module Datapath(
    input logic clk,
    input logic reset,

    input logic pc_write,
    input logic adr_src,
    input logic mem_write,
    input logic ir_write,
    input logic [1:0] result_src,
    input logic [2:0] alu_control,
    input logic [2:0] alu_src_a,
    input logic [2:0] alu_src_b,
    input logic [1:0] imm_src,
    input logic reg_write,

    output logic [6:0] op,
    output logic [2:0] funct3,
    output logic funct7,
    output logic zero
);

    logic [31:0] program_counter;
    logic [31:0] program_counter_next;
    logic [31:0] result;
    assign program_counter_next = result;
    always_ff @(posedge clk) begin
        if (reset) begin
            program_counter <= '0;
        end else begin
            if (pc_write) begin
                program_counter <= program_counter_next;
            end
        end
    end

    logic [31:0] gpu_mem_address;
    always_comb begin
        case (adr_src)
            1'b0: gpu_mem_address = program_counter;
            1'b1: gpu_mem_address = result;
            default: gpu_mem_address = '0;
        endcase
    end

    logic [31:0] gpu_mem_rd_data;
    logic [31:0] write_data;
    GpuMemory gpu_memory (
        .clk(clk),
        .reset(reset),

        .address(gpu_mem_address),
        .rd_data(gpu_mem_rd_data),
        .wr_data(write_data),
        .wr_en(mem_write)
    );

    logic [31:0] instruction;
    logic [31:0] old_program_counter;
    always_ff @(posedge clk) begin
        if (reset) begin
            instruction <= '0;
            old_program_counter <= '0;
        end else begin
            if (ir_write) begin
                instruction <= gpu_mem_rd_data;
                old_program_counter <= program_counter;
            end
        end
    end

    logic [31:0] data;
    always_ff @(posedge clk) begin
        if (reset) begin
            data <= '0;
        end else begin
            data <= gpu_mem_rd_data;
        end
    end

    assign op = instruction[6:0];
    assign funct3 = instruction[14:12];
    assign funct7 = instruction[30];

    logic [31:0] gpu_rf_rd_data_1;
    logic [31:0] gpu_rf_rd_data_2;
    RegisterFile register_file (
        .clk(clk),
        .reset(reset),

        .address_1(instruction[19:15]),
        .address_2(instruction[24:20]),
        
        .rd_data_1(gpu_rf_rd_data_1),
        .rd_data_2(gpu_rf_rd_data_2),

        .address_3(instruction[11:7]),
        .wr_data(result),
        .wr_en(reg_write)
    );

    logic [31:0] a;
    always_ff @(posedge clk) begin
        if (reset) begin
            a <= '0;
            write_data <= '0;
        end else begin
            a <= gpu_rf_rd_data_1;
            write_data <= gpu_rf_rd_data_2;
        end
    end

    logic [31:0] imm_ext;
    SignExtend sign_extend (
        .instr(instruction[31:7]),
        .imm_src(imm_src),
        .imm_ext(imm_ext)
    );

    logic [31:0] src_a;
    always_comb begin
        case (alu_src_a)
            2'b00: src_a = program_counter;
            2'b01: src_a = old_program_counter;
            2'b10: src_a = a;
            default: src_a = '0;
        endcase
    end

    logic [31:0] src_b;
    always_comb begin
        case (alu_src_b)
            2'b00: src_b = write_data;
            2'b01: src_b = imm_ext;
            2'b10: src_b = 4;
            default: src_b = '0;
        endcase
    end

    logic [31:0] alu_result;
    Alu alu (
        .src_a(src_a),
        .src_b(src_b),
        .control(alu_control),

        .result(alu_result),
        .zero(zero)
    );

    logic [31:0] aluut;
    always_ff @(posedge clk) begin
        if (reset) begin
            aluut <= '0;
        end else begin
            aluut <= alu_result;
        end
    end

    always_comb begin
        case (result_src)
            2'b00: result = aluut;
            2'b01: result = data;
            2'b10: result = alu_result;
            default: result = '0;
        endcase
    end

endmodule