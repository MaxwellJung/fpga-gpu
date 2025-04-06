module Palette #(
    parameter PALETTE_LENGTH = 256,
    parameter COLOR_BITS = 16,
    localparam BYTES_PER_COLOR = (COLOR_BITS-1)/8 + 1,
    localparam ADDR_BITS = $clog2(PALETTE_LENGTH*BYTES_PER_COLOR),
    localparam COLORS_PER_DATA = 2
) (
    input logic reset,

    input logic wr_clk,
    input logic [ADDR_BITS-1:0] wr_addr,
    input logic [COLORS_PER_DATA-1:0][COLOR_BITS-1:0] wr_data,
    input logic [COLORS_PER_DATA-1:0] wr_en,

    input logic rd_clk,
    input logic rd_en,
    input logic [$clog2(PALETTE_LENGTH)-1:0] rd_index,
    output logic [COLOR_BITS-1:0] rd_color
);
    logic [ADDR_BITS-1:0] rd_color_addr;
    assign rd_color_addr = BYTES_PER_COLOR*rd_index;
    logic column_index;
    always @(posedge rd_clk) column_index <= rd_color_addr[1];
    logic [31:0] rd_color_data;
    assign rd_color = rd_color_data[COLOR_BITS*column_index+:COLOR_BITS];

    BlockMemory #(
        .CAPACITY_BYTES    (PALETTE_LENGTH*BYTES_PER_COLOR),
        .BYTES_PER_WORD    (4)
    ) u_BlockMemory (
        // Port A
        .port_a_clk        (wr_clk),
        .port_a_reset      (reset),
        .port_a_address    (wr_addr),
        .port_a_rd_data    (),
        .port_a_rd_en      ('0),
        .port_a_wr_data    (wr_data),
        .port_a_wr_en      ({{2{wr_en[1]}}, {2{wr_en[0]}}}),
        // Port B
        .port_b_clk        (rd_clk),
        .port_b_reset      (reset),
        .port_b_address    (rd_color_addr),
        .port_b_rd_data    (rd_color_data),
        .port_b_rd_en      (rd_en),
        .port_b_wr_data    ('0),
        .port_b_wr_en      ('0)
    );

endmodule
