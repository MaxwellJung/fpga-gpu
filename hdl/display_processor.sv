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
    struct {
        logic [$clog2(RESOLUTION_X)-1:0] x;
        logic [$clog2(RESOLUTION_Y)-1:0] y;
    } current_position;
    logic [31:0] fill;
    logic [$clog2(PALETTE_LENGTH)-1:0] index;
    logic [31:0] wmode;
    logic [31:0] mask;
    logic [31:0] pattern;

    logic [31:0] program_counter;
    logic [31:0] program_counter_next;
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

            program_counter <= '0;
        end else begin
            program_counter <= program_counter_next;
        end
    end

    logic [31:0] instruction;
    
    GpuMemory #(

    ) gpu_memory (
        .clk_i(gpu_clk_i),
        .reset_i(reset_i),

        .address_i(program_counter),
        .rd_data_o(instruction),
        .wr_data_i(),
        .wr_en_i()
    );

    logic [4:0] rs1;
    assign rs1 = instruction[19:15];
    logic [31:0] a;

    RegisterFile #(

    ) register_file (
        .clk_i(gpu_clk_i),
        .reset_i(reset_i),

        .address_1_i(rs1),
        .address_2_i(),
        
        .rd_data_1_o(a),
        .rd_data_2_o(),

        .address_3_i(),
        .wr_data_i(),
        .wr_en_i()
    );

    logic [11:0] imm;
    assign imm = instruction[31:20];
    logic [31:0] imm_ext;

    SignExtend sign_extend (
        .imm_i(imm),
        .imm_src_i(imm_src),
        .imm_ext_o(imm_ext)
    );

    assign status_o = status;

    assign fb_wr_x_o = current_position.x;
    assign fb_wr_y_o = current_position.y;
    assign fb_wr_index_o = index;
    assign fb_wr_en_o = '1;

endmodule
