// Converts AXI-Stream to BRAM memory interface

module axis_to_memory (
    // AXI-Stream
    input  logic        axis_clk,
    input  logic        axis_aresetn,

    input  logic [31:0] axis_tdata,
    input  logic [0:0]  axis_tkeep,
    input  logic        axis_tlast,
    input  logic        axis_tvalid,
    output logic        axis_tready,

    // Heap memory BRAM port A
    output logic        heap_mem_port_a_clk,
    output logic [10:0] heap_mem_port_a_addr,
    output logic [31:0] heap_mem_port_a_wr_data,
    output logic [3:0]  heap_mem_port_a_wr_en
);

    always_comb begin
        heap_mem_port_a_clk = axis_clk;
        heap_mem_port_a_addr = '0;
        heap_mem_port_a_wr_data = '0;
        heap_mem_port_a_wr_en = '0;
    end

endmodule
