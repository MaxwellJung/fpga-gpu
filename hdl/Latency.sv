// latency.v
// Adds {LENGTH} clock cycles of latency between {in} and {out}
// Implemented as shift register (chain of flip flops)
module Latency #(
    parameter LENGTH = 5, // number of desired latency (in units of clock cycles)
    parameter WIDTH = 8 // width of input/output data
) (
    input  wire clk,
    input  wire reset,

    input  wire [WIDTH-1:0] in,
    output wire [WIDTH-1:0] out
);
    reg [WIDTH-1:0] ff_chain [LENGTH-1:0];
    integer i;
    
    always @(posedge clk) begin
        if(reset) begin
            for (i = 0; i < LENGTH; i=i+1) begin
                ff_chain[i] <= {WIDTH {1'b0}};
            end
        end else begin
            ff_chain[0] <= in;
            for (i = 1; i < LENGTH; i=i+1) begin
                ff_chain[i] <= ff_chain[i-1];
            end
        end
    end

    assign out = ff_chain[LENGTH-1];

endmodule
