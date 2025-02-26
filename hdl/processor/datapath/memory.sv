module Memory (
    input logic clk,
    input logic reset,

    // input from previous pipeline
    input logic [31:0] e_alu_result,
    input logic [31:0] e_write_data,
    input logic [4:0] e_rd,
    input logic [31:0] e_pc_plus_4,

    // control
    input logic m_mem_write,

    // data bus
    output logic [31:0] dbus_addr,
    output logic [31:0] dbus_wr_data,
    output logic dbus_wr_en,

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
        dbus_wr_data = m_write_data;
        dbus_wr_en = m_mem_write;
    end

endmodule