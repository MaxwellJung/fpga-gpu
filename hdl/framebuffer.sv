module Framebuffer #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256
) (
    input logic reset,

    input logic rd_clk,
    input logic rd_en,
    input logic [$clog2(RESOLUTION_X)-1:0] rd_pxl_x,
    input logic [$clog2(RESOLUTION_Y)-1:0] rd_pxl_y,
    output logic [$clog2(PALETTE_LENGTH)-1:0] rd_pxl_value,

    input logic wr_clk,
    input logic wr_en,
    input logic [$clog2(RESOLUTION_X*RESOLUTION_Y)-1:0] wr_pxl_addr,
    input logic [$clog2(PALETTE_LENGTH)-1:0] wr_pxl_value
);
    logic [$clog2(PALETTE_LENGTH)-1:0] pixels[RESOLUTION_X*RESOLUTION_Y];

    always_ff @(posedge wr_clk) begin 
        if (reset) begin
            // pixels <= '0;
        end
        else
            if (wr_en)
                pixels[wr_pxl_addr] <= wr_pxl_value;
    end

    always_ff @(posedge rd_clk) begin
        if (reset)
            rd_pxl_value <= '0;
        else begin
            if (rd_en)
                rd_pxl_value <= pixels[RESOLUTION_X*rd_pxl_y + rd_pxl_x];
            else
                rd_pxl_value <= '0;
        end
    end

endmodule
