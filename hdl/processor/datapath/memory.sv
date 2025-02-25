module Memory (
    input logic clk_i,
    input logic reset_i,

    // input from previous pipeline
    input logic [31:0] alu_result_e_i,
    input logic [31:0] write_data_e_i,
    input logic [4:0] rd_e_i,
    input logic [31:0] pc_plus_4_e_i,

    // control
    input logic mem_write_m_i,

    // memory bus
    output logic [31:0] bus_addr_o,
    input logic [31:0] bus_rd_data_i,
    output logic [31:0] bus_wr_data_o,
    output logic bus_wr_en_o,

    // output to next pipeline
    output logic [31:0] alu_result_m_o,
    output logic [31:0] read_data_m_o,
    output logic [4:0] rd_m_o,
    output logic [31:0] pc_plus_4_m_o
);
    logic [31:0] alu_result_m;
    logic [31:0] write_data_m;
    logic [4:0] rd_m;
    logic [31:0] pc_plus_4_m;
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            {alu_result_m, write_data_m, rd_m, pc_plus_4_m} <= '0;
        end else begin
            {alu_result_m, write_data_m, rd_m, pc_plus_4_m} <= 
            {alu_result_e_i, write_data_e_i, rd_e_i, pc_plus_4_e_i};
        end
    end

    logic [31:0] read_data_m;
    always_comb begin
        bus_addr_o = alu_result_m;
        read_data_m = bus_rd_data_i;
        bus_wr_data_o = write_data_m;
        bus_wr_en_o = mem_write_m_i;
    end

    always_comb begin
        alu_result_m_o = alu_result_m;
        read_data_m_o = read_data_m;
        rd_m_o = rd_m;
        pc_plus_4_m_o = pc_plus_4_m;
    end

endmodule