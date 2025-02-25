module Framebuffer #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256
) (
    input logic reset_i,

    input logic rd_clk_i,
    input logic re_i,
    input logic [$clog2(RESOLUTION_X)-1:0] pxl_x_i,
    input logic [$clog2(RESOLUTION_Y)-1:0] pxl_y_i,
    output logic [$clog2(PALETTE_LENGTH)-1:0] palette_index_o,

    input logic wr_clk_i,
    input logic we_i,
    input logic [$clog2(RESOLUTION_X)-1:0] wr_pxl_x_i,
    input logic [$clog2(RESOLUTION_Y)-1:0] wr_pxl_y_i,
    input logic [$clog2(PALETTE_LENGTH)-1:0] wr_palette_index_i
);
    logic [RESOLUTION_Y-1:0][RESOLUTION_X-1:0][$clog2(PALETTE_LENGTH)-1:0] pixels;

    always_ff @(posedge wr_clk_i) begin 
        if (reset_i)
            pixels <= '0;
        else
            if (we_i)
                pixels[wr_pxl_y_i][wr_pxl_x_i] <= wr_palette_index_i;
    end

    always_ff @(posedge rd_clk_i) begin
        if (reset_i)
            palette_index_o <= '0;
        else begin
            if (re_i)
                palette_index_o <= pixels[pxl_y_i][pxl_x_i];
            else
                palette_index_o <= '0;
        end
    end

endmodule
