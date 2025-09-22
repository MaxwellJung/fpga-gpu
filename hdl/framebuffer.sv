module framebuffer #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PIXEL_BITS = 8,
    localparam PIXEL_BYTES = (PIXEL_BITS-1)/8 + 1,
    localparam PIXEL_COUNT = RESOLUTION_X*RESOLUTION_Y,
    localparam FRAMEBUFFER_CAPACITY = PIXEL_BYTES*PIXEL_COUNT
) (
    // vga interface
    input  logic                           vga_clk,
    input  logic                           vga_reset,
    input  logic [$clog2(PIXEL_COUNT)-1:0] pixel_index,
    input  logic                           pixel_index_valid,
    output logic [PIXEL_BITS-1:0]          color_index,
    output logic                           color_index_valid,

    // display processor interface
    input  logic                                    port_b_clk,
    input  logic                                    port_b_reset,
    input  logic [$clog2(FRAMEBUFFER_CAPACITY)-1:0] port_b_address,
    output logic [31:0]                             port_b_rd_data,
    input  logic                                    port_b_rd_en,
    input  logic [31:0]                             port_b_wr_data,
    input  logic [3:0]                              port_b_wr_en
);

    logic [$clog2(FRAMEBUFFER_CAPACITY)-1:0] port_a_address;
    logic [31:0]                             port_a_rd_data;
    logic                                    port_a_rd_en;
    logic [1:0]                              column_index;

    assign port_a_address = pixel_index << $clog2(PIXEL_BYTES);
    assign port_a_rd_en = pixel_index_valid;
    assign color_index = port_a_rd_data[8*PIXEL_BYTES*column_index+:PIXEL_BITS];

    always_ff @(posedge vga_clk) begin
        if (vga_reset) begin
            column_index <= 0;
            color_index_valid <= 0;
        end else begin
            column_index <= port_a_address[1:0];
            color_index_valid <= pixel_index_valid;
        end
    end

    block_memory #(
        .CAPACITY_BYTES    (FRAMEBUFFER_CAPACITY),
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
