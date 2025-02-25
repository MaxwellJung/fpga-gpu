module Hazard(
    // input from datapath
    input logic [4:0] rs1_d,
    input logic [4:0] rs2_d,
    input logic [4:0] rs1_e,
    input logic [4:0] rs2_e,
    input logic [4:0] rd_e,
    input logic [4:0] rd_m,
    input logic [4:0] rd_w,

    // input from control
    input logic pc_src_e,
    input logic [1:0] result_src_e,
    input logic reg_write_m,
    input logic reg_write_w,

    // output to datapath
    output logic stall_f,
    output logic stall_d,
    output logic flush_d,
    output logic flush_e,
    output logic [1:0] forward_a_e,
    output logic [1:0] forward_b_e
);

    always_comb begin
        if (((rd_m == rs1_e) && reg_write_m) && (rs1_e != 0))
            forward_a_e = 2'b10; // Forward from Memory stage
        else if (((rd_w == rs1_e) && reg_write_w) && (rs1_e != 0))
            forward_a_e = 2'b01; // Forward from Writeback stage
        else
            forward_a_e = 2'b00; // No forwarding (use RF output)
    end

    always_comb begin
        if (((rd_m == rs2_e) && reg_write_m) && (rs2_e != 0))
            forward_b_e = 2'b10; // Forward from Memory stage
        else if (((rd_w == rs2_e) && reg_write_w) && (rs2_e != 0))
            forward_b_e = 2'b01; // Forward from Writeback stage
        else
            forward_b_e = 2'b00; // No forwarding (use RF output)
    end

    logic lw_stall;
    always_comb begin
        lw_stall = result_src_e[0] & ((rs1_d == rd_e) || (rs2_d == rd_e));
        stall_f = lw_stall;
        stall_d = lw_stall;

        flush_d = pc_src_e;
        flush_e = lw_stall || pc_src_e;
    end

endmodule