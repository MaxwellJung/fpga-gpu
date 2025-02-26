module Framebuffer #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256
) (
    input logic reset,

    input logic rd_clk,
    input logic re,
    input logic [$clog2(RESOLUTION_X)-1:0] pxl_x,
    input logic [$clog2(RESOLUTION_Y)-1:0] pxl_y,
    output logic [$clog2(PALETTE_LENGTH)-1:0] palette_index,

    input logic wr_clk,
    input logic we,
    input logic [$clog2(RESOLUTION_X)-1:0] wr_pxl_x,
    input logic [$clog2(RESOLUTION_Y)-1:0] wr_pxl_y,
    input logic [$clog2(PALETTE_LENGTH)-1:0] wr_palette_index
);
    logic [$clog2(PALETTE_LENGTH)-1:0] pixels[RESOLUTION_X*RESOLUTION_Y];

    always_ff @(posedge wr_clk) begin 
        if (reset) begin
            // pixels <= '0;
        end
        else
            if (we)
                pixels[RESOLUTION_X*wr_pxl_y + wr_pxl_x] <= wr_palette_index;
    end

    always_ff @(posedge rd_clk) begin
        if (reset)
            palette_index <= '0;
        else begin
            if (re)
                palette_index <= pixels[RESOLUTION_X*pxl_y + pxl_x];
            else
                palette_index <= '0;
        end
    end

endmodule
