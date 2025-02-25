`include "./hdl/processor/defines.svh"

module DisplayProcessor #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256,
    parameter COLOR_BITS = 12
) (
    input logic clk_i,
    input logic reset_i,

    // memory mapped i/o
    output logic [31:0] status_o,
    input logic [31:0] control_i,

    // color palette
    output logic [$clog2(PALETTE_LENGTH)-1:0] palette_wr_index_o,
    output logic [$clog2(COLOR_BITS)-1:0] palette_wr_color_o,
    output logic palette_wr_en_o,

    // framebuffer
    output logic [$clog2(RESOLUTION_X)-1:0] fb_wr_x_o,
    output logic [$clog2(RESOLUTION_Y)-1:0] fb_wr_y_o,
    output logic [$clog2(PALETTE_LENGTH)-1:0] fb_wr_index_o,
    output logic fb_wr_en_o
);
    logic [31:0] status;
    struct packed {
        logic [$clog2(RESOLUTION_X)-1:0] x;
        logic [$clog2(RESOLUTION_Y)-1:0] y;
    } current_position;
    logic [31:0] fill;
    logic [$clog2(PALETTE_LENGTH)-1:0] index;
    logic [31:0] wmode;
    logic [31:0] mask;
    logic [31:0] pattern;

    logic ctl_rst;
    assign ctl_rst = control_i[23];

    always_ff @(posedge clk_i) begin
        if (reset_i || ctl_rst) begin
            status <= 32'h00000010;
            current_position.x <= '0;
            current_position.y <= '0;
            fill <= '0;
            index <= '0;
            wmode <= '0;
            mask <= '0;
            pattern <= '0;
        end else begin

        end
    end

    assign status_o = status;

    assign fb_wr_x_o = current_position.x;
    assign fb_wr_y_o = current_position.y;
    assign fb_wr_index_o = index;
    assign fb_wr_en_o = '1;

    assign palette_wr_index_o = '0;
    assign palette_wr_color_o = '0;
    assign palette_wr_en_o = '0;

    logic [31:0] bus_addr;
    logic [31:0] bus_rd_data;
    logic [31:0] bus_wr_data;
    logic bus_wr_en;

    RISCVCore riscv_core (
        .clk_i        (clk_i),
        .reset_i      (reset_i || ctl_rst),
        // memory bus
        .addr_o       (bus_addr),
        .rd_data_i    (bus_rd_data),
        .wr_data_o    (bus_wr_data),
        .wr_en_o      (bus_wr_en)
    );

    logic [31:0] mem_addr;
    logic [31:0] mem_rd_data;
    logic [31:0] mem_wr_data;
    logic mem_wr_en;
    MemoryMap memory_map (
        .bus_addr_i               (bus_addr),
        .bus_rd_data_o            (bus_rd_data),
        .bus_wr_data_i            (bus_wr_data),
        .bus_wr_en_i              (bus_wr_en),
        // main memory
        .mem_addr_o               (mem_addr),
        .mem_rd_data_i            (mem_rd_data),
        .mem_wr_data_o            (mem_wr_data),
        .mem_wr_en_o              (mem_wr_en),
        // framebuffer
        .fb_addr_o                (fb_addr),
        .fb_rd_data_i             (fb_rd_data),
        .fb_wr_data_o             (fb_wr_data),
        .fb_wr_en_o               (fb_wr_en),
        // palette
        .palette_addr_o           (palette_addr),
        .palette_rd_data_i        (palette_rd_data),
        .palette_wr_data_o        (palette_wr_data),
        .palette_wr_en_o          (palette_wr_en)
    );

    DataCache data_cache (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .address_i(mem_addr),
        .rd_data_o(mem_rd_data),
        .wr_data_i(mem_wr_data),
        .wr_en_i(mem_wr_en)
    );

endmodule
