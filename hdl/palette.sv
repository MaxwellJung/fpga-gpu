module Palette #(
    parameter PALETTE_LENGTH = 256,
    parameter COLOR_BITS = 12
) (
    input logic reset_i,

    input logic rd_clk_i,
    input logic rd_en_i,
    input logic [$clog2(PALETTE_LENGTH)-1:0]  rd_index_i,
    output logic [COLOR_BITS-1:0] rd_color_o,

    input logic wr_clk_i,
    input logic wr_en_i,
    input logic [$clog2(PALETTE_LENGTH)-1:0] wr_index_i,
    input logic [COLOR_BITS-1:0] wr_color_i
);
    logic [PALETTE_LENGTH-1:0][COLOR_BITS-1:0] colors;

    always_ff @(posedge wr_clk_i) begin
        if (reset_i) begin
            colors <= '0;
        end else if (wr_en_i) begin
            colors[wr_index_i] <= wr_color_i;
        end
    end

    always_ff @(posedge rd_clk_i) begin
        if (reset_i) begin
            rd_color_o <= '0;
        end else if (rd_en_i) begin
            rd_color_o <= colors[rd_index_i];
        end else begin
            rd_color_o <= '0;
        end
    end

endmodule
