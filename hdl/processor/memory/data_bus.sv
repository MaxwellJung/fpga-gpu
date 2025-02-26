// Maps memory bus read/write to I/O devices
// Base Address must be integer multiples of 2**$clog2(bytes)
// otherwise, MSBs cannot be used to identify I/O device
module DataBus #(
    parameter MEMORY_BASE_ADDR = 0,
    parameter MEMORY_BYTES = 1024,

    parameter PALETTE_BASE_ADDR = 2048,
    parameter PALETTE_BYTES = 12*256/8,

    parameter FRAMEBUFFER_BASE_ADDR = 131072,
    parameter FRAMEBUFFER_BYTES = 400*300
) (
    input logic [31:0] dbus_addr,
    output logic [31:0] dbus_rd_data,
    input logic [31:0] dbus_wr_data,
    input logic dbus_wr_en,

    // main memory
    output logic [$clog2(MEMORY_BYTES)-1:0] dmem_addr,
    input logic [31:0] dmem_rd_data,
    output logic [31:0] dmem_wr_data,
    output logic dmem_wr_en,

    // framebuffer
    output logic [$clog2(FRAMEBUFFER_BYTES)-1:0] fb_addr,
    input logic [31:0] fb_rd_data,
    output logic [31:0] fb_wr_data,
    output logic fb_wr_en,

    // palette
    output logic [$clog2(PALETTE_BYTES)-1:0] palette_addr,
    input logic [31:0] palette_rd_data,
    output logic [31:0] palette_wr_data,
    output logic palette_wr_en
);
    // check if MSBs of bus address match MSBs of base address
    logic access_memory;
    logic access_framebuffer;
    logic access_palette;
    always_comb begin
        access_memory = (dbus_addr[31:$clog2(MEMORY_BYTES)] == MEMORY_BASE_ADDR[31:$clog2(MEMORY_BYTES)]);
        access_palette = (dbus_addr[31:$clog2(PALETTE_BYTES)] == PALETTE_BASE_ADDR[31:$clog2(PALETTE_BYTES)]);
        access_framebuffer = (dbus_addr[31:$clog2(FRAMEBUFFER_BYTES)] == FRAMEBUFFER_BASE_ADDR[31:$clog2(FRAMEBUFFER_BYTES)]);
    end

    always_comb begin
        // memory
        dmem_addr = dbus_addr[$clog2(MEMORY_BYTES)-1:0];
        dmem_wr_data = dbus_wr_data;
        dmem_wr_en = access_memory && dbus_wr_en;

        // palette
        palette_addr = dbus_addr[$clog2(PALETTE_BYTES)-1:0];
        palette_wr_data = dbus_wr_data;
        palette_wr_en = access_palette && dbus_wr_en;

        // framebuffer
        fb_addr = dbus_addr[$clog2(FRAMEBUFFER_BYTES)-1:0];
        fb_wr_data = dbus_wr_data;
        fb_wr_en = access_framebuffer && dbus_wr_en;
    end

    always_comb begin
        if (access_memory) begin
            dbus_rd_data = dmem_rd_data;
        end
        else if (access_palette) begin
            dbus_rd_data = palette_rd_data;
        end
        else if (access_framebuffer) begin
            dbus_rd_data = fb_rd_data;
        end
        else begin
            dbus_rd_data = '0;
        end
    end

endmodule
