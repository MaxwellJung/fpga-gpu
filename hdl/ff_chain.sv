// ff_chain.v
// Adds {LENGTH} clock cycles of latency between {in} and {out}
// Implemented as chain of flip flops
module ff_chain #(
    parameter LENGTH = 5, // number of desired latency (in clock cycles)
    parameter WIDTH = 8 // width of data
) (
    input  wire clk,
    input  wire reset,

    input  wire [WIDTH-1:0] in,
    output wire [WIDTH-1:0] out
);
    logic [WIDTH-1:0] pipe [LENGTH-1:0];
    integer i;
    
    always @(posedge clk) begin
        if(reset) begin
            for (i = 0; i < LENGTH; i=i+1) begin
                pipe[i] <= '0;
            end
        end else begin
            for (i=1; i<LENGTH; i=i+1) begin
                pipe[i] <= pipe[i-1];
            end
            pipe[0] <= in;
        end
    end

    assign out = pipe[LENGTH-1];

endmodule