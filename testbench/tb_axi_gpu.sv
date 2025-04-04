`timescale 1ns / 1ps
`include "axi_vip_mst_stimulus.sv"

module tb_gpu();

  GpuTest DUT();
  
  axi_vip_mst_stimulus mst();
  initial begin
    #(5*(1/60)*1000000000); // simulate 5 frames (1/60) seconds
  end 

endmodule