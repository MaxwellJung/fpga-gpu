`include "./hdl/processor/defines.svh"

/* Memory Map
    MAIN_MEMORY_BASE_ADDR = 32'h0,
    MAIN_MEMORY_BYTES = 32'h80000000,

    IO_REGISTERS_BASE_ADDR = 32'hC0000000,
    IO_REGISTERS_BYTES = 4096,

    PALETTE_BASE_ADDR = 32'hD0000000,
    PALETTE_BYTES = 2*256, // 2 bytes per color

    FRAMEBUFFER_BASE_ADDR = 32'hE0000000,
    FRAMEBUFFER_BYTES = 400*300
*/

// Decodes bus address to select a single memory or I/O device
module AddressDecoder (
    input logic [31:0] bus_addr,
    output device_select_t device_select
);
    // Decode based on MSBs
    logic io_device_select;
    always_comb begin
        // Memory addresses starting with 
        // 0xC..., 0xD..., 0xE..., 0xF...
        // correspond to I/O devices
        io_device_select = bus_addr[31:30] == 2'b11;

        // Default select
        device_select = SELECT_NONE;
        if (!io_device_select) begin
            device_select = SELECT_MAIN_MEMORY;
        end
        else begin
            if (bus_addr[29:28] == 2'b00)
                device_select = SELECT_IO_REGISTERS;
            else if (bus_addr[29:28] == 2'b01)
                device_select = SELECT_PALETTE;
            else if (bus_addr[29:28] == 2'b10)
                device_select = SELECT_FRAMEBUFFER;
            else
                device_select = SELECT_NONE;
        end
    end

endmodule
