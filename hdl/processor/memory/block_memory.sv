// Copied from https://docs.amd.com/r/en-US/ug901-vivado-synthesis/Initializing-Block-RAM-From-an-External-Data-File-Verilog
module BlockMemory #(
    parameter INIT_FILE = "",
    parameter CAPACITY_BYTES = 128,
    parameter BYTES_PER_WORD = 4,
    localparam WORD_BITS = BYTES_PER_WORD*8,
    localparam WORD_COUNT = CAPACITY_BYTES/BYTES_PER_WORD,
    localparam ADDR_BITS = $clog2(CAPACITY_BYTES)
) (
    // Port A
    input logic port_a_clk,
    input logic port_a_reset,
    input logic [ADDR_BITS-1:0] port_a_address,
    output logic [WORD_BITS-1:0] port_a_rd_data,
    input logic port_a_rd_en,
    input logic [WORD_BITS-1:0] port_a_wr_data,
    input logic [BYTES_PER_WORD-1:0] port_a_wr_en,

    // Port B
    input logic port_b_clk,
    input logic port_b_reset,
    input logic [ADDR_BITS-1:0] port_b_address,
    output logic [WORD_BITS-1:0] port_b_rd_data,
    input logic port_b_rd_en,
    input logic [WORD_BITS-1:0] port_b_wr_data,
    input logic [BYTES_PER_WORD-1:0] port_b_wr_en
);
    logic [WORD_BITS-1:0] bram [WORD_COUNT];
    initial $readmemh(INIT_FILE, bram);

    logic [$clog2(WORD_COUNT)-1:0] port_a_word_index, port_b_word_index;
    assign port_a_word_index = port_a_address[ADDR_BITS-1:$clog2(BYTES_PER_WORD)];
    assign port_b_word_index = port_b_address[ADDR_BITS-1:$clog2(BYTES_PER_WORD)];

    int i;
    always_ff @(posedge port_a_clk) begin
        if (port_a_reset)
            port_a_rd_data <= '0;
        else
            if (port_a_rd_en) begin
                port_a_rd_data <= bram[port_a_word_index];
            end
        
        for (i = 0; i < BYTES_PER_WORD; i++) begin
            if (port_a_wr_en[i]) begin
                bram[port_a_word_index][i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
            end
        end
    end

    int j;
    always_ff @(posedge port_b_clk) begin
        if (port_b_reset)
            port_b_rd_data <= '0;
        else
            if (port_b_rd_en)
                port_b_rd_data <= bram[port_b_word_index];

        for (j = 0; j < BYTES_PER_WORD; j++) begin
            if (port_b_wr_en[j]) begin
                bram[port_b_word_index][j*8 +: 8] <= port_b_wr_data[j*8 +: 8];
            end
        end
    end

endmodule
