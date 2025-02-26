module fetch (
    input logic clk,
    input logic reset,
    
    input logic f_stall,

    input logic e_pc_src,
    input logic [31:0] e_pc_target,

    output logic [31:0] f_pc,
    output logic [31:0] f_pc_plus_4
);
    logic [31:0] f_pc_prime;
    always_comb begin
        f_pc_plus_4 = f_pc + 4;
        case (e_pc_src)
            1'b0: f_pc_prime = f_pc_plus_4;
            1'b1: f_pc_prime = e_pc_target;
            default: f_pc_prime = '0;
        endcase
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            f_pc <= '0;
        end else begin
            if (!f_stall) begin
                f_pc <= f_pc_prime;
            end
        end
    end

endmodule
