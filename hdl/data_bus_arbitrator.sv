/* Memory Map
    MAIN_MEMORY_ADDR  = 32'h00000000 ~ 32'h00000FFF   (4096 bytes),
    HEAP_MEMORY_ADDR  = 32'h10000000 ~ 32'h1001FFFF (131072 bytes),

    IO_REGISTERS_ADDR = 32'hC0000000 ~ 32'hC0000FFF   (4096 bytes),
    PALETTE_ADDR      = 32'hD0000000 ~ 32'hD00001FF    (512 bytes),
    FRAMEBUFFER_ADDR  = 32'hE0000000 ~ 32'hE001D4BF (120000 bytes),
*/
module data_bus_arbitrator (
    input  logic        clk,
    input  logic        reset,

    // interface to display processor
    input  logic [31:0] dp_data_addr,
    output logic [31:0] dp_data_rd_data,
    input  logic [31:0] dp_data_wr_data,
    input  logic [3:0]  dp_data_wr_en,

    // interface to main memory (instruction + stack)
    output logic [31:0] main_mem_port_b_address,
    input  logic [31:0] main_mem_port_b_rd_data,
    output logic [31:0] main_mem_port_b_wr_data,
    output logic [3:0]  main_mem_port_b_wr_en,

    // interface to heap memory
    output logic [31:0] heap_mem_port_b_address,
    input  logic [31:0] heap_mem_port_b_rd_data,
    output logic [31:0] heap_mem_port_b_wr_data,
    output logic [3:0]  heap_mem_port_b_wr_en,

    // interface to io registers
    output logic [31:0] io_reg_port_b_address,
    input  logic [31:0] io_reg_port_b_rd_data,
    output logic [31:0] io_reg_port_b_wr_data,
    output logic [3:0]  io_reg_port_b_wr_en,

    // interface to color palette
    output logic [31:0] color_pal_port_b_address,
    input  logic [31:0] color_pal_port_b_rd_data,
    output logic [31:0] color_pal_port_b_wr_data,
    output logic [3:0]  color_pal_port_b_wr_en,

    // interface to framebuffer
    output logic [31:0] framebuffer_port_b_address,
    input  logic [31:0] framebuffer_port_b_rd_data,
    output logic [31:0] framebuffer_port_b_wr_data,
    output logic [3:0]  framebuffer_port_b_wr_en
);
    typedef enum logic [3:0] {
        SELECT_NONE,
        SELECT_MAIN_MEMORY,
        SELECT_HEAP_MEMORY,
        SELECT_IO_REGISTERS,
        SELECT_PALETTE,
        SELECT_FRAMEBUFFER
    } device_select_t;

    device_select_t m_device_select;

    // Decode based on MSBs
    // Memory addresses starting with 
    // 0xC..., 0xD..., 0xE..., 0xF...
    // correspond to I/O devices
    always_comb begin
        // Default select none
        m_device_select = SELECT_NONE;
        case (dp_data_addr[31:28])
            4'h0 : begin
                m_device_select = SELECT_MAIN_MEMORY;
            end 4'h1: begin
                m_device_select = SELECT_HEAP_MEMORY;
            end 4'hC: begin
                m_device_select = SELECT_IO_REGISTERS;
            end 4'hD: begin
                m_device_select = SELECT_PALETTE;
            end 4'hE: begin
                m_device_select = SELECT_FRAMEBUFFER;
            end default: begin
                m_device_select = SELECT_NONE;
            end
        endcase
    end
    
    device_select_t w_device_select;
    always_ff @(posedge clk) begin
        if (reset)
            w_device_select <= SELECT_NONE;
        else
            w_device_select <= m_device_select;
    end

    always_comb begin
        // Write arbitration
        main_mem_port_b_address = '0;
        main_mem_port_b_wr_data = '0;
        main_mem_port_b_wr_en = '0;

        heap_mem_port_b_address = '0;
        heap_mem_port_b_wr_data = '0;
        heap_mem_port_b_wr_en = '0;

        io_reg_port_b_address = '0;
        io_reg_port_b_wr_data = '0;
        io_reg_port_b_wr_en = '0;

        color_pal_port_b_address = '0;
        color_pal_port_b_wr_data = '0;
        color_pal_port_b_wr_en = '0;

        framebuffer_port_b_address = '0;
        framebuffer_port_b_wr_data = '0;
        framebuffer_port_b_wr_en = '0;

        case (m_device_select)
            SELECT_MAIN_MEMORY: begin
                main_mem_port_b_address = dp_data_addr;
                main_mem_port_b_wr_data = dp_data_wr_data;
                main_mem_port_b_wr_en = dp_data_wr_en;
            end SELECT_HEAP_MEMORY: begin
                heap_mem_port_b_address = dp_data_addr;
                heap_mem_port_b_wr_data = dp_data_wr_data;
                heap_mem_port_b_wr_en = dp_data_wr_en;
            end SELECT_IO_REGISTERS: begin
                io_reg_port_b_address = dp_data_addr;
                io_reg_port_b_wr_data = dp_data_wr_data;
                io_reg_port_b_wr_en = dp_data_wr_en;
            end SELECT_PALETTE: begin
                color_pal_port_b_address = dp_data_addr;
                color_pal_port_b_wr_data = dp_data_wr_data;
                color_pal_port_b_wr_en = dp_data_wr_en;
            end SELECT_FRAMEBUFFER: begin
                framebuffer_port_b_address = dp_data_addr;
                framebuffer_port_b_wr_data = dp_data_wr_data;
                framebuffer_port_b_wr_en = dp_data_wr_en;
            end default: begin
                main_mem_port_b_address = '0;
                main_mem_port_b_wr_data = '0;
                main_mem_port_b_wr_en = '0;
            end
        endcase

        // Read arbitration
        dp_data_rd_data = '0;

        case (w_device_select)
            SELECT_MAIN_MEMORY: begin
                dp_data_rd_data = main_mem_port_b_rd_data;
            end SELECT_HEAP_MEMORY: begin
                dp_data_rd_data = heap_mem_port_b_rd_data;
            end SELECT_IO_REGISTERS: begin
                dp_data_rd_data = io_reg_port_b_rd_data;
            end SELECT_PALETTE: begin
                dp_data_rd_data = color_pal_port_b_rd_data;
            end SELECT_FRAMEBUFFER: begin
                dp_data_rd_data = framebuffer_port_b_rd_data;
            end default: begin
                dp_data_rd_data = '0;
            end
        endcase
    end

endmodule
