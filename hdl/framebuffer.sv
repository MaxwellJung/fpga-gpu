module Framebuffer #(
    parameter RES_X = 400,
    parameter RES_Y = 300,
    parameter PXL_BITS = 8,
    parameter TILE_WIDTH = 4,
    parameter TILE_HEIGHT = 4,
    localparam TILE_RES_X = RES_X/TILE_WIDTH,
    localparam TILE_RES_Y = RES_Y/TILE_HEIGHT,
    localparam TILE_COUNT = TILE_RES_X*TILE_RES_Y,
    localparam BYTES_PER_PXL = (PXL_BITS-1)/8 + 1,
    localparam PXL_COUNT = RES_X*RES_Y,
    localparam CORE_COUNT = TILE_WIDTH*TILE_HEIGHT,
    localparam PXLS_PER_DATA = 4
) (
    input logic wr_clk,
    input logic [CORE_COUNT-1:0][$clog2(PXL_COUNT*BYTES_PER_PXL/CORE_COUNT)-1:0] wr_tile_index,
    input logic [CORE_COUNT-1:0][PXLS_PER_DATA-1:0][PXL_BITS-1:0] wr_pxl_data,
    input logic [CORE_COUNT-1:0][PXLS_PER_DATA-1:0] wr_en,

    input logic rd_clk,
    input logic rd_reset,
    input logic rd_en,
    input logic [$clog2(RES_X)-1:0] rd_pxl_x,
    input logic [$clog2(RES_Y)-1:0] rd_pxl_y,
    output logic [PXL_BITS-1:0] rd_pxl_value
);
    logic [$clog2(RES_X)-1:$clog2(TILE_WIDTH)] tile_index_x;
    logic [$clog2(TILE_WIDTH)-1:0] tile_offset_x;
    logic [$clog2(RES_Y)-1:$clog2(TILE_HEIGHT)] tile_index_y;
    logic [$clog2(TILE_HEIGHT)-1:0] tile_offset_y;
    assign {tile_index_x, tile_offset_x} = rd_pxl_x;
    assign {tile_index_y, tile_offset_y} = rd_pxl_y;

    // verilator lint_off WIDTHEXPAND
    // verilator lint_off WIDTHTRUNC
    logic [$clog2(CORE_COUNT)-1:0] core_index;
    assign core_index = tile_offset_y*TILE_WIDTH + tile_offset_x;
    logic [$clog2(TILE_COUNT)-1:0] rd_tile_index;
    assign rd_tile_index = tile_index_y*TILE_RES_X + tile_index_x;
    // verilator lint_on WIDTHEXPAND
    // verilator lint_on WIDTHTRUNC

    logic [$clog2(PXLS_PER_DATA)-1:0] column_index;
    always @(posedge rd_clk) column_index <= rd_tile_index[$clog2(PXLS_PER_DATA)-1:0];
    logic [CORE_COUNT-1:0][PXLS_PER_DATA-1:0][PXL_BITS-1:0] rd_pxl_data;
    logic [PXLS_PER_DATA-1:0][PXL_BITS-1:0] pxls;
    assign pxls = rd_pxl_data[core_index];
    assign rd_pxl_value = pxls[column_index];

    generate genvar i;
        for (i = 0; i < CORE_COUNT; i=i+1) begin
            BlockMemory #(
                .CAPACITY_BYTES    (PXL_COUNT*BYTES_PER_PXL/CORE_COUNT),
                .BYTES_PER_WORD    (PXLS_PER_DATA)
            ) u_BlockMemory (
                // Port A
                .port_a_clk        (wr_clk),
                .port_a_reset      ('0),
                .port_a_address    (wr_tile_index[i]),
                .port_a_rd_data    (),
                .port_a_rd_en      ('0),
                .port_a_wr_data    (wr_pxl_data[i]),
                .port_a_wr_en      (wr_en[i]),
                // Port B
                .port_b_clk        (rd_clk),
                .port_b_reset      (rd_reset),
                .port_b_address    (rd_tile_index),
                .port_b_rd_data    (rd_pxl_data[i]),
                .port_b_rd_en      (rd_en),
                .port_b_wr_data    ('0),
                .port_b_wr_en      ('0)
            );
        end
    endgenerate

endmodule
