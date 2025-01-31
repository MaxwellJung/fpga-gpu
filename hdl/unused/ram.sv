// Copied from https://docs.amd.com/r/en-US/ug901-vivado-synthesis/Initializing-Block-RAM-From-an-External-Data-File-Verilog

module Ram #(
    parameter INIT_FILE = "data/ram_init.mem",
    parameter WIDTH = 8,
    parameter ADDR_BITS = 8
) (
    input wire write_clk_i,
    input wire read_clk_i,
    
    input wire reset_i,

    input wire write_enable_i,
    input wire [ADDR_BITS-1:0] write_addr_i,
    input wire [WIDTH-1:0] write_data_i,

    input wire read_enable_i,
    input wire [ADDR_BITS-1:0] read_addr_i,
    output logic [WIDTH-1:0] read_data_o
);
    logic [WIDTH-1:0] ram [0:(1<<ADDR_BITS)-1];

    always @(posedge read_clk_i) begin
        if (reset_i) begin
            for (integer i = 0; i < (1<<ADDR_BITS); i++) begin
                ram[i] = 0;
            end
        end
    end

    initial $readmemb(INIT_FILE, ram);

    always @(posedge write_clk_i) begin
        if (write_enable_i) ram[write_addr_i] <= write_data_i;
    end

    always @(posedge read_clk_i) begin
        if (read_enable_i) read_data_o <= ram[read_addr_i];
    end
endmodule
