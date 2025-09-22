// Converts AXI-Stream to BRAM memory interface

module axis_to_memory (
    // AXI-Stream
    input  logic        axis_clk,
    input  logic        axis_aresetn,

    input  logic [31:0] axis_tdata,
    input  logic [3:0]  axis_tkeep,
    input  logic        axis_tlast,
    input  logic        axis_tvalid,
    output logic        axis_tready,

    // Heap write start address
    input  logic [31:0] heap_wr_start_addr,

    // Heap memory BRAM port A
    output logic        heap_mem_port_a_clk,
    output logic [10:0] heap_mem_port_a_addr,
    output logic [31:0] heap_mem_port_a_wr_data,
    output logic [3:0]  heap_mem_port_a_wr_en
);

    typedef enum logic {
        START_WRITE,
        WRITING
    } state_t;

    state_t state, next_state;

    always_ff @(posedge axis_clk or negedge axis_aresetn) begin
        if (!axis_aresetn) begin
            state <= START_WRITE;
        end else begin
            state <= next_state;
        end
    end

    always_comb begin
        next_state = state;
        case (state)
            START_WRITE : begin
                if (axis_tvalid)
                    next_state = WRITING;
                else
                    next_state = state;
            end WRITING : begin
                if (axis_tvalid && axis_tlast)
                    next_state = START_WRITE;
                else
                    next_state = state;
            end default : next_state = state;
        endcase
    end

    always_ff @(posedge axis_clk or negedge axis_aresetn) begin
        if (!axis_aresetn) begin
            heap_mem_port_a_addr <= '0;
            heap_mem_port_a_wr_data <= '0;
            heap_mem_port_a_wr_en <= '0;
        end else begin
            if (axis_tvalid) begin
                if (state == START_WRITE) begin
                    heap_mem_port_a_addr <= heap_wr_start_addr;
                end else if (state == WRITING) begin
                    heap_mem_port_a_addr <= heap_mem_port_a_addr + 4;
                end
                heap_mem_port_a_wr_data <= axis_tdata;
                heap_mem_port_a_wr_en <= axis_tkeep;
            end else begin
                heap_mem_port_a_addr <= '0;
                heap_mem_port_a_wr_data <= '0;
                heap_mem_port_a_wr_en <= '0;
            end
        end
    end

    always_ff @(posedge axis_clk or negedge axis_aresetn) begin
        if (!axis_aresetn) begin
            axis_tready <= 0;
        end else begin
            axis_tready <= 1;
        end
    end

    always_comb begin
        heap_mem_port_a_clk = axis_clk;
    end

endmodule
