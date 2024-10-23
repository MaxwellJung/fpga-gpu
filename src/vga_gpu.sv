module vga_gpu #(
    parameter WIDTH = 1920; // ignore for now
    parameter HEIGHT = 1080; // ignore for now
    parameter REFRESH_RATE = 60; // ignore for now
) (
    input logic clk,
    input logic rst,

    output logic red,
    output logic green,
    output logic blue,

    output logic hsync,
    output logic vsync
);
    
endmodule