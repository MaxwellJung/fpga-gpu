module VideoController #(
    parameter H_VIS_AREA_PXL = 800,
    parameter H_FRONT_PORCH_PXL = 40,
    parameter H_SYNC_PULSE_PXL = 128,
    parameter H_BACK_PORCH_PXL = 88,

    parameter V_VIS_AREA_PXL =  600,
    parameter V_FRONT_PORCH_PXL =  1,
    parameter V_SYNC_PULSE_PXL =  4,
    parameter V_BACK_PORCH_PXL =  23,

    parameter SYNC_LATENCY = 1, // latency between video controller requesting pixel to palette outputting pixel

    localparam H_WHOLE_LINE_PXL = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL,
    localparam V_WHOLE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL,

    parameter RED_BITS = 4,
    parameter GREEN_BITS = 4,
    parameter BLUE_BITS = 4,
    parameter ALPHA_BITS = 4,
    localparam COLOR_BITS = RED_BITS + GREEN_BITS + BLUE_BITS + ALPHA_BITS
) (
    input logic clk,
    input logic reset,

    output logic [$clog2(H_VIS_AREA_PXL)-1:0] fb_rd_x,
    output logic [$clog2(V_VIS_AREA_PXL)-1:0] fb_rd_y,
    input logic [COLOR_BITS-1:0] color,

    output logic vga_hs,
    output logic vga_vs,

    output logic [RED_BITS-1:0] vga_r,
    output logic [GREEN_BITS-1:0] vga_g,
    output logic [BLUE_BITS-1:0] vga_b
);
    logic [$clog2(H_WHOLE_LINE_PXL)-1:0] h_pxl_count;
    logic [$clog2(V_WHOLE_FRAME_PXL)-1:0] v_pxl_count;
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
        .clk(clk),
        .reset(reset),

        .h_pxl_count(h_pxl_count),
        .v_pxl_count(v_pxl_count),

        .h_sync(vga_hs),
        .v_sync(vga_vs),

        .h_visible(h_visible),
        .v_visible(v_visible)
    );

    always_ff @(posedge clk) begin
        if (reset) begin
            fb_rd_x <= '0;
            fb_rd_y <= '0;
        end else begin
            fb_rd_x <= (h_pxl_count < H_VIS_AREA_PXL) ? h_pxl_count>>1 : 0;
            fb_rd_y <= (v_pxl_count < V_VIS_AREA_PXL) ? ((V_VIS_AREA_PXL-1) - v_pxl_count)>>1 : 0;
        end
    end

    assign {vga_r, vga_g, vga_b} = (h_visible & v_visible) ? color[COLOR_BITS-1:ALPHA_BITS] : '0;

endmodule