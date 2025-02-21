module DisplayProcessor #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256,
    parameter COLOR_BITS = 12
) (
    input logic clk_i,
    input logic reset_i,

    output logic [31:0] status_o,
    input logic [31:0] control_i,

    output logic [$clog2(RESOLUTION_X)-1:0] fb_wr_x_o,
    output logic [$clog2(RESOLUTION_Y)-1:0] fb_wr_y_o,
    output logic [$clog2(PALETTE_LENGTH)-1:0] fb_wr_index_o,
    output logic fb_wr_en_o,

    output logic [$clog2(PALETTE_LENGTH)-1:0] palette_wr_index_o,
    output logic [$clog2(COLOR_BITS)-1:0] palette_wr_color_o,
    output logic palette_wr_en_o
);
    logic [31:0] status;
    struct packed {
        logic [$clog2(RESOLUTION_X)-1:0] x;
        logic [$clog2(RESOLUTION_Y)-1:0] y;
    } current_position;
    logic [31:0] fill;
    logic [$clog2(PALETTE_LENGTH)-1:0] index;
    logic [31:0] wmode;
    logic [31:0] mask;
    logic [31:0] pattern;

    logic ctl_rst;
    assign ctl_rst = control_i[23];

    always_ff @(posedge clk_i) begin
        if (reset_i || ctl_rst) begin
            status <= 32'h00000010;
            current_position.x <= '0;
            current_position.y <= '0;
            fill <= '0;
            index <= '0;
            wmode <= '0;
            mask <= '0;
            pattern <= '0;
        end else begin

        end
    end

    logic pc_write;
    logic [31:0] program_counter;
    logic [31:0] program_counter_next;
    assign program_counter_next = result;
    always_ff @(posedge gpu_clk_i) begin
        if (reset_i) begin
            program_counter <= '0;
        end else begin
            if (pc_write) begin
                program_counter <= program_counter_next;
            end
        end
    end

    logic adr_src;
    logic [31:0] gpu_mem_address;
    always_comb begin
        case (adr_src)
            1'b0: gpu_mem_address = program_counter;
            1'b1: gpu_mem_address = result;
            default: gpu_mem_address = '0;
        endcase
    end

    logic mem_write;
    logic [31:0] gpu_mem_rd_data;
    GpuMemory gpu_memory (
        .clk_i(gpu_clk_i),
        .reset_i(reset_i),

        .address_i(gpu_mem_address),
        .rd_data_o(gpu_mem_rd_data),
        .wr_data_i(write_data),
        .wr_en_i(mem_write)
    );

    logic ir_write;
    logic [31:0] instruction;
    logic [31:0] old_program_counter;
    always_ff @(posedge gpu_clk_i) begin
        if (reset_i) begin
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
    always_ff @(posedge gpu_clk_i) begin
        if (reset_i) begin
            data <= '0;
        end else begin
            data <= gpu_mem_rd_data;
        end
    end

    logic reg_write;
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
        .wr_en_i(reg_write)
    );

    logic [31:0] a;
    logic [31:0] write_data;
    always_ff @(posedge gpu_clk_i) begin
        if (reset_i) begin
            a <= '0;
            write_data <= '0;
        end else begin
            a <= gpu_rf_rd_data_1;
            write_data <= gpu_rf_rd_data_2;
        end
    end

    logic [1:0] imm_src;
    logic [31:0] imm_ext;
    SignExtend sign_extend (
        .instr_i(instruction[31:7]),
        .imm_src_i(imm_src),
        .imm_ext_o(imm_ext)
    );

    logic [2:0] alu_src_a;
    logic [31:0] src_a;
    always_comb begin
        case (alu_src_a)
            2'b00: src_a = program_counter;
            2'b01: src_a = old_program_counter;
            2'b10: src_a = a;
            default: src_a = '0;
        endcase
    end

    logic [2:0] alu_src_b;
    logic [31:0] src_b;
    always_comb begin
        case (alu_src_b)
            2'b00: src_b = write_data;
            2'b01: src_b = imm_ext;
            2'b10: src_b = 4;
            default: src_b = '0;
        endcase
    end

    logic [2:0] alu_control;
    logic [31:0] alu_result;
    Alu alu (
        .src_a_i(src_a),
        .src_b_i(src_b),
        .control_i(alu_control),

        .result_o(alu_result)
    );

    logic [31:0] alu_out;
    always_ff @(posedge gpu_clk_i) begin
        if (reset_i) begin
            alu_out <= '0;
        end else begin
            alu_out <= alu_result;
        end
    end

    logic [1:0] result_src;
    logic [31:0] result;
    always_comb begin
        case (result_src)
            2'b00: result = alu_out;
            2'b01: result = data;
            2'b10: result = alu_result;
            default: result = '0;
        endcase
    end

    assign status_o = status;

    assign fb_wr_x_o = current_position.x;
    assign fb_wr_y_o = current_position.y;
    assign fb_wr_index_o = index;
    assign fb_wr_en_o = '1;

endmodule
