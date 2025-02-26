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

    logic  inst_reset;
    logic [31:0] inst_addr;
    logic [31:0] inst_rd_data;
    logic inst_rd_en;

    logic [31:0] dmem_addr;
    logic [31:0] dmem_rd_data;
    logic [31:0] dmem_wr_data;
    logic dmem_wr_en;

    logic [31:0] dbus_addr;
    logic [31:0] dbus_rd_data;
    logic [31:0] dbus_wr_data;
    logic dbus_wr_en;

    RISCVCore u_RISCVCore (
        .clk             (clk),
        .reset           (reset || ctl_rst),
        // instr bus
        .inst_reset      (inst_reset),
        .inst_addr       (inst_addr),
        .inst_rd_data    (inst_rd_data),
        .inst_rd_en      (inst_rd_en),
        // data bus
        .dbus_addr        (dbus_addr),
        .dbus_rd_data     (dbus_rd_data),
        .dbus_wr_data     (dbus_wr_data),
        .dbus_wr_en       (dbus_wr_en)
    );

    DataBus data_bus (
        .dbus_addr               (dbus_addr),
        .dbus_rd_data            (dbus_rd_data),
        .dbus_wr_data            (dbus_wr_data),
        .dbus_wr_en              (dbus_wr_en),
        // main memory
        .dmem_addr               (dmem_addr),
        .dmem_rd_data            (dmem_rd_data),
        .dmem_wr_data            (dmem_wr_data),
        .dmem_wr_en              (dmem_wr_en),
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

    main_memory #(
        .INIT_FILE         (INIT_FILE),
        .WORD_COUNT        (64),
        .WORD_BITS         (32)
    ) u_main_memory (
        .clk               (clk),
        // instruction
        .port_a_reset      (inst_reset),
        .port_a_address    (inst_addr),
        .port_a_rd_data    (inst_rd_data),
        .port_a_rd_en      (inst_rd_en),
        .port_a_wr_data    (),
        .port_a_wr_en      (),
        // data
        .port_b_reset      ('0),
        .port_b_address    (dmem_addr),
        .port_b_rd_data    (dmem_rd_data),
        .port_b_rd_en      ('1),
        .port_b_wr_data    (dmem_wr_data),
        .port_b_wr_en      (dmem_wr_en)
    );

endmodule
