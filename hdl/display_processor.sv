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

    assign status_o = status;

    assign fb_wr_x_o = current_position.x;
    assign fb_wr_y_o = current_position.y;
    assign fb_wr_index_o = index;
    assign fb_wr_en_o = '1;

    Datapath datapath(
        .clk_i(clk_i),
        .reset_i(reset_i || ctl_rst)
    );

endmodule
