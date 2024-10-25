module counter #(
    parameter NUM_BITS = 8
) (
    input logic clk,
    input logic aresetn,
    input logic enable,

    output logic [NUM_BITS-1:0] count
);

    always @(posedge clk or negedge aresetn) begin
        if (!aresetn) begin
            count <= 0;
        end else if (enable) begin
            count <= count + 1;
        end
    end

endmodule
