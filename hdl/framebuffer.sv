module Framebuffer #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PIXEL_BITS = 8,
    localparam BYTES_PER_PIXEL = (PIXEL_BITS-1)/8 + 1,
    localparam FRAMEBUFFER_LENGTH = RESOLUTION_X*RESOLUTION_Y,
    localparam ADDR_BITS = $clog2(FRAMEBUFFER_LENGTH*BYTES_PER_PIXEL),
    localparam PIXELS_PER_DATA = 4
) (
    input logic reset,

    input logic wr_clk,
    input logic [ADDR_BITS-1:0] wr_pxl_addr,
    input logic [PIXELS_PER_DATA-1:0][PIXEL_BITS-1:0] wr_pxl_data,
    input logic [PIXELS_PER_DATA-1:0] wr_en,

    input logic rd_clk,
    input logic rd_en,
    input logic [$clog2(RESOLUTION_X)-1:0] rd_pxl_x,
    input logic [$clog2(RESOLUTION_Y)-1:0] rd_pxl_y,
    output logic [PIXEL_BITS-1:0] rd_pxl_value
);
    logic [$clog2(FRAMEBUFFER_LENGTH)-1:0] rd_pxl_index;
    logic [ADDR_BITS-1:0] rd_pxl_addr;
    assign rd_pxl_index = RESOLUTION_X*rd_pxl_y + rd_pxl_x;
    assign rd_pxl_addr = BYTES_PER_PIXEL*rd_pxl_index;
    logic [1:0] column_index;
    always @(posedge rd_clk) column_index <= rd_pxl_addr[1:0];
    logic [31:0] rd_pxl_data;
    assign rd_pxl_value = rd_pxl_data[PIXEL_BITS*column_index+:PIXEL_BITS];

    BlockMemory #(
        .CAPACITY_BYTES    (FRAMEBUFFER_LENGTH*BYTES_PER_PIXEL),
        .BYTES_PER_WORD    (4)
    ) u_BlockMemory (
        // Port A
        .port_a_clk        (wr_clk),
        .port_a_reset      (reset),
        .port_a_address    (wr_pxl_addr),
        .port_a_rd_data    (),
        .port_a_rd_en      ('0),
        .port_a_wr_data    (wr_pxl_data),
        .port_a_wr_en      (wr_en),
        // Port B
        .port_b_clk        (rd_clk),
        .port_b_reset      (reset),
        .port_b_address    (rd_pxl_addr),
        .port_b_rd_data    (rd_pxl_data),
        .port_b_rd_en      (rd_en),
        .port_b_wr_data    ('0),
        .port_b_wr_en      ('0)
    );

endmodule
