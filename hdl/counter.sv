module Counter #(
    parameter NUM_BITS = 8
) (
    input logic clk,
    input logic reset,
    input logic enable,

    output logic [NUM_BITS-1:0] count
);

    always_ff @(posedge clk) begin
        if (reset) begin
            count <= 0;
        end else if (enable) begin
            count <= count + 1;
        end
    end

endmodule
