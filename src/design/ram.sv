// Copied from https://docs.amd.com/r/en-US/ug901-vivado-synthesis/Initializing-Block-RAM-From-an-External-Data-File-Verilog

module ram #(
    parameter INIT_FILE = "data/ram_init.mem",
    parameter WIDTH = 32,
    parameter DEPTH = 64,
    parameter ADDR_BITS = 6 // ceil(log2(DEPTH))
) (
    input wire clk,
    input wire we,
    input wire [ADDR_BITS-1:0] addr,
    input wire [WIDTH-1:0] din,
    output logic [WIDTH-1:0] dout
);
    logic [WIDTH-1:0] ram [0:DEPTH-1];

    initial $readmemb(INIT_FILE, ram);

    always @(posedge clk) begin
        if (we) ram[addr] <= din;
        dout <= ram[addr];
    end
endmodule
