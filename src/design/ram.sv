// Copied from https://docs.amd.com/r/en-US/ug901-vivado-synthesis/Initializing-Block-RAM-From-an-External-Data-File-Verilog

module ram #(
    parameter INIT_FILE = "data/ram_init.mem",
    parameter WIDTH = 32,
    parameter DEPTH = 64,
    parameter ADDR_BITS = 6 // ceil(log2(DEPTH))
) (
    input wire write_clk,
    input wire read_clk,

    input wire write_enable,
    input wire [ADDR_BITS-1:0] write_addr,
    input wire [WIDTH-1:0] din,

    input wire read_enable,
    input wire [ADDR_BITS-1:0] read_addr,
    output logic [WIDTH-1:0] dout
);
    logic [WIDTH-1:0] ram [0:DEPTH-1];

    initial $readmemb(INIT_FILE, ram);

    always @(posedge write_clk) begin
        if (write_enable) ram[write_addr] <= din;
    end

    always @(posedge read_clk) begin
        if (read_enable) dout <= ram[read_addr];
    end
endmodule
