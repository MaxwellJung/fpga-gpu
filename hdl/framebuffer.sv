module Framebuffer #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PXL_BITS = 8,
    parameter TILE_WIDTH = 4,
    parameter TILE_HEIGHT = 4,
    localparam BYTES_PER_PXL = (PXL_BITS-1)/8 + 1,
    localparam PXL_COUNT = RESOLUTION_X*RESOLUTION_Y,
    localparam PXL_PER_TILE = TILE_WIDTH*TILE_HEIGHT,
    localparam PXLS_PER_DATA = 4
) (
    input logic wr_clk,
    input logic [PXL_PER_TILE-1:0][$clog2(PXL_COUNT/PXL_PER_TILE*BYTES_PER_PXL)-1:0] wr_tile_index,
    input logic [PXL_PER_TILE-1:0][PXLS_PER_DATA-1:0][PXL_BITS-1:0] wr_pxl_data,
    input logic [PXL_PER_TILE-1:0][PXLS_PER_DATA-1:0] wr_en,

    input logic rd_clk,
    input logic rd_reset,
    input logic rd_en,
    input logic [$clog2(RESOLUTION_X)-1:0] rd_pxl_x,
    input logic [$clog2(RESOLUTION_Y)-1:0] rd_pxl_y,
    output logic [PXL_BITS-1:0] rd_pxl_value
);
    logic [$clog2(RESOLUTION_X)-1:$clog2(TILE_WIDTH)] tile_index_x;
    logic [$clog2(TILE_WIDTH)-1:0] tile_offset_x;
    logic [$clog2(RESOLUTION_Y)-1:$clog2(TILE_HEIGHT)] tile_index_y;
    logic [$clog2(TILE_HEIGHT)-1:0] tile_offset_y;
    assign {tile_index_x, tile_offset_x} = rd_pxl_x;
    assign {tile_index_y, tile_offset_y} = rd_pxl_y;

    logic [$clog2(PXL_PER_TILE)-1:0] mem_index;
    assign mem_index = tile_offset_y*TILE_WIDTH 
                       + {{($clog2(PXL_PER_TILE)-$clog2(TILE_WIDTH)){1'b0}}, tile_offset_x};
    logic [$clog2((RESOLUTION_X/TILE_WIDTH)*(RESOLUTION_Y/TILE_HEIGHT))-1:0] rd_tile_index;
    assign rd_tile_index = tile_index_y*(RESOLUTION_X/TILE_WIDTH) 
                           + {{($clog2((RESOLUTION_X/TILE_WIDTH)*(RESOLUTION_Y/TILE_HEIGHT))-($clog2(RESOLUTION_X)-$clog2(TILE_WIDTH))){1'b0}}, tile_index_x};

    logic [$clog2(PXLS_PER_DATA)-1:0] column_index;
    always @(posedge rd_clk) column_index <= rd_tile_index[$clog2(PXLS_PER_DATA)-1:0];
    logic [PXL_PER_TILE-1:0][PXLS_PER_DATA-1:0][PXL_BITS-1:0] rd_pxl_data;
    logic [PXLS_PER_DATA-1:0][PXL_BITS-1:0] pxls;
    assign pxls = rd_pxl_data[mem_index];
    assign rd_pxl_value = pxls[column_index];

    generate genvar i;
        for (i = 0; i < PXL_PER_TILE; i=i+1) begin
            BlockMemory #(
                .CAPACITY_BYTES    (PXL_COUNT/PXL_PER_TILE*BYTES_PER_PXL),
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
