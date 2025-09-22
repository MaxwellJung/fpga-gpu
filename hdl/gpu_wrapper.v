module gpu_wrapper #(
    parameter MEM_INIT_FILE  = "build/firmware/gputest.mem",
    parameter HEAP_INIT_FILE = "data/gpu_heap_init.mem"
) (
    input wire gpu_clk,
    input wire reset,

    // host IO interface
    input  wire        io_reg_port_a_clk,
    input  wire        io_reg_port_a_reset,
    input  wire [11:0] io_reg_port_a_addr,
    output wire [31:0] io_reg_port_a_rd_data,
    input  wire [31:0] io_reg_port_a_rd_en,
    input  wire [31:0] io_reg_port_a_wr_data,
    input  wire [3:0]  io_reg_port_a_wr_en,

    // AXI-Stream host data interface
    input  wire        axis_clk,
    input  wire        axis_aresetn,

    input  wire [31:0] axis_tdata,
    input  wire [0:0]  axis_tkeep,
    input  wire        axis_tlast,
    input  wire        axis_tvalid,
    output wire        axis_tready,

    // video interface
    input  wire       vga_clk,
    output wire       vga_hs,
    output wire       vga_vs,
    output wire [3:0] vga_r,
    output wire [3:0] vga_g,
    output wire [3:0] vga_b
);
    gpu #(
        .MEM_INIT_FILE           (MEM_INIT_FILE),
        .HEAP_INIT_FILE          (HEAP_INIT_FILE)
    ) gpu_inst_0 (
        .gpu_clk                 (gpu_clk),
        .reset                   (reset),

        // Interface to CPU
        // IO registers interface
        .io_reg_port_a_clk       (io_reg_port_a_clk),
        .io_reg_port_a_reset     (io_reg_port_a_reset),
        .io_reg_port_a_addr      (io_reg_port_a_addr),
        .io_reg_port_a_rd_data   (io_reg_port_a_rd_data),
        .io_reg_port_a_rd_en     (io_reg_port_a_rd_en),
        .io_reg_port_a_wr_data   (io_reg_port_a_wr_data),
        .io_reg_port_a_wr_en     (io_reg_port_a_wr_en),

        // AXI-Stream interface to data memory
        .axis_clk               (axis_clk),
        .axis_aresetn           (axis_aresetn),

        .axis_tdata             (axis_tdata),
        .axis_tkeep             (axis_tkeep),
        .axis_tlast             (axis_tlast),
        .axis_tvalid            (axis_tvalid),
        .axis_tready            (axis_tready),

        // vga interface
        .vga_clk (vga_clk),
        .vga_hs  (vga_hs),
        .vga_vs  (vga_vs),
        .vga_r   (vga_r),
        .vga_g   (vga_g),
        .vga_b   (vga_b)
    );

endmodule
