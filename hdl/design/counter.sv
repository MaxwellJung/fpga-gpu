module Counter #(
    parameter NUM_BITS = 8
) (
    input logic clk_i,
    input logic reset_i,
    input logic enable_i,

    output logic [NUM_BITS-1:0] count_o
);

    always @(posedge clk_i) begin
        if (reset_i) begin
            count_o <= 0;
        end else if (enable_i) begin
            count_o <= count_o + 1;
        end
    end

endmodule
