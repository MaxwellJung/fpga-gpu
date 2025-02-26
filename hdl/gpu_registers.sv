// Copied from https://docs.amd.com/r/en-US/ug901-vivado-synthesis/Initializing-Block-RAM-From-an-External-Data-File-Verilog
module GpuRegisters #(
    parameter BYTES_PER_REG = 4,
    localparam WIDTH = 8*BYTES_PER_REG,
    parameter REG_COUNT = 32,
    localparam ADDR_BITS = $clog2(REG_COUNT*BYTES_PER_REG)
) (
    input logic clk,
    input logic rst,

    input logic en,
    input logic [ADDR_BITS-1:0] addr,
    output logic [WIDTH-1:0] dout,
    input logic [WIDTH-1:0] din,
    input logic [BYTES_PER_REG-1:0] we,

    // address 0x0 - write only
    input logic [31:0] gpu_status,
    // address 0x4 - read/write
    output logic [31:0] gpu_control
);
    logic [ADDR_BITS-$clog2(BYTES_PER_REG)-1:0] reg_addr;
    assign reg_addr = addr >> $clog2(BYTES_PER_REG);

    int i;
    always @(posedge clk) begin
        if (rst) begin
            gpu_control <= '0;
        end else if (en) begin
            // read
            case (reg_addr)
                0: dout <= gpu_status;
                1: dout <= gpu_control;
                default: dout <= '0;
            endcase

            // write
            for (i = 0; i < BYTES_PER_REG; i++) begin
                if (we[i]) begin
                    case (reg_addr)
                        0: ;
                        1: gpu_control[i*8 +: 8] <= din[i*8 +: 8];
                        default: ;
                    endcase
                end
            end
        end
    end

endmodule
