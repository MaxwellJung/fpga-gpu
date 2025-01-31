module Framebuffer #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256
) (
    input logic reset_i,

    input logic read_clk_i,
    input logic [$clog2(RESOLUTION_X)-1:0] pxl_x_coord_i,
    input logic [$clog2(RESOLUTION_Y)-1:0] pxl_y_coord_i,
    output logic [$clog2(PALETTE_LENGTH)-1:0] palette_index_o,

    input logic write_clk_i,
    input logic we_i,
    input logic [$clog2(RESOLUTION_X)-1:0] write_pxl_x_coord_i,
    input logic [$clog2(RESOLUTION_Y)-1:0] write_pxl_y_coord_i,
    input logic [$clog2(PALETTE_LENGTH)-1:0] write_palette_index_i
);
    logic [$clog2(PALETTE_LENGTH)-1:0] pixels[0:RESOLUTION_Y*RESOLUTION_X];

    always_ff @(posedge read_clk_i) begin
        if (reset_i) begin
            palette_index_o <= '0;
        end else begin
            palette_index_o <= pixels[RESOLUTION_X*pxl_y_coord_i + pxl_x_coord_i];
        end
    end

    always_ff @(posedge write_clk_i) begin
        if (reset_i) begin
            for (integer y = 0; y < RESOLUTION_Y; y = y+1) begin
                for (integer x = 0; x < RESOLUTION_X; x = x+1) begin
                    pixels[RESOLUTION_X*y + x] <= '0;
                end
            end
        end else if (we_i) begin
            pixels[RESOLUTION_X*write_pxl_y_coord_i + write_pxl_x_coord_i] <= write_palette_index_i;
        end
    end

endmodule