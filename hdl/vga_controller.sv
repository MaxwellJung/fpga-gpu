module vga_controller #(
    parameter H_VIS_AREA_PXL    = 800,
    parameter H_FRONT_PORCH_PXL = 40,
    parameter H_SYNC_PULSE_PXL  = 128,
    parameter H_BACK_PORCH_PXL  = 88,

    parameter V_VIS_AREA_PXL    = 600,
    parameter V_FRONT_PORCH_PXL = 1,
    parameter V_SYNC_PULSE_PXL  = 4,
    parameter V_BACK_PORCH_PXL  = 23,

    parameter DOWNSCALE         = 2,

    localparam H_PXL_COUNT = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL,
    localparam V_PXL_COUNT = V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL,
    localparam PIXEL_COUNT = (H_VIS_AREA_PXL/DOWNSCALE)*(V_VIS_AREA_PXL/DOWNSCALE)
) (
    input logic                            clk,
    input logic                            reset,

    output logic [$clog2(PIXEL_COUNT)-1:0] pixel_index,
    output logic                           pixel_index_valid,

    output logic                           h_sync,
    output logic                           v_sync
);

    logic [$clog2(H_PXL_COUNT)-1:0] h_pxl_index;

    counter #(
        .MAX_VAL(H_PXL_COUNT-1)
    ) counter_inst_0 (
        .clk     (clk),
        .reset   (reset),
        .enable  (1'b1),
        .count   (h_pxl_index)
    );

    logic [$clog2(V_PXL_COUNT)-1:0] v_pxl_index;
    counter #(
        .MAX_VAL(V_PXL_COUNT-1)
    ) counter_inst_1 (
        .clk     (clk),
        .reset   (reset),
        .enable  (h_pxl_index >= H_PXL_COUNT-1),
        .count   (v_pxl_index)
    );

    always_ff @(posedge clk) begin
        if (reset) begin
            h_sync      <= 0;
            v_sync      <= 0;

            pixel_index       <= 0;
            pixel_index_valid <= 0;
        end else begin
            h_sync <= !(((H_VIS_AREA_PXL + H_FRONT_PORCH_PXL) <= h_pxl_index) 
                     && (h_pxl_index < (H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL)));
            v_sync <= !(((V_VIS_AREA_PXL + V_FRONT_PORCH_PXL) <= v_pxl_index) 
                     && (v_pxl_index < (V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL)));

            pixel_index       <= (H_VIS_AREA_PXL >> $clog2(DOWNSCALE))*(v_pxl_index >> $clog2(DOWNSCALE)) + (h_pxl_index >> $clog2(DOWNSCALE));
            pixel_index_valid <= (h_pxl_index < H_VIS_AREA_PXL) && (v_pxl_index < V_VIS_AREA_PXL);
        end
    end

endmodule
