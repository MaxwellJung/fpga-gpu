module DisplayProcessor #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256,
    parameter COLOR_BITS = 12
) (
    input logic clk_i,
    input logic reset_i,

    // memory mapped i/o
    output logic [31:0] status_o,
    input logic [31:0] control_i,

    // framebuffer
    output logic [$clog2(RESOLUTION_X)-1:0] fb_wr_x_o,
    output logic [$clog2(RESOLUTION_Y)-1:0] fb_wr_y_o,
    output logic [$clog2(PALETTE_LENGTH)-1:0] fb_wr_index_o,
    output logic fb_wr_en_o,

    // color palette
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

    assign status_o = status;

    assign fb_wr_x_o = current_position.x;
    assign fb_wr_y_o = current_position.y;
    assign fb_wr_index_o = index;
    assign fb_wr_en_o = '1;

    assign palette_wr_index_o = '0;
    assign palette_wr_color_o = '0;
    assign palette_wr_en_o = '0;


    logic [1:0] imm_src_d;
    logic alu_src_e;
    logic [2:0] alu_control_e;
    logic pc_src_e;
    logic mem_write_m;
    logic [1:0] result_src_w;
    logic reg_write_w;
    logic [6:0] op;
    logic [2:0] funct3;
    logic funct7;
    logic zero_e;

    logic stall_f;
    logic stall_d;
    logic flush_d;
    logic flush_e;
    logic [1:0] forward_a_e;
    logic [1:0] forward_b_e;
    logic [4:0] rs1_d;
    logic [4:0] rs2_d;
    logic [4:0] rs1_e;
    logic [4:0] rs2_e;
    logic [4:0] rd_e;
    logic [4:0] rd_m;
    logic [4:0] rd_w;

    Datapath datapath (
        .clk_i              (clk_i),
        .reset_i            (reset_i || ctl_rst),
        // control
        .imm_src_d_i        (imm_src_d),
        .alu_src_e_i        (alu_src_e),
        .alu_control_e_i    (alu_control_e),
        .pc_src_e_i         (pc_src_e),
        .mem_write_m_i      (mem_write_m),
        .result_src_w_i     (result_src_w),
        .reg_write_w_i      (reg_write_w),
        .op_o               (op),
        .funct3_o           (funct3),
        .funct7_o           (funct7),
        .zero_e_o           (zero_e),
        // hazard
        .stall_f_i          (stall_f),
        .stall_d_i          (stall_d),
        .flush_d_i          (flush_d),
        .flush_e_i          (flush_e),
        .forward_a_e_i      (forward_a_e),
        .forward_b_e_i      (forward_b_e),
        .rs1_d_o            (rs1_d),
        .rs2_d_o            (rs2_d),
        .rs1_e_o            (rs1_e),
        .rs2_e_o            (rs2_e),
        .rd_e_o             (rd_e),
        .rd_m_o             (rd_m),
        .rd_w_o             (rd_w)
    );

    logic [1:0] result_src_e;
    Controlpath controlpath (
        .clk_i              (clk_i),
        .reset_i            (reset_i || ctl_rst),
        .op_i               (op),
        .funct3_i           (funct3),
        .funct7_i           (funct7),
        .zero_e_i           (zero_e),
        .flush_e_i          (flush_e_i),
        // output to datapath
        .imm_src_d_o        (imm_src_d),
        .alu_src_e_o        (alu_src_e),
        .alu_control_e_o    (alu_control_e),
        .pc_src_e_o         (pc_src_e),
        .mem_write_m_o      (mem_write_m),
        .reg_write_m_o      (reg_write_m),
        .result_src_w_o     (result_src_w),
        .reg_write_w_o      (reg_write_w),
        // output to hazard
        .result_src_e_o     (result_src_e)
    );

    Hazard hazard (
        // input from datapath
        .rs1_d_i           (rs1_d),
        .rs2_d_i           (rs2_d),
        .rs1_e_i           (rs1_e),
        .rs2_e_i           (rs2_e),
        .rd_e_i            (rd_e),
        .rd_m_i            (rd_m),
        .rd_w_i            (rd_w),
        // input from control
        .pc_src_e_i        (pc_src_e),
        .result_src_e_i    (result_src_e),
        .reg_write_m_i     (reg_write_m),
        .reg_write_w_i     (reg_write_w),
        // output to datapath
        .stall_f_o         (stall_f),
        .stall_d_o         (stall_d),
        .flush_d_o         (flush_d),
        .flush_e_o         (flush_e),
        .forward_a_e_o     (forward_a_e),
        .forward_b_e_o     (forward_b_e)
    );

endmodule
