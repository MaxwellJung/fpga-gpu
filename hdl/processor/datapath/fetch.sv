module Fetch #(
    parameter INIT_FILE = "build/gputest.mem"
) (
    input logic clk,
    input logic reset,
    
    input logic stall_f,

    input logic pc_src_e,
    input logic [31:0] pc_target_e,

    output logic [31:0] instruction_f,
    output logic [31:0] pc_f,
    output logic [31:0] pc_plus_4_f
);
    logic [31:0] pc_f_prime;
    always_comb begin
        case (pc_src_e)
            1'b0: pc_f_prime = pc_plus_4_f;
            1'b1: pc_f_prime = pc_target_e;
            default: pc_f_prime = '0;
        endcase
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            pc_f <= '0;
        end else begin
            if (!stall_f) begin
                pc_f <= pc_f_prime;
            end
        end
    end
    assign pc_plus_4_f = pc_f + 4;

    InstructionCache #(
        .INIT_FILE(INIT_FILE)
    ) instruction_cache (
        .address(pc_f),
        .rd_data(instruction_f)
    );

endmodule