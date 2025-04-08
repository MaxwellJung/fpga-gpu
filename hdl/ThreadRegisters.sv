module ThreadRegisters #(
    parameter THREAD_ID = 0,
    parameter BYTES_PER_WORD = 4,
    parameter COMMAND_COUNT = 4,
    parameter BYTES_PER_COMMAND = 12,
    localparam CAPACITY_BYTES = (4+4+4+BYTES_PER_COMMAND*COMMAND_COUNT),
    localparam WORD_BITS = BYTES_PER_WORD*8,
    localparam WORD_COUNT = CAPACITY_BYTES/BYTES_PER_WORD
) (
    // CPU side
    input logic port_a_clk,
    input logic [$clog2(CAPACITY_BYTES)-1:0] port_a_address,
    input logic [WORD_BITS-1:0] port_a_wr_data,
    input logic [BYTES_PER_WORD-1:0] port_a_wr_en,

    // I/O register values
    output logic [WORD_BITS-1:0] thread_id,
    output logic [WORD_BITS-1:0] status,
    output logic [WORD_BITS-1:0] control,
    output logic [COMMAND_COUNT-1:0][3*WORD_BITS-1:0] command_list,

    // GPU side
    input logic port_b_clk,
    input logic port_b_reset,
    input logic [$clog2(CAPACITY_BYTES)-1:0] port_b_address,
    output logic [WORD_BITS-1:0] port_b_rd_data,
    input logic port_b_rd_en,
    input logic [WORD_BITS-1:0] port_b_wr_data,
    input logic [BYTES_PER_WORD-1:0] port_b_wr_en
);
    // verilator lint_off MULTIDRIVEN
    logic [WORD_BITS-1:0] word_bank [WORD_COUNT-1:0];
    // verilator lint_on MULTIDRIVEN
    assign thread_id = word_bank[0];
    assign status = word_bank[1];
    assign control = word_bank[2];
    // assign command_list = word_bank[WORD_COUNT-1:3];
    assign command_list = '0;


    logic [$clog2(WORD_COUNT)-1:0] port_a_word_index, port_b_word_index;
    assign port_a_word_index = port_a_address[$clog2(CAPACITY_BYTES)-1:$clog2(BYTES_PER_WORD)];
    assign port_b_word_index = port_b_address[$clog2(CAPACITY_BYTES)-1:$clog2(BYTES_PER_WORD)];

    int i;
    always_ff @(posedge port_a_clk) begin
        for (i = 0; i < BYTES_PER_WORD; i++) begin
            if (port_a_wr_en[i]) begin
                if (port_a_word_index != 0)
                    word_bank[port_a_word_index][i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
            end
        end
    end

    int j;
    always_ff @(posedge port_b_clk) begin
        if (port_b_reset) begin
            port_b_rd_data <= '0;
            word_bank[0] <= THREAD_ID;
        end
        else
            if (port_b_rd_en)
                port_b_rd_data <= word_bank[port_b_word_index];

        for (j = 0; j < BYTES_PER_WORD; j++) begin
            if (port_b_wr_en[j]) begin
                if (port_b_word_index != 0)
                    word_bank[port_b_word_index][j*8 +: 8] <= port_b_wr_data[j*8 +: 8];
            end
        end
    end

endmodule
