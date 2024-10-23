module counter #(
    parameters NUM_BITS = 10;
) (
    input logic clk,
    input logic rst,
    input logic enable,

    output logic [NUM_BITS-1:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
        end else if (enable) begin
            count <= count + 1;
        end
    end

endmodule
