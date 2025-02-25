// Maps memory bus read/write to I/O devices
// Base Address must be integer multiples of 2**$clog2(bytes)
// otherwise, MSBs cannot be used to identify I/O device
module MemoryMap #(
    parameter MEMORY_BASE_ADDR = 0,
    parameter MEMORY_BYTES = 1024,

    parameter PALETTE_BASE_ADDR = 2048,
    parameter PALETTE_BYTES = 12*256/8,

    parameter FRAMEBUFFER_BASE_ADDR = 131072,
    parameter FRAMEBUFFER_BYTES = 400*300
) (
    input logic [31:0] bus_addr,
    output logic [31:0] bus_rd_data,
    input logic [31:0] bus_wr_data,
    input logic bus_wr_en,

    // main memory
    output logic [$clog2(MEMORY_BYTES)-1:0] mem_addr,
    input logic [31:0] mem_rd_data,
    output logic [31:0] mem_wr_data,
    output logic mem_wr_en,

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
        access_memory = (bus_addr[31:$clog2(MEMORY_BYTES)] == MEMORY_BASE_ADDR[31:$clog2(MEMORY_BYTES)]);
        access_palette = (bus_addr[31:$clog2(PALETTE_BYTES)] == PALETTE_BASE_ADDR[31:$clog2(PALETTE_BYTES)]);
        access_framebuffer = (bus_addr[31:$clog2(FRAMEBUFFER_BYTES)] == FRAMEBUFFER_BASE_ADDR[31:$clog2(FRAMEBUFFER_BYTES)]);
    end

    always_comb begin
        // memory
        mem_addr = bus_addr[$clog2(MEMORY_BYTES)-1:0];
        mem_wr_data = bus_wr_data;
        mem_wr_en = access_memory && bus_wr_en;

        // palette
        palette_addr = bus_addr[$clog2(PALETTE_BYTES)-1:0];
        palette_wr_data = bus_wr_data;
        palette_wr_en = access_palette && bus_wr_en;

        // framebuffer
        fb_addr = bus_addr[$clog2(FRAMEBUFFER_BYTES)-1:0];
        fb_wr_data = bus_wr_data;
        fb_wr_en = access_framebuffer && bus_wr_en;
    end

    always_comb begin
        if (access_memory) begin
            bus_rd_data = mem_rd_data;
        end
        else if (access_palette) begin
            bus_rd_data = palette_rd_data;
        end
        else if (access_framebuffer) begin
            bus_rd_data = fb_rd_data;
        end
        else begin
            bus_rd_data = '0;
        end
    end

endmodule
