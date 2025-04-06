module IoRegisters #(
    parameter CORE_COUNT = 4,
    parameter BYTES_PER_WORD = 4,
    parameter COMMAND_COUNT = 4,
    parameter BYTES_PER_COMMAND = 12,
    localparam CAPACITY_BYTES = (4+4+4+BYTES_PER_COMMAND*COMMAND_COUNT),
    localparam WORD_BITS = BYTES_PER_WORD*8,
    localparam WORD_COUNT = CAPACITY_BYTES/BYTES_PER_WORD
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
    logic [CORE_COUNT-1:0][WORD_BITS-1:0] thread_id;
    logic [CORE_COUNT-1:0][WORD_BITS-1:0] thread_status;
    logic [CORE_COUNT-1:0][WORD_BITS-1:0] thread_control;
    logic [CORE_COUNT-1:0][COMMAND_COUNT-1:0][3*WORD_BITS-1:0] thread_command_list;

    generate genvar i;
        for (i = 0; i < CORE_COUNT; i=i+1) begin
            ThreadRegisters #(
                .THREAD_ID            (i),
                .BYTES_PER_WORD       (4),
                .COMMAND_COUNT        (COMMAND_COUNT),
                .BYTES_PER_COMMAND    (12)
            ) u_ThreadRegisters (
                // CPU side
                .port_a_clk           (cpu_clk),
                .port_a_address       (cpu_address),
                .port_a_wr_data       (cpu_wr_data),
                .port_a_wr_en         (cpu_wr_en),
                // I/O register values
                .thread_id            (thread_id[i]),
                .status               (thread_status[i]),
                .control              (thread_control[i]),
                .command_list         (thread_command_list[i]),
                // GPU side
                .port_b_clk           (gpu_clk),
                .port_b_reset         (gpu_reset),
                .port_b_address       (gpu_address[i]),
                .port_b_rd_data       (gpu_rd_data[i]),
                .port_b_rd_en         ('1),
                .port_b_wr_data       (gpu_wr_data[i]),
                .port_b_wr_en         (gpu_wr_en[i])
            );
        end
    endgenerate

    logic [WORD_BITS-1:0] gpu_id;
    logic [CORE_COUNT-1:0] gpu_busy;
    logic [WORD_BITS-1:0] gpu_status;
    logic [WORD_BITS-1:0] gpu_control;
    logic [COMMAND_COUNT-1:0][3*WORD_BITS-1:0] gpu_command_list;

    generate begin
        for (genvar j = 0; j < CORE_COUNT; j=j+1) begin : gen_gpu_busy
            assign gpu_busy[j] = thread_status[j][0];
        end
    end endgenerate

    always_comb begin
        gpu_id = CORE_COUNT;
        gpu_status = {thread_status[0][WORD_BITS-1:1], |gpu_busy};
        gpu_control = thread_control[0];
        gpu_command_list = thread_command_list[0];
    end

    logic [WORD_COUNT-1:0][WORD_BITS-1:0] word_bank;

    always_ff @(posedge gpu_clk) begin
        if (gpu_reset) begin
            word_bank <= '0;
        end
        else begin
            word_bank <= {gpu_command_list, gpu_control, gpu_status, gpu_id};
        end
    end

    logic [$clog2(WORD_COUNT)-1:0] cpu_word_index;
    assign cpu_word_index = cpu_address[$clog2(CAPACITY_BYTES)-1:$clog2(BYTES_PER_WORD)];

    always_ff @(posedge cpu_clk) begin
        if (cpu_reset) begin
            cpu_rd_data <= '0;
        end
        else
            if (cpu_rd_en)
                cpu_rd_data <= word_bank[cpu_word_index];
    end

endmodule
