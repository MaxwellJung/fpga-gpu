module Fetch (
    input logic clk_i,
    input logic reset_i,
    
    input logic stall_f_i,

    input logic pc_src_e_i,
    input logic [31:0] pc_target_e_i,

    output logic [31:0] instruction_f_o,
    output logic [31:0] pc_f_o,
    output logic [31:0] pc_plus_4_f_o
);
    logic [31:0] pc_f_prime;
    logic [31:0] pc_plus_4_f;
    always_comb begin
        case (pc_src_e_i)
            1'b0: pc_f_prime = pc_plus_4_f;
            1'b1: pc_f_prime = pc_target_e_i;
            default: pc_f_prime = '0;
        endcase
    end

    logic [31:0] pc_f;
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            pc_f <= '0;
        end else begin
            if (!stall_f_i) begin
                pc_f <= pc_f_prime;
            end
        end
    end
    assign pc_plus_4_f = pc_f + 4;

    logic [31:0] instruction_f;
    InstructionCache instruction_cache (
        .address_i(pc_f),
        .rd_data_o(instruction_f)
    );

    assign instruction_f_o = instruction_f;
    assign pc_f_o = pc_f;
    assign pc_plus_4_f_o = pc_plus_4_f;

endmodule