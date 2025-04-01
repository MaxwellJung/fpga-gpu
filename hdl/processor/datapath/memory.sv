`include "./hdl/processor/defines.svh"

module Memory #(
    parameter RESOLUTION_X = 400,
    parameter RESOLUTION_Y = 300,
    parameter PALETTE_LENGTH = 256
) (
    input logic clk,
    input logic reset,

    // input from previous pipeline
    input logic [31:0] e_alu_result,
    input logic [31:0] e_write_data,
    input logic [4:0] e_rd,
    input logic [31:0] e_pc_plus_4,

    // control
    input mem_size_t m_mem_size,
    input logic m_mem_write,
    input logic m_fb_write,

    // data bus
    output logic [31:0] dbus_addr,
    output logic [31:0] dbus_wr_data,
    output logic [3:0] dbus_wr_en,

    // framebuffer
    output logic fb_wr_en,
    output logic [$clog2(RESOLUTION_X)-1:0] fb_wr_pxl_x,
    output logic [$clog2(RESOLUTION_Y)-1:0] fb_wr_pxl_y,
    output logic [$clog2(PALETTE_LENGTH)-1:0] fb_wr_pxl_value,

    // output to next pipeline
    output logic [31:0] m_alu_result,
    output logic [4:0] m_rd,
    output logic [31:0] m_pc_plus_4
);
    logic [31:0] m_write_data;
    always_ff @(posedge clk) begin
        if (reset) begin
            {m_alu_result, m_write_data, m_rd, m_pc_plus_4} <= '0;
        end else begin
            {m_alu_result, m_write_data, m_rd, m_pc_plus_4} <= 
            {e_alu_result, e_write_data, e_rd, e_pc_plus_4};
        end
    end

    always_comb begin
        dbus_addr = m_alu_result;
        dbus_wr_data = m_write_data << (8*dbus_addr[1:0]);
        case (m_mem_size)
            MEM_SIZE_WORD: dbus_wr_en = {4{m_mem_write}};
            MEM_SIZE_HALF: dbus_wr_en = {2'b0, {2{m_mem_write}}} << {dbus_addr[1], 1'b0};
            MEM_SIZE_BYTE: dbus_wr_en = {3'b0, {1{m_mem_write}}} << dbus_addr[1:0];
            default: dbus_wr_en = {4{m_mem_write}};
        endcase
    end

    always_comb begin
        fb_wr_en = m_fb_write;
        fb_wr_pxl_x = m_alu_result[15:0];
        fb_wr_pxl_y = m_alu_result[31:16];
        fb_wr_pxl_value = m_write_data;
    end

endmodule