module vga_gpu_top #(
    parameter H_VIS_AREA_PXL = 1920,
    parameter H_FRONT_PORCH_PXL = 88,
    parameter H_SYNC_PULSE_PXL = 44,
    parameter H_BACK_PORCH_PXL = 148,
    parameter H_NUM_BITS = 12, // ceil(log2(H_WHOLE_LINE_PXL))

    parameter V_VIS_AREA_PXL =  1080,
    parameter V_FRONT_PORCH_PXL =  4,
    parameter V_SYNC_PULSE_PXL =  5,
    parameter V_BACK_PORCH_PXL =  36,
    parameter V_NUM_BITS = 11, // ceil(log2(V_WHOE_FRAME_PXL))

    parameter CHANNEL_BITS = 4,
    parameter CHANNEL_COUNT = 4
) (
    input wire clk,
    input wire resetn,

    output wire [CHANNEL_BITS-1:0] VGA_R,
    output wire [CHANNEL_BITS-1:0] VGA_G,
    output wire [CHANNEL_BITS-1:0] VGA_B,

    output wire VGA_HS,
    output wire VGA_VS,

    input wire [CHANNEL_COUNT*CHANNEL_BITS-1:0] SW
);

    vga_gpu #(
        .H_VIS_AREA_PXL(H_VIS_AREA_PXL),
        .H_FRONT_PORCH_PXL(H_FRONT_PORCH_PXL),
        .H_SYNC_PULSE_PXL(H_SYNC_PULSE_PXL),
        .H_BACK_PORCH_PXL(H_BACK_PORCH_PXL),
        .H_NUM_BITS(H_NUM_BITS),

        .V_VIS_AREA_PXL(V_VIS_AREA_PXL),
        .V_FRONT_PORCH_PXL(V_FRONT_PORCH_PXL),
        .V_SYNC_PULSE_PXL(V_SYNC_PULSE_PXL),
        .V_BACK_PORCH_PXL(V_BACK_PORCH_PXL),
        .V_NUM_BITS(V_NUM_BITS),

        .CHANNEL_BITS(CHANNEL_BITS)
    ) gpu0 (
        .clk(clk),
        .resetn(resetn),

        .red(VGA_R),
        .green(VGA_G),
        .blue(VGA_B),

        .h_sync(VGA_HS),
        .v_sync(VGA_VS),

        .color(SW)
    );

endmodule
