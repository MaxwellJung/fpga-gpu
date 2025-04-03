module Framebuffer #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PIXEL_BITS = 8,
    localparam BYTES_PER_PIXEL = (PIXEL_BITS-1)/8 + 1,
    localparam PIXEL_COUNT = RESOLUTION_X*RESOLUTION_Y,
    localparam PARTITION = 16,
    localparam ADDR_BITS = $clog2(PIXEL_COUNT*BYTES_PER_PIXEL/PARTITION),
    localparam PIXELS_PER_DATA = 4
) (
    input logic wr_clk,
    input logic [PARTITION-1:0][ADDR_BITS-1:0] wr_pxl_addr,
    input logic [PARTITION-1:0][PIXELS_PER_DATA-1:0][PIXEL_BITS-1:0] wr_pxl_data,
    input logic [PARTITION-1:0][PIXELS_PER_DATA-1:0] wr_en,

    input logic rd_clk,
    input logic rd_reset,
    input logic rd_en,
    input logic [$clog2(RESOLUTION_X)-1:0] rd_pxl_x,
    input logic [$clog2(RESOLUTION_Y)-1:0] rd_pxl_y,
    output logic [PIXEL_BITS-1:0] rd_pxl_value
);
    logic [$clog2(PIXEL_COUNT)-1:0] rd_pxl_index;
    logic [ADDR_BITS-1:0] rd_pxl_addr;
    assign rd_pxl_index = RESOLUTION_X*rd_pxl_y + rd_pxl_x;
    assign rd_pxl_addr = BYTES_PER_PIXEL*rd_pxl_index;
    logic [1:0] column_index;
    always @(posedge rd_clk) column_index <= rd_pxl_addr[1:0];
    logic [31:0] rd_pxl_data;
    assign rd_pxl_value = rd_pxl_data[PIXEL_BITS*column_index+:PIXEL_BITS];

    generate genvar i;
        for (i = 0; i < PARTITION; ++i) begin
            BlockMemory #(
                .CAPACITY_BYTES    (PIXEL_COUNT*BYTES_PER_PIXEL/PARTITION),
                .BYTES_PER_WORD    (PIXELS_PER_DATA)
            ) u_BlockMemory (
                // Port A
                .port_a_clk        (wr_clk),
                .port_a_reset      ('0),
                .port_a_address    (wr_pxl_addr[i]),
                .port_a_rd_data    (),
                .port_a_rd_en      ('0),
                .port_a_wr_data    (wr_pxl_data[i]),
                .port_a_wr_en      (wr_en[i]),
                // Port B
                .port_b_clk        (rd_clk),
                .port_b_reset      (rd_reset),
                .port_b_address    (rd_pxl_addr),
                .port_b_rd_data    (rd_pxl_data),
                .port_b_rd_en      (rd_en),
                .port_b_wr_data    ('0),
                .port_b_wr_en      ('0)
            );
        end
    endgenerate

endmodule
