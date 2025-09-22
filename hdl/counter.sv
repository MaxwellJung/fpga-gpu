module counter #(
    parameter MAX_VAL = 8'hFF
) (
    input logic clk,
    input logic reset,
    input logic enable,

    output logic [$clog2(MAX_VAL+1)-1:0] count
);

    always_ff @(posedge clk) begin
        if (reset) begin
            count <= 0;
        end else if (enable) begin
            if (count < MAX_VAL)
                count <= count + 1;
            else
                count <= 0;
        end
    end

endmodule
