`include "./hdl/processor/defines.svh"

module DisplayProcessor #(
    parameter INIT_FILE = "build/gputest.mem",
    parameter MAIN_MEMORY_BYTES = 1024,
    parameter IO_REGISTERS_BYTES = 4096,
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256,
    localparam PALETTE_BYTES = 2*PALETTE_LENGTH,
    parameter COLOR_BITS = 12
) (
    input logic clk,
    input logic reset,

    // memory mapped i/o
    output logic [$clog2(IO_REGISTERS_BYTES)-1:0] io_reg_addr,
    input logic [31:0] io_reg_rd_data,
    output logic [31:0] io_reg_wr_data,
    output logic [3:0] io_reg_wr_en,

    // color palette
    output logic [$clog2(PALETTE_LENGTH)-1:0] palette_wr_index,
    output logic [COLOR_BITS-1:0] palette_wr_color,
    output logic palette_wr_en,

    // framebuffer
    output logic [$clog2(RESOLUTION_X*RESOLUTION_Y)-1:0] fb_addr,
    output logic [$clog2(PALETTE_LENGTH)-1:0] fb_wr_data,
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

    always_ff @(posedge clk) begin
        if (reset) begin
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

    logic inst_reset;
    logic [$clog2(MAIN_MEMORY_BYTES)-1:0] inst_addr;
    logic [31:0] inst_rd_data;
    logic inst_rd_en;

    logic [31:0] dbus_addr;
    logic [31:0] dbus_rd_data;
    logic [31:0] dbus_wr_data;
    logic [3:0] dbus_wr_en;

    RISCVCore u_RISCVCore (
        .clk                (clk),
        .reset              (reset),
        // instr bus
        .inst_reset         (inst_reset),
        .inst_addr          (inst_addr),
        .inst_rd_data       (inst_rd_data),
        .inst_rd_en         (inst_rd_en),
        // data bus
        .dbus_addr          (dbus_addr),
        .dbus_rd_data       (dbus_rd_data),
        .dbus_wr_data       (dbus_wr_data),
        .dbus_wr_en         (dbus_wr_en),
        // framebuffer
        .fb_wr_pxl_x        (),
        .fb_wr_pxl_y        (),
        .fb_wr_pxl_value    (),
        .fb_wr_en           ()
    );

    logic [$clog2(MAIN_MEMORY_BYTES)-1:0] main_mem_addr;
    logic [31:0] main_mem_rd_data;
    logic [31:0] main_mem_wr_data;
    logic [3:0] main_mem_wr_en;

    logic [$clog2(PALETTE_BYTES)-1:0] palette_addr;
    logic [31:0] palette_wr_data;

    MemoryMapper #(
        .MAIN_MEMORY_BYTES         (MAIN_MEMORY_BYTES),
        .IO_REGISTERS_BYTES        (4096),
        .PALETTE_BYTES             (2*256),
        .FRAMEBUFFER_BYTES         (400*300)
    ) u_MemoryMapper (
        .clk                       (clk),
        .reset                     (reset),
        // Data bus
        .bus_addr                  (dbus_addr),
        .bus_rd_data               (dbus_rd_data),
        .bus_wr_data               (dbus_wr_data),
        .bus_wr_en                 (dbus_wr_en),
        // Main memory
        .main_mem_addr             (main_mem_addr),
        .main_mem_rd_data          (main_mem_rd_data),
        .main_mem_wr_data          (main_mem_wr_data),
        .main_mem_wr_en            (main_mem_wr_en),
        // IO registers
        .io_reg_addr               (io_reg_addr),
        .io_reg_rd_data            (io_reg_rd_data),
        .io_reg_wr_data            (io_reg_wr_data),
        .io_reg_wr_en              (io_reg_wr_en),
        // Palette
        .palette_addr              (palette_addr),
        .palette_rd_data           (),
        .palette_wr_data           (palette_wr_data),
        .palette_wr_en             (palette_wr_en),
        // Framebuffer
        .fb_addr                   (fb_addr),
        .fb_rd_data                (),
        .fb_wr_data                (fb_wr_data),
        .fb_wr_en                  (fb_wr_en)
    );

    main_memory #(
        .INIT_FILE         (INIT_FILE),
        .WORD_BITS         (32),
        .CAPACITY_BYTES    (MAIN_MEMORY_BYTES)
    ) u_main_memory (
        .clk               (clk),
        // instruction
        .port_a_reset      (inst_reset),
        .port_a_address    (inst_addr),
        .port_a_rd_data    (inst_rd_data),
        .port_a_rd_en      (inst_rd_en),
        .port_a_wr_data    ('0),
        .port_a_wr_en      ('0),
        // data
        .port_b_reset      ('0),
        .port_b_address    (main_mem_addr),
        .port_b_rd_data    (main_mem_rd_data),
        .port_b_rd_en      ('1),
        .port_b_wr_data    (main_mem_wr_data),
        .port_b_wr_en      (main_mem_wr_en)
    );

    always_comb begin
        palette_wr_index = palette_addr>>1;
        palette_wr_color = palette_wr_data[0+:COLOR_BITS];
    end

endmodule
