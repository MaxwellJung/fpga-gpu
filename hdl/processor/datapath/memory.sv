module Memory (
    input logic clk,
    input logic reset,

    // input from previous pipeline
    input logic [31:0] alu_result_e,
    input logic [31:0] write_data_e,
    input logic [4:0] rd_e,
    input logic [31:0] pc_plus_4_e,

    // control
    input logic mem_write_m,

    // memory bus
    output logic [31:0] bus_addr,
    input logic [31:0] bus_rd_data,
    output logic [31:0] bus_wr_data,
    output logic bus_wr_en,

    // output to next pipeline
    output logic [31:0] alu_result_m,
    output logic [31:0] read_data_m,
    output logic [4:0] rd_m,
    output logic [31:0] pc_plus_4_m
);
    logic [31:0] write_data_m;
    always_ff @(posedge clk) begin
        if (reset) begin
            {alu_result_m, write_data_m, rd_m, pc_plus_4_m} <= '0;
        end else begin
            {alu_result_m, write_data_m, rd_m, pc_plus_4_m} <= 
            {alu_result_e, write_data_e, rd_e, pc_plus_4_e};
        end
    end

    always_comb begin
        bus_addr = alu_result_m;
        read_data_m = bus_rd_data;
        bus_wr_data = write_data_m;
        bus_wr_en = mem_write_m;
    end

endmodule