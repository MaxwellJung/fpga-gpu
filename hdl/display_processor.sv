module DisplayProcessor #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256
) (
    input logic clk_i,
    input logic reset_i,

    input logic [$clog2(RESOLUTION_X)-1:0] x_i,
    input logic [$clog2(RESOLUTION_Y)-1:0] y_i,
    input logic [$clog2(PALETTE_LENGTH)-1:0] index_i,

    output logic [$clog2(RESOLUTION_X)-1:0] cp_x_o,
    output logic [$clog2(RESOLUTION_Y)-1:0] cp_y_o,
    output logic [$clog2(PALETTE_LENGTH)-1:0] index_o
);
    typedef struct {
        logic [$clog2(RESOLUTION_X)-1:0] x;
        logic [$clog2(RESOLUTION_Y)-1:0] y;
    } Point;

    Point current_pos;
    logic [$clog2(PALETTE_LENGTH)-1:0] index;

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            current_pos <= '{'0, '0};
            index <= '0;
        end else begin
            current_pos <= '{x_i, y_i};
            index <= index_i;
        end
    end

    assign cp_x_o = current_pos.x;
    assign cp_y_o = current_pos.y;
    assign index_o = index;

endmodule
