`include "./hdl/processor/defines.svh"

module DisplayProcessor (
    input logic clk,
    input logic reset,

    // Instruction memory
    output logic inst_reset,
    output logic [31:0] inst_addr,
    input logic [31:0] inst_rd_data,
    output logic inst_rd_en,

    // Data memory
    output logic [31:0] data_mem_addr,
    input logic [31:0] data_mem_rd_data,
    output logic [31:0] data_mem_wr_data,
    output logic [3:0] data_mem_wr_en,

    // I/O reg
    output logic [31:0] io_reg_addr,
    input logic [31:0] io_reg_rd_data,
    output logic [31:0] io_reg_wr_data,
    output logic [3:0] io_reg_wr_en,

    // color palette
    output logic [31:0] palette_wr_addr,
    output logic [31:0] palette_wr_data,
    output logic [3:0] palette_wr_en,

    // framebuffer
    output logic [31:0] fb_wr_addr,
    output logic [31:0] fb_wr_data,
    output logic [3:0] fb_wr_en
);
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

    device_select_t m_device_select, w_device_select;
    AddressDecoder u_AddressDecoder (
        .bus_addr         (dbus_addr),
        .device_select    (m_device_select)
    );
    always_ff @(posedge clk) begin
        if (reset)
            w_device_select <= SELECT_NONE;
        else
            w_device_select <= m_device_select;
    end

    always_comb begin
        data_mem_addr = '0;
        io_reg_addr = '0;
        palette_wr_addr = '0;
        fb_wr_addr = '0;
        case (m_device_select)
            SELECT_MAIN_MEMORY: data_mem_addr = dbus_addr;
            SELECT_IO_REGISTERS: io_reg_addr = dbus_addr;
            SELECT_PALETTE: palette_wr_addr = dbus_addr;
            SELECT_FRAMEBUFFER: fb_wr_addr = dbus_addr;
        endcase

        dbus_rd_data = '0;
        case (w_device_select)
            SELECT_MAIN_MEMORY: dbus_rd_data = data_mem_rd_data;
            SELECT_IO_REGISTERS: dbus_rd_data = io_reg_rd_data;
            SELECT_PALETTE: dbus_rd_data = '0;
            SELECT_FRAMEBUFFER: dbus_rd_data = '0;
        endcase

        data_mem_wr_data = '0;
        io_reg_wr_data = '0;
        palette_wr_data = '0;
        fb_wr_data = '0;
        case (m_device_select)
            SELECT_MAIN_MEMORY: data_mem_wr_data = dbus_wr_data;
            SELECT_IO_REGISTERS: io_reg_wr_data = dbus_wr_data;
            SELECT_PALETTE: palette_wr_data = dbus_wr_data;
            SELECT_FRAMEBUFFER: fb_wr_data = dbus_wr_data;
        endcase

        data_mem_wr_en = '0;
        io_reg_wr_en = '0;
        palette_wr_en = '0;
        fb_wr_en = '0;
        case (m_device_select)
            SELECT_MAIN_MEMORY: data_mem_wr_en = dbus_wr_en;
            SELECT_IO_REGISTERS: io_reg_wr_en = dbus_wr_en;
            SELECT_PALETTE: palette_wr_en = dbus_wr_en;
            SELECT_FRAMEBUFFER: fb_wr_en = dbus_wr_en;
        endcase
    end

endmodule
