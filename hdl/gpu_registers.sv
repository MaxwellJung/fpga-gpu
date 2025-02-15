// Copied from https://docs.amd.com/r/en-US/ug901-vivado-synthesis/Initializing-Block-RAM-From-an-External-Data-File-Verilog
module GpuRegisters #(
    parameter BYTES_PER_REG = 4,
    localparam WIDTH = 8*BYTES_PER_REG,
    parameter REG_COUNT = 32,
    localparam ADDR_BITS = $clog2(REG_COUNT*BYTES_PER_REG)
) (
    input logic clk_i,
    input logic rst_i,
    input logic en_i,

    input logic [ADDR_BITS-1:0] addr_i,

    output logic [WIDTH-1:0] dout_o,

    input logic [WIDTH-1:0] din_i,
    input logic [BYTES_PER_REG-1:0] we_i,

    output logic [WIDTH-1:0] gpu_cp_x_o,
    output logic [WIDTH-1:0] gpu_cp_y_o,
    output logic [WIDTH-1:0] gpu_index_o,
    output logic [WIDTH-1:0] gpu_reg_3_o
);
    logic [WIDTH-1:0] gpu_reg [REG_COUNT];
    logic [ADDR_BITS-$clog2(BYTES_PER_REG)-1:0] reg_addr;
    assign reg_addr = addr_i >> $clog2(BYTES_PER_REG);

    int i, j;
    always @(posedge clk_i) begin
        if (rst_i) begin
            for (i = 0; i < REG_COUNT; i++) begin
                gpu_reg[i] = '0;
            end
        end else if (en_i) begin
            for (j = 0; j < BYTES_PER_REG; j++) begin
                if (we_i[j]) begin
                    gpu_reg[reg_addr][j*8 +: 8] <= din_i[j*8 +: 8];
                end
            end
            dout_o <= gpu_reg[reg_addr];
        end
    end

    always_comb begin
        gpu_cp_x_o = gpu_reg[0];
        gpu_cp_y_o = gpu_reg[1];
        gpu_index_o = gpu_reg[2];
        gpu_reg_3_o = gpu_reg[3];
    end

endmodule
