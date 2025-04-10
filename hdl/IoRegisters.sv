module IoRegisters #(
    parameter CORE_COUNT = 4,
    parameter BYTES_PER_WORD = 4,
    parameter COMMAND_COUNT = 4,
    parameter BYTES_PER_COMMAND = 12,
    localparam CAPACITY_BYTES = (4+4+4+BYTES_PER_COMMAND*COMMAND_COUNT),
    localparam WORD_BITS = BYTES_PER_WORD*8
) (
    // CPU side
    input logic cpu_clk,
    input logic cpu_reset,
    input logic [$clog2(CAPACITY_BYTES)-1:0] cpu_address,
    output logic [WORD_BITS-1:0] cpu_rd_data,
    input logic cpu_rd_en,
    input logic [WORD_BITS-1:0] cpu_wr_data,
    input logic [BYTES_PER_WORD-1:0] cpu_wr_en,

    // GPU side
    input logic gpu_clk,
    input logic gpu_reset,
    input logic [CORE_COUNT-1:0][$clog2(CAPACITY_BYTES)-1:0] gpu_address,
    output logic [CORE_COUNT-1:0][WORD_BITS-1:0] gpu_rd_data,
    input logic [CORE_COUNT-1:0][WORD_BITS-1:0] gpu_wr_data,
    input logic [CORE_COUNT-1:0][BYTES_PER_WORD-1:0] gpu_wr_en
);
    logic port_a_reset;
    logic [$clog2(CAPACITY_BYTES)-1:0] port_a_address, port_a_address_aligned;
    logic [CORE_COUNT-1:0][WORD_BITS-1:0] port_a_rd_data;
    logic port_a_rd_en;
    logic [CORE_COUNT-1:0][WORD_BITS-1:0] port_a_wr_data;
    logic [BYTES_PER_WORD-1:0] port_a_wr_en;
    logic [CORE_COUNT-1:0] gpu_busy;

    always_ff @(posedge cpu_clk) begin
        port_a_reset <= cpu_reset;
        port_a_address <= cpu_address;
        port_a_wr_en <= cpu_wr_en;
        port_a_address_aligned <= port_a_address;
        port_a_rd_en <= cpu_rd_en;
        case (port_a_address_aligned)
            0, 1, 2, 3: cpu_rd_data <= {port_a_rd_data[0][WORD_BITS-1:1], |gpu_busy};
            default: cpu_rd_data <= port_a_rd_data[0];
        endcase
    end

    generate genvar i;
        for (i = 0; i < CORE_COUNT; i=i+1) begin
            always_ff @(posedge cpu_clk) begin
                case (cpu_address)
                    0, 1, 2, 3: port_a_wr_data[i] <= i;
                    default: port_a_wr_data[i] <= cpu_wr_data;
                endcase
            end

            assign gpu_busy[i] = port_a_rd_data[i][0];

            BlockMemory #(
                .INIT_FILE         ("./data/zero.mem"),
                .CAPACITY_BYTES    (CAPACITY_BYTES),
                .BYTES_PER_WORD    (4)
            ) u_BlockMemory (
                // Port A
                .port_a_clk        (cpu_clk),
                .port_a_reset      (port_a_reset),
                .port_a_address    (port_a_address),
                .port_a_rd_data    (port_a_rd_data[i]),
                .port_a_rd_en      (port_a_rd_en),
                .port_a_wr_data    (port_a_wr_data[i]),
                .port_a_wr_en      (port_a_wr_en),
                // Port B
                .port_b_clk        (gpu_clk),
                .port_b_reset      (gpu_reset),
                .port_b_address    (gpu_address[i]),
                .port_b_rd_data    (gpu_rd_data[i]),
                .port_b_rd_en      ('1),
                .port_b_wr_data    (gpu_wr_data[i]),
                .port_b_wr_en      (gpu_wr_en[i])
            );
        end
    endgenerate

endmodule
