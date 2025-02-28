// Maps memory bus read/write to I/O devices
// Base Address must be integer multiples of 2**$clog2(bytes)
// otherwise, MSBs cannot be used to identify I/O device
module DataBus #(
    parameter MEMORY_BASE_ADDR = 0,
    parameter MEMORY_BYTES = 4096,

    parameter PALETTE_BASE_ADDR = 4096,
    parameter PALETTE_BYTES = 12*256/8,

    parameter FRAMEBUFFER_BASE_ADDR = 131072,
    parameter FRAMEBUFFER_BYTES = 400*300
) (
    input logic clk,
    input logic reset,

    // data bus
    input logic [31:0] dbus_addr,
    output logic [31:0] dbus_rd_data,
    input logic [31:0] dbus_wr_data,
    input logic dbus_wr_en,

    // main memory
    output logic [$clog2(MEMORY_BYTES)-1:0] dmem_addr,
    input logic [31:0] dmem_rd_data,
    output logic [31:0] dmem_wr_data,
    output logic dmem_wr_en,

    // palette
    output logic [$clog2(PALETTE_BYTES)-1:0] palette_addr,
    input logic [31:0] palette_rd_data,
    output logic [31:0] palette_wr_data,
    output logic palette_wr_en
);
    // check if MSBs of bus address match MSBs of base address
    logic m_access_memory, w_access_memory;
    logic m_access_palette, w_access_palette;
    always_comb begin
        m_access_memory = (dbus_addr[31:$clog2(MEMORY_BYTES)] == MEMORY_BASE_ADDR[31:$clog2(MEMORY_BYTES)]);
        m_access_palette = (dbus_addr[31:$clog2(PALETTE_BYTES)] == PALETTE_BASE_ADDR[31:$clog2(PALETTE_BYTES)]);
    end
    always_ff @(posedge clk) begin
        if (reset)
            {w_access_memory, w_access_palette} <= '0;
        else
            {w_access_memory, w_access_palette} <= {m_access_memory, m_access_palette};
    end

    always_comb begin
        // memory
        dmem_addr = dbus_addr[$clog2(MEMORY_BYTES)-1:0];
        dmem_wr_data = dbus_wr_data;
        dmem_wr_en = m_access_memory && dbus_wr_en;

        // palette
        palette_addr = dbus_addr[$clog2(PALETTE_BYTES)-1:0];
        palette_wr_data = dbus_wr_data;
        palette_wr_en = m_access_palette && dbus_wr_en;
    end

    always_comb begin
        if (w_access_memory) begin
            dbus_rd_data = dmem_rd_data;
        end
        else if (w_access_palette) begin
            dbus_rd_data = palette_rd_data;
        end
        else begin
            dbus_rd_data = '0;
        end
    end

endmodule
