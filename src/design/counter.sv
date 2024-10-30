module counter #(
    parameter NUM_BITS = 8
) (
    input logic clk,
    input logic resetn,
    input logic enable,

    output logic [NUM_BITS-1:0] count
);

    always @(posedge clk) begin
        if (!resetn) begin
            count <= 0;
        end else if (enable) begin
            count <= count + 1;
        end
    end

endmodule
