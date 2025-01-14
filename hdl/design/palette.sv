module Palette #(
    parameter FB_BITS = 17,
    parameter PIXEL_COLOR_WIDTH = 12,
    parameter BRAM_ADDR_BITS = 32,
    parameter BRAM_DATA_BITS = 32
) (
    input wire clk_i,
    input wire reset_i,

    input  wire [FB_BITS-1:0] pixel_index_i,
    output wire [PIXEL_COLOR_WIDTH-1:0] pixel_color_o,

    output wire bram_clk_o,
    output wire bram_rst_o,
    output wire bram_en_o,
    output wire [BRAM_ADDR_BITS-1:0] bram_addr_o,
    input wire [BRAM_DATA_BITS-1:0] bram_dout_i,
    output wire [BRAM_DATA_BITS-1:0] bram_din_o,
    output wire [BRAM_DATA_BITS/8-1:0] bram_we_o
);
	localparam BYTES_PER_COLOR = 2;
	localparam COLORS_PER_PALETTE = 256;
	localparam COLOR_PALETTE_SIZE = BYTES_PER_COLOR * COLORS_PER_PALETTE;
	// base address of color palette
	localparam COLOR_BASE_ADDR = 0;
	// base address of frame buffer
	localparam FB_BASE_ADDR = COLOR_PALETTE_SIZE;

	wire [BRAM_ADDR_BITS-1:0] pixel_addr = FB_BASE_ADDR + pixel_index_i;
	wire [7:0] color_index = bram_dout_i[8*byte_index+:8];
	wire [BRAM_ADDR_BITS-1:0] color_addr = color_index_valid ? COLOR_BASE_ADDR + BYTES_PER_COLOR*color_index : 0;
    wire [BRAM_ADDR_BITS-1:0] bram_addr = new_pixel ? pixel_addr : color_addr;

    reg [FB_BITS-1:0] pixel_index;
    wire new_pixel = (pixel_index != pixel_index_i);
    reg color_index_valid;
    reg argb_valid;
    always @(posedge clk_i) begin
        if (reset_i) begin
            pixel_index <= 0;
            color_index_valid <= 0;
            argb_valid <= 0;
        end else begin
            pixel_index <= pixel_index_i;
            color_index_valid <= new_pixel;
            argb_valid <= color_index_valid;
        end
    end
    
    reg [BRAM_ADDR_BITS-1:0] delayed_bram_addr;
    always @(posedge clk_i) begin
        if (reset_i) begin
            delayed_bram_addr <= 0;
        end else begin
            delayed_bram_addr <= bram_addr;
        end
    end
    wire [1:0] byte_index = delayed_bram_addr[1:0];

	reg [15:0] argb;
    always @(posedge clk_i) begin
        if (reset_i) begin
            argb <= 0;
        end else if (argb_valid) begin
            argb <= bram_dout_i[8*(byte_index)+:16];
        end
    end
    assign pixel_color_o = argb[11:0];

    assign bram_clk_o = clk_i;
    assign bram_rst_o = reset_i;
    assign bram_en_o = 1'b1;
    assign bram_addr_o = bram_addr;
    assign bram_din_o = {BRAM_DATA_BITS {1'b0}};
	assign bram_we_o = {BRAM_DATA_BITS/8 {1'b0}};
endmodule