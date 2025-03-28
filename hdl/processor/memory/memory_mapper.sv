// Maps memory bus read/write to I/O devices
// Base Address must be integer multiples of 2**$clog2(bytes)
// otherwise, MSBs cannot be used to identify I/O device
module MemoryMapper #(
    parameter MAIN_MEMORY_BASE_ADDR = 32'h0,
    parameter MAIN_MEMORY_BYTES = 32'h80000000,

    parameter IO_REGISTERS_BASE_ADDR = 32'hC0000000,
    parameter IO_REGISTERS_BYTES = 4096,

    parameter PALETTE_BASE_ADDR = 32'hC0001000,
    parameter PALETTE_BYTES = 2*256, // 2 bytes per color

    parameter FRAMEBUFFER_BASE_ADDR = 32'hC0020000,
    parameter FRAMEBUFFER_BYTES = 400*300
) (
    input logic clk,
    input logic reset,

    // Data bus
    input logic [31:0] bus_addr,
    output logic [31:0] bus_rd_data,
    input logic [31:0] bus_wr_data,
    input logic [3:0] bus_wr_en,

    // Main memory
    output logic [$clog2(MAIN_MEMORY_BYTES)-1:0] main_mem_addr,
    input logic [31:0] main_mem_rd_data,
    output logic [31:0] main_mem_wr_data,
    output logic [3:0] main_mem_wr_en,

    // IO registers
    output logic [$clog2(IO_REGISTERS_BYTES)-1:0] io_reg_addr,
    input logic [31:0] io_reg_rd_data,
    output logic [31:0] io_reg_wr_data,
    output logic [3:0] io_reg_wr_en,

    // Palette
    output logic [$clog2(PALETTE_BYTES)-1:0] palette_addr,
    input logic [31:0] palette_rd_data,
    output logic [31:0] palette_wr_data,
    output logic [3:0] palette_wr_en,

    // Framebuffer
    output logic [$clog2(FRAMEBUFFER_BYTES)-1:0] fb_addr,
    input logic [31:0] fb_rd_data,
    output logic [31:0] fb_wr_data,
    output logic [3:0] fb_wr_en
);
    // check if MSBs of bus address match MSBs of base address
    logic m_access_memory, w_access_memory;
    logic m_access_io_reg, w_access_io_reg;
    logic m_access_palette, w_access_palette;
    logic m_access_fb, w_access_fb;
    always_comb begin
        m_access_memory = (bus_addr[31:$clog2(MAIN_MEMORY_BYTES)] == MAIN_MEMORY_BASE_ADDR[31:$clog2(MAIN_MEMORY_BYTES)]);
        m_access_io_reg = (bus_addr[31:$clog2(IO_REGISTERS_BYTES)] == IO_REGISTERS_BASE_ADDR[31:$clog2(IO_REGISTERS_BYTES)]);
        m_access_palette = (bus_addr[31:$clog2(PALETTE_BYTES)] == PALETTE_BASE_ADDR[31:$clog2(PALETTE_BYTES)]);
        m_access_fb = (bus_addr[31:$clog2(FRAMEBUFFER_BYTES)] == FRAMEBUFFER_BASE_ADDR[31:$clog2(FRAMEBUFFER_BYTES)]);
    end
    always_ff @(posedge clk) begin
        if (reset)
            {w_access_memory, w_access_io_reg, w_access_palette, w_access_fb} <= '0;
        else
            {w_access_memory, w_access_io_reg, w_access_palette, w_access_fb} <= 
            {m_access_memory, m_access_io_reg, m_access_palette, m_access_fb};
    end

    always_comb begin
        // memory
        main_mem_addr = bus_addr[$clog2(MAIN_MEMORY_BYTES)-1:0];
        main_mem_wr_data = bus_wr_data;
        main_mem_wr_en = m_access_memory ? bus_wr_en : '0;

        // IO registers
        io_reg_addr = bus_addr[$clog2(IO_REGISTERS_BYTES)-1:0];
        io_reg_wr_data = bus_wr_data;
        io_reg_wr_en = m_access_io_reg ? bus_wr_en : '0;

        // palette
        palette_addr = bus_addr[$clog2(PALETTE_BYTES)-1:0];
        palette_wr_data = bus_wr_data;
        palette_wr_en = m_access_palette ? bus_wr_en : '0;

        // Framebuffer
        fb_addr = bus_addr[$clog2(FRAMEBUFFER_BYTES)-1:0];
        fb_wr_data = bus_wr_data;
        fb_wr_en = m_access_fb ? bus_wr_en : '0;
    end

    always_comb begin
        if (w_access_memory) begin
            bus_rd_data = main_mem_rd_data;
        end
        else if (w_access_io_reg) begin
            bus_rd_data = io_reg_rd_data;
        end
        else if (w_access_palette) begin
            bus_rd_data = palette_rd_data;
        end
        else if (w_access_fb) begin
            bus_rd_data = fb_rd_data;
        end
        else begin
            bus_rd_data = '0;
        end
    end

endmodule
