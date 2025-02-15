module GpuController #(
    parameter H_VIS_AREA_PXL = 800,
    parameter H_FRONT_PORCH_PXL = 40,
    parameter H_SYNC_PULSE_PXL = 128,
    parameter H_BACK_PORCH_PXL = 88,
    localparam H_WHOLE_LINE_PXL = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL,

    parameter V_VIS_AREA_PXL =  600,
    parameter V_FRONT_PORCH_PXL =  1,
    parameter V_SYNC_PULSE_PXL =  4,
    parameter V_BACK_PORCH_PXL =  23,
    localparam V_WHOLE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL,

    parameter SYNC_LATENCY = 2, // 1 latency from FIFO read + 1 latency from palette read

    parameter DOWNSCALE_FACTOR = 2,

    parameter PALETTE_LENGTH = 256,
    parameter COLOR_BITS = 12,
    
    parameter BRAM_ADDR_BITS = 32,
    parameter BRAM_DATA_BITS = 32
) (
    input logic gpu_clk_i,
    input logic vga_clk_i,
    input logic reset_i,

    input logic [31:0] instruction_i,

    output logic bram_clk_o,
    output logic bram_rst_o,
    output logic bram_en_o,
    output logic [BRAM_ADDR_BITS-1:0] bram_addr_o,
    input logic [BRAM_DATA_BITS-1:0] bram_dout_i,
    output logic [BRAM_DATA_BITS-1:0] bram_din_o,
    output logic [BRAM_DATA_BITS/8-1:0] bram_we_o,

    output logic pxl_fifo_reset_o,

    output logic pxl_fifo_wr_clk_o,
    output logic pxl_fifo_wr_en_o,
    output logic [$clog2(PALETTE_LENGTH)-1:0] pxl_fifo_write_data_o,
    input logic pxl_fifo_prog_full_i,
    input logic pxl_fifo_almost_full_i,
    input logic pxl_fifo_full_i,

    output logic pxl_fifo_rd_clk_o,
    output logic pxl_fifo_rd_en_o,
    input logic [$clog2(PALETTE_LENGTH)-1:0] pxl_fifo_read_data_i,
    input logic pxl_fifo_prog_empty_i,
    input logic pxl_fifo_almost_empty_i,
    input logic pxl_fifo_empty_i,

    output logic [COLOR_BITS-1:0] VGA_RGB,
    output logic VGA_HS,
    output logic VGA_VS
);
    localparam PALETTE_BASE_ADDR = 0;
    localparam BYTES_PER_COLOR = 2;
    localparam RESOLUTION_X = H_VIS_AREA_PXL/DOWNSCALE_FACTOR;
    localparam RESOLUTION_Y = V_VIS_AREA_PXL/DOWNSCALE_FACTOR;
    /*
     bram address map
     -------------------------------------------------
     | adress range   | content       | size (bytes) |
     | 0x0   ~ 0x1FE  | palette_0     | 256*2        |
     | 0x200 ~ 0x1D6BF| framebuffer_0 | 400*300      |
     -------------------------------------------------
    */
    localparam PALETTE_SIZE = PALETTE_LENGTH*BYTES_PER_COLOR;
    localparam FRAMEBUFFER_BASE_ADDR = PALETTE_SIZE;

    logic [$clog2(RESOLUTION_X*RESOLUTION_Y)-1:0] pxl_index;
    logic [$clog2(PALETTE_LENGTH):0] palette_index;

    logic h_visible, v_visible, frame_end;
    VgaTimingGenerator #(
        .H_VIS_AREA_PXL(H_VIS_AREA_PXL),
        .H_FRONT_PORCH_PXL(H_FRONT_PORCH_PXL),
        .H_SYNC_PULSE_PXL(H_SYNC_PULSE_PXL),
        .H_BACK_PORCH_PXL(H_BACK_PORCH_PXL),
        
        .V_VIS_AREA_PXL(V_VIS_AREA_PXL),
        .V_FRONT_PORCH_PXL(V_FRONT_PORCH_PXL),
        .V_SYNC_PULSE_PXL(V_SYNC_PULSE_PXL),
        .V_BACK_PORCH_PXL(V_BACK_PORCH_PXL),

        .SYNC_LATENCY(SYNC_LATENCY)
    ) vga_timing_generator_0 (
        .clk_i(vga_clk_i),
        .reset_i(reset_i),

        .h_sync_o(VGA_HS),
        .v_sync_o(VGA_VS),

        .h_visible_o(h_visible),
        .v_visible_o(v_visible),

        .frame_end_o(frame_end)
    );

    typedef enum logic [1:0] {IDLE, RD_FB, RD_PT} bram_rd_statet;
    bram_rd_statet state, next_state;

    always_ff@(posedge gpu_clk_i) begin
        if(reset_i)
            state <= IDLE;
        else
            state <= next_state;
    end

    always_comb begin
        case(state)
            IDLE: begin
                if (palette_index < PALETTE_LENGTH) begin
                    next_state = RD_PT;
                end else if (!pxl_fifo_prog_full_i && pxl_fifo_prog_empty_i) begin
                    if (pxl_index < RESOLUTION_X*RESOLUTION_Y) begin
                        next_state = RD_FB;
                    end else begin
                        next_state = IDLE;
                    end
                end else begin
                    next_state = IDLE;
                end
            end RD_FB: begin
                if (pxl_fifo_prog_full_i) begin
                    // FIFO is almost full
                    if (palette_index < PALETTE_LENGTH) begin
                        next_state = RD_PT;
                    end else begin
                        next_state = IDLE;
                    end
                end else if (pxl_index >= RESOLUTION_X*RESOLUTION_Y) begin
                    // done reading framebuffer
                    if (palette_index < PALETTE_LENGTH) begin
                        next_state = RD_PT;
                    end else begin
                        next_state = IDLE;
                    end
                end else begin
                    next_state = RD_FB;
                end
            end RD_PT: begin
                if (!pxl_fifo_prog_full_i && pxl_fifo_prog_empty_i) begin
                    if (pxl_index < RESOLUTION_X*RESOLUTION_Y) begin
                        next_state = RD_FB;
                    end else if (palette_index < PALETTE_LENGTH) begin
                        next_state = RD_PT;
                    end else begin
                        next_state = IDLE;
                    end
                end else if (palette_index >= PALETTE_LENGTH) begin
                    next_state = IDLE;
                end else begin
                    next_state = RD_PT;
                end
            end default: begin
                next_state = IDLE;
            end
        endcase
    end

    logic [$clog2(DOWNSCALE_FACTOR)-1:0] h_dup_cnt, v_dup_cnt;
    logic [$clog2(RESOLUTION_X)-1:0] x_index;
    always_ff @(posedge gpu_clk_i) begin
       if (reset_i || frame_end) begin
           h_dup_cnt <= '0;
           v_dup_cnt <= '0;
           x_index <= '0;
           pxl_index <= '0;
       end else if (state == RD_FB) begin
           // proceed to next pixel
           if (h_dup_cnt < DOWNSCALE_FACTOR - 1) begin
               h_dup_cnt <= h_dup_cnt + 1;
           end else begin
               h_dup_cnt <= '0;
           end

           if (x_index >= RESOLUTION_X - 1 && (h_dup_cnt >= DOWNSCALE_FACTOR - 1)) begin
               if (v_dup_cnt < DOWNSCALE_FACTOR - 1) begin
                   v_dup_cnt <= v_dup_cnt + 1;
               end else begin
                   v_dup_cnt <= '0;
               end
           end else begin
               v_dup_cnt <= v_dup_cnt;
           end

           if (h_dup_cnt >= DOWNSCALE_FACTOR - 1) begin
               if (x_index >= RESOLUTION_X - 1) begin
                   x_index <= '0;
               end else begin
                   x_index <= x_index + 1;
               end
           end

           if (h_dup_cnt >= DOWNSCALE_FACTOR - 1) begin
               if (x_index >= RESOLUTION_X - 1) begin
                   if (v_dup_cnt < DOWNSCALE_FACTOR - 1) begin
                       pxl_index <= pxl_index + 1 - RESOLUTION_X;
                   end else begin
                       pxl_index <= pxl_index + 1;
                   end
               end else begin
                   pxl_index <= pxl_index + 1;
               end
           end
       end
   end

    assign bram_clk_o = gpu_clk_i;
    assign bram_rst_o = reset_i;
    assign bram_we_o = '0;
    assign bram_din_o = '0;

    logic [BRAM_ADDR_BITS-1:0] fb_addr, palette_addr;
    assign fb_addr = FRAMEBUFFER_BASE_ADDR + pxl_index;
    assign palette_addr = PALETTE_BASE_ADDR + BYTES_PER_COLOR*palette_index;
    always_comb begin
        case(state)
            IDLE: begin
                bram_en_o = '0;
                bram_addr_o = '0;
            end RD_FB: begin
                bram_en_o = '1;
                bram_addr_o = fb_addr;
            end RD_PT: begin 
                bram_en_o = '1;
                bram_addr_o = palette_addr;
            end default: begin
                bram_en_o = '0;
                bram_addr_o = '0;
            end
        endcase
    end

    assign pxl_fifo_reset_o = reset_i || frame_end;
    assign pxl_fifo_wr_clk_o = gpu_clk_i;
    logic pxl_fifo_wr_en;
    logic [BRAM_ADDR_BITS-1:0] fb_addr_synced;
    always_ff @(posedge gpu_clk_i) begin
        if (pxl_fifo_reset_o) begin
            pxl_fifo_wr_en = '0;
            fb_addr_synced = '0;
        end else begin
            pxl_fifo_wr_en = (state == RD_FB) ? bram_en_o : '0;
            fb_addr_synced = (state == RD_FB) ? bram_addr_o : '0;
        end
    end
    assign pxl_fifo_wr_en_o = pxl_fifo_wr_en;
    assign pxl_fifo_write_data_o = (pxl_fifo_wr_en) ? bram_dout_i[8*(fb_addr_synced[1:0])+:8] : '0;
    // assign pxl_fifo_write_data_o = (pxl_fifo_wr_en) ? fb_addr_synced - FRAMEBUFFER_BASE_ADDR : '0; // for testing

    assign pxl_fifo_rd_clk_o = vga_clk_i;
    assign pxl_fifo_rd_en_o = h_visible && v_visible;

    always_ff @(posedge gpu_clk_i) begin
        if (reset_i || frame_end) begin
            palette_index <= '0;
        end else if (state == RD_PT) begin
            palette_index <= (palette_index < PALETTE_LENGTH) ? palette_index + 1 : palette_index;
        end
    end

    logic palette_wr_en;
    logic [$clog2(PALETTE_LENGTH)-1:0] palette_wr_index;
    logic [COLOR_BITS-1:0] palette_wr_color;
    logic [BRAM_ADDR_BITS-1:0] pt_addr_synced;
    logic [$clog2(PALETTE_LENGTH)-1:0] palette_index_synced;
    always_ff @(posedge gpu_clk_i) begin
        if (reset_i) begin
            palette_wr_en = '0;
            pt_addr_synced = '0;
            palette_index_synced = '0;
        end else begin
            palette_wr_en = (state == RD_PT) ? bram_en_o : '0;
            pt_addr_synced = (state == RD_PT) ? bram_addr_o : '0;
            palette_index_synced = palette_index;
        end
    end
    assign palette_wr_index = (palette_wr_en) ? palette_index_synced : '0;
    assign palette_wr_color = (palette_wr_en) ? bram_dout_i[8*(pt_addr_synced[1:0])+:16] : '0;

    logic palette_rd_en;
    always_ff @(posedge vga_clk_i) begin
        if (reset_i) begin
            palette_rd_en = '0;
        end else begin
            palette_rd_en = pxl_fifo_rd_en_o;
        end
    end

    Palette #(
        .PALETTE_LENGTH(PALETTE_LENGTH),
        .COLOR_BITS(COLOR_BITS)
    ) palette_0 (
        .reset_i(reset_i),

        .rd_clk_i(vga_clk_i),
        .rd_en_i(palette_rd_en),
        .rd_index_i(pxl_fifo_read_data_i),
        .rd_color_o(VGA_RGB),

        .wr_clk_i(gpu_clk_i),
        .wr_en_i(palette_wr_en),
        .wr_index_i(palette_wr_index),
        .wr_color_i(palette_wr_color)
    );
endmodule