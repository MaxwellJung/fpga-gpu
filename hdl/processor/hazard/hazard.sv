module Hazard(
    // input from datapath
    input logic [4:0] rs1_d_i,
    input logic [4:0] rs2_d_i,
    input logic [4:0] rs1_e_i,
    input logic [4:0] rs2_e_i,
    input logic [4:0] rd_e_i,
    input logic [4:0] rd_m_i,
    input logic [4:0] rd_w_i,

    // input from control
    input logic pc_src_e_i,
    input logic [1:0] result_src_e_i,
    input logic reg_write_m_i,
    input logic reg_write_w_i,

    // output to datapath
    output logic stall_f_o,
    output logic stall_d_o,
    output logic flush_d_o,
    output logic flush_e_o,
    output logic [1:0] forward_a_e_o,
    output logic [1:0] forward_b_e_o
);

    logic [1:0] forward_a_e;
    always_comb begin
        if (((rd_m_i == rs1_e_i) && reg_write_m_i) && (rs1_e_i != 0))
            forward_a_e = 2'b10; // Forward from Memory stage
        else if (((rd_w_i == rs1_e_i) && reg_write_m_i) && (rs1_e_i != 0))
            forward_a_e = 2'b01; // Forward from Writeback stage
        else
            forward_a_e = 2'b00; // No forwarding (use RF output)
    end

    logic [1:0] forward_b_e;
    always_comb begin
        if (((rd_m_i == rs2_e_i) && reg_write_m_i) && (rs2_e_i != 0))
            forward_b_e = 2'b10; // Forward from Memory stage
        else if (((rd_w_i == rs2_e_i) && reg_write_m_i) && (rs2_e_i != 0))
            forward_b_e = 2'b01; // Forward from Writeback stage
        else
            forward_b_e = 2'b00; // No forwarding (use RF output)
    end

    logic lw_stall;
    logic stall_f, stall_d, flush_d, flush_e;
    always_comb begin
        lw_stall = result_src_e_i[0] & ((rs1_d_i == rd_e_i) || (rs2_d_i == rd_e_i));
        stall_f = lw_stall;
        stall_d = lw_stall;
        flush_e = lw_stall;

        flush_d = pc_src_e_i;
        flush_e = lw_stall || pc_src_e_i;
    end

    always_comb begin
        stall_f_o = stall_f;
        stall_d_o = stall_d;
        flush_d_o = flush_d;
        flush_e_o = flush_e;
        forward_a_e_o = forward_a_e;
        forward_b_e_o = forward_b_e;
    end

endmodule