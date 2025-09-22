module color_palette #(
    parameter COLOR_COUNT = 256,
    parameter COLOR_BITS = 12,
    localparam COLOR_BYTES = (COLOR_BITS-1)/8 + 1,
    localparam PALETTE_CAPACITY = COLOR_BYTES*COLOR_COUNT
) (
    // vga interface
    input  logic                           vga_clk,
    input  logic                           vga_reset,
    input  logic [$clog2(COLOR_COUNT)-1:0] color_index,
    input  logic                           color_index_valid,
    output logic [COLOR_BITS-1:0]          rgb,

    // display processor interface
    input  logic                                port_b_clk,
    input  logic                                port_b_reset,
    input  logic [$clog2(PALETTE_CAPACITY)-1:0] port_b_address,
    output logic [31:0]                         port_b_rd_data,
    input  logic                                port_b_rd_en,
    input  logic [31:0]                         port_b_wr_data,
    input  logic [3:0]                          port_b_wr_en
);

    logic [$clog2(PALETTE_CAPACITY)-1:0] port_a_address;
    logic [31:0]                         port_a_rd_data;
    logic                                port_a_rd_en;
    logic                                column_index;
    logic [15:0]                         rgba;
    logic                                rgba_valid;

    assign port_a_address = color_index << $clog2(COLOR_BYTES);
    assign port_a_rd_en = color_index_valid;
    assign rgba = port_a_rd_data[8*COLOR_BYTES*column_index+:16];

    always_ff @(posedge vga_clk) begin
        if (vga_reset) begin
            column_index <= 0;
            rgba_valid <= 0;
            rgb <= 0;
        end else begin
            column_index <= port_a_address[1];
            rgba_valid <= color_index_valid;
            if (rgba_valid)
                rgb <= rgba[15-:12];
            else
                rgb <= 0;
        end
    end

    block_memory #(
        .CAPACITY_BYTES    (PALETTE_CAPACITY),
        .WORD_BYTES        (4)
    ) block_memory_inst_0 (
        // vga interface (read only)
        .port_a_clk        (vga_clk),
        .port_a_reset      (vga_reset),
        .port_a_address    (port_a_address),
        .port_a_rd_data    (port_a_rd_data),
        .port_a_rd_en      (port_a_rd_en),
        .port_a_wr_data    ('0),
        .port_a_wr_en      ('0),
        // display processor interface (read/write)
        .port_b_clk        (port_b_clk),
        .port_b_reset      (port_b_reset),
        .port_b_address    (port_b_address),
        .port_b_rd_data    (port_b_rd_data),
        .port_b_rd_en      (port_b_rd_en),
        .port_b_wr_data    (port_b_wr_data),
        .port_b_wr_en      (port_b_wr_en)
    );

endmodule
