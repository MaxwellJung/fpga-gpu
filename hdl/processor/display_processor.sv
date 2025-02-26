`include "./hdl/processor/defines.svh"

module DisplayProcessor #(
    parameter INIT_FILE = "build/gputest.mem",
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256,
    parameter COLOR_BITS = 12
) (
    input logic clk,
    input logic reset,

    // memory mapped i/o
    output logic [31:0] status,
    input logic [31:0] control,

    // color palette
    output logic [$clog2(PALETTE_LENGTH)-1:0] palette_wr_index,
    output logic [COLOR_BITS-1:0] palette_wr_color,
    output logic palette_wr_en,

    // framebuffer
    output logic [$clog2(RESOLUTION_X)-1:0] fb_wr_x,
    output logic [$clog2(RESOLUTION_Y)-1:0] fb_wr_y,
    output logic [$clog2(PALETTE_LENGTH)-1:0] fb_wr_index,
    output logic fb_wr_en
);
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
    assign ctl_rst = control[23];

    always_ff @(posedge clk) begin
        if (reset || ctl_rst) begin
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

    assign fb_wr_x = current_position.x;
    assign fb_wr_y = current_position.y;
    assign fb_wr_index = index;
    assign fb_wr_en = '1;

    logic [31:0] bus_addr;
    logic [31:0] bus_rd_data;
    logic [31:0] bus_wr_data;
    logic bus_wr_en;

    RISCVCore #(
        .INIT_FILE(INIT_FILE)
    ) riscv_core (
        .clk        (clk),
        .reset      (reset || ctl_rst),
        // memory bus
        .bus_addr       (bus_addr),
        .bus_rd_data    (bus_rd_data),
        .bus_wr_data    (bus_wr_data),
        .bus_wr_en      (bus_wr_en)
    );

    logic [31:0] mem_addr;
    logic [31:0] mem_rd_data;
    logic [31:0] mem_wr_data;
    logic mem_wr_en;
    MemoryMap memory_map (
        .bus_addr               (bus_addr),
        .bus_rd_data            (bus_rd_data),
        .bus_wr_data            (bus_wr_data),
        .bus_wr_en              (bus_wr_en),
        // main memory
        .mem_addr               (mem_addr),
        .mem_rd_data            (mem_rd_data),
        .mem_wr_data            (mem_wr_data),
        .mem_wr_en              (mem_wr_en),
        // framebuffer
        .fb_addr                (),
        .fb_rd_data             (),
        .fb_wr_data             (),
        .fb_wr_en               (),
        // palette
        .palette_addr           (palette_wr_index),
        .palette_rd_data        (),
        .palette_wr_data        (palette_wr_color),
        .palette_wr_en          (palette_wr_en)
    );

    DataCache data_cache (
        .clk(clk),
        .reset(reset),

        .address(mem_addr),
        .rd_data(mem_rd_data),
        .wr_data(mem_wr_data),
        .wr_en(mem_wr_en)
    );

endmodule
