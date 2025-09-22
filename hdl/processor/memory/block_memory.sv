// Copied from https://docs.amd.com/r/en-US/ug901-vivado-synthesis/Initializing-Block-RAM-From-an-External-Data-File-Verilog
module block_memory #(
    parameter INIT_FILE = "",
    parameter CAPACITY_BYTES = 128,
    parameter WORD_BYTES = 4
) (
    // Port A
    input  logic                              port_a_clk,
    input  logic                              port_a_reset,
    input  logic [$clog2(CAPACITY_BYTES)-1:0] port_a_address,
    output logic [(8*WORD_BYTES)-1:0]         port_a_rd_data,
    input  logic                              port_a_rd_en,
    input  logic [(8*WORD_BYTES)-1:0]         port_a_wr_data,
    input  logic [WORD_BYTES-1:0]             port_a_wr_en,

    // Port B
    input  logic                              port_b_clk,
    input  logic                              port_b_reset,
    input  logic [$clog2(CAPACITY_BYTES)-1:0] port_b_address,
    output logic [(8*WORD_BYTES)-1:0]         port_b_rd_data,
    input  logic                              port_b_rd_en,
    input  logic [(8*WORD_BYTES)-1:0]         port_b_wr_data,
    input  logic [WORD_BYTES-1:0]             port_b_wr_en
);
    localparam WORD_COUNT = CAPACITY_BYTES/WORD_BYTES;
    logic [(8*WORD_BYTES)-1:0] bram [WORD_COUNT];
    initial $readmemh(INIT_FILE, bram);

    logic [$clog2(WORD_COUNT)-1:0] port_a_word_index, port_b_word_index;
    assign port_a_word_index = port_a_address[$clog2(CAPACITY_BYTES)-1:$clog2(WORD_BYTES)];
    assign port_b_word_index = port_b_address[$clog2(CAPACITY_BYTES)-1:$clog2(WORD_BYTES)];

    int i;
    always_ff @(posedge port_a_clk) begin
        if (port_a_reset)
            port_a_rd_data <= '0;
        else
            if (port_a_rd_en) begin
                port_a_rd_data <= bram[port_a_word_index];
            end
        
        for (i = 0; i < WORD_BYTES; i++) begin
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

        for (j = 0; j < WORD_BYTES; j++) begin
            if (port_b_wr_en[j]) begin
                bram[port_b_word_index][j*8 +: 8] <= port_b_wr_data[j*8 +: 8];
            end
        end
    end

endmodule
