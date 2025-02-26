module Palette #(
    parameter PALETTE_LENGTH = 256,
    parameter COLOR_BITS = 12
) (
    input logic reset,

    input logic rd_clk,
    input logic rd_en,
    input logic [$clog2(PALETTE_LENGTH)-1:0]  rd_index,
    output logic [COLOR_BITS-1:0] rd_color,

    input logic wr_clk,
    input logic wr_en,
    input logic [$clog2(PALETTE_LENGTH)-1:0] wr_index,
    input logic [COLOR_BITS-1:0] wr_color
);
    logic [PALETTE_LENGTH-1:0][COLOR_BITS-1:0] colors;

    always_ff @(posedge wr_clk) begin
        if (reset) begin
            colors <= '0;
        end else if (wr_en) begin
            colors[wr_index] <= wr_color;
        end
    end

    always_ff @(posedge rd_clk) begin
        if (reset) begin
            rd_color <= '0;
        end else if (rd_en) begin
            rd_color <= colors[rd_index];
        end else begin
            rd_color <= '0;
        end
    end

endmodule
