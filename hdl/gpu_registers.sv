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

    input logic [31:0] gpu_status_i,
    output logic [31:0] gpu_control_o
);
    logic [31:0] gpu_status; // address 0x0 - write only
    logic [31:0] gpu_control; // address 0x4 - read/write
    logic [ADDR_BITS-$clog2(BYTES_PER_REG)-1:0] reg_addr;
    assign reg_addr = addr_i >> $clog2(BYTES_PER_REG);

    int byte_i;
    always @(posedge clk_i) begin
        if (rst_i) begin
            gpu_control <= '0;
        end else if (en_i) begin
            // read
            case (reg_addr)
                0: dout_o <= gpu_status;
                1: dout_o <= gpu_control;
                default: dout_o <= '0;
            endcase

            // write
            for (byte_i = 0; byte_i < BYTES_PER_REG; byte_i++) begin
                if (we_i[byte_i]) begin
                    case (reg_addr)
                        0: ;
                        1: gpu_control[byte_i*8 +: 8] <= din_i[byte_i*8 +: 8];
                        default: ;
                    endcase
                end
            end
        end
    end

    always @(posedge clk_i) begin
        gpu_status <= gpu_status_i;
    end

    always_comb begin
        gpu_control_o = gpu_control;
    end

endmodule
