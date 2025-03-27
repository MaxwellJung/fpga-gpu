module Hazard(
    // input from datapath
    input logic [4:0] d_rs1,
    input logic [4:0] d_rs2,
    input logic [4:0] e_rs1,
    input logic [4:0] e_rs2,
    input logic [4:0] e_rd,
    input logic [4:0] m_rd,
    input logic [4:0] w_rd,

    // input from control
    input logic e_pc_src,
    input result_src_t e_result_src,
    input logic m_reg_write,
    input logic w_reg_write,

    // output to datapath
    output logic f_stall,
    output logic d_stall,
    output logic d_flush,
    output logic e_flush,
    output logic [1:0] e_forward_a,
    output logic [1:0] e_forward_b
);

    always_comb begin
        if (((m_rd == e_rs1) && m_reg_write) && (e_rs1 != 0))
            e_forward_a = 2'b10; // Forward from Memory stage
        else if (((w_rd == e_rs1) && w_reg_write) && (e_rs1 != 0))
            e_forward_a = 2'b01; // Forward from Writeback stage
        else
            e_forward_a = 2'b00; // No forwarding (use RF output)
    end

    always_comb begin
        if (((m_rd == e_rs2) && m_reg_write) && (e_rs2 != 0))
            e_forward_b = 2'b10; // Forward from Memory stage
        else if (((w_rd == e_rs2) && w_reg_write) && (e_rs2 != 0))
            e_forward_b = 2'b01; // Forward from Writeback stage
        else
            e_forward_b = 2'b00; // No forwarding (use RF output)
    end

    logic lw_stall;
    always_comb begin
        lw_stall = (e_result_src == RESULT_SRC_MEMORY) & ((d_rs1 == e_rd) || (d_rs2 == e_rd));
        f_stall = lw_stall;
        d_stall = lw_stall;

        d_flush = e_pc_src;
        e_flush = lw_stall || e_pc_src;
    end

endmodule