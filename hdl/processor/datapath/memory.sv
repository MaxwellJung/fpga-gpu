module Memory (
    input logic clk_i,
    input logic reset_i,

    input logic [31:0] alu_result_e_i,
    input logic [31:0] write_data_e_i,
    input logic [4:0] rd_e_i,
    input logic [31:0] pc_plus_4_e_i,

    input logic mem_write_m_i,

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
    DataCache data_cache (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .address_i(alu_result_m),
        .rd_data_o(read_data_m),
        .wr_data_i(write_data_m),
        .wr_en_i(mem_write_m_i)
    );

    always_comb begin
        alu_result_m_o = alu_result_m;
        read_data_m_o = read_data_m;
        rd_m_o = rd_m;
        pc_plus_4_m_o = pc_plus_4_m;
    end

endmodule