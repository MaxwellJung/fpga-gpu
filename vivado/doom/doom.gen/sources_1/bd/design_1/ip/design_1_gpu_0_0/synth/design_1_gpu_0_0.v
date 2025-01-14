// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:gpu:1.0
// IP Revision: 1

(* X_CORE_INFO = "gpu,Vivado 2024.2" *)
(* CHECK_LICENSE_TYPE = "design_1_gpu_0_0,gpu,{}" *)
(* CORE_GENERATION_INFO = "design_1_gpu_0_0,gpu,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=gpu,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,H_VIS_AREA_PXL=800,H_FRONT_PORCH_PXL=40,H_SYNC_PULSE_PXL=128,H_BACK_PORCH_PXL=88,H_NUM_BITS=11,V_VIS_AREA_PXL=600,V_FRONT_PORCH_PXL=1,V_SYNC_PULSE_PXL=4,V_BACK_PORCH_PXL=23,V_NUM_BITS=10,DOWNSCALE_FACTOR=2,BRAM_ADDR_BITS=32,BRAM_DATA_BITS=32}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_gpu_0_0 (
  gpu_clk_i,
  reset_i,
  bram_clk_o,
  bram_rst_o,
  bram_en_o,
  bram_addr_o,
  bram_dout_i,
  bram_din_o,
  bram_we_o,
  vga_clk_i,
  VGA_R_o,
  VGA_G_o,
  VGA_B_o,
  VGA_HS_o,
  VGA_VS_o
);

input wire gpu_clk_i;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_i RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset_i, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
input wire reset_i;
output wire bram_clk_o;
output wire bram_rst_o;
output wire bram_en_o;
output wire [31 : 0] bram_addr_o;
input wire [31 : 0] bram_dout_i;
output wire [31 : 0] bram_din_o;
output wire [3 : 0] bram_we_o;
input wire vga_clk_i;
output wire [3 : 0] VGA_R_o;
output wire [3 : 0] VGA_G_o;
output wire [3 : 0] VGA_B_o;
output wire VGA_HS_o;
output wire VGA_VS_o;

  gpu #(
    .H_VIS_AREA_PXL(800),
    .H_FRONT_PORCH_PXL(40),
    .H_SYNC_PULSE_PXL(128),
    .H_BACK_PORCH_PXL(88),
    .H_NUM_BITS(11),
    .V_VIS_AREA_PXL(600),
    .V_FRONT_PORCH_PXL(1),
    .V_SYNC_PULSE_PXL(4),
    .V_BACK_PORCH_PXL(23),
    .V_NUM_BITS(10),
    .DOWNSCALE_FACTOR(2),
    .BRAM_ADDR_BITS(32),
    .BRAM_DATA_BITS(32)
  ) inst (
    .gpu_clk_i(gpu_clk_i),
    .reset_i(reset_i),
    .bram_clk_o(bram_clk_o),
    .bram_rst_o(bram_rst_o),
    .bram_en_o(bram_en_o),
    .bram_addr_o(bram_addr_o),
    .bram_dout_i(bram_dout_i),
    .bram_din_o(bram_din_o),
    .bram_we_o(bram_we_o),
    .vga_clk_i(vga_clk_i),
    .VGA_R_o(VGA_R_o),
    .VGA_G_o(VGA_G_o),
    .VGA_B_o(VGA_B_o),
    .VGA_HS_o(VGA_HS_o),
    .VGA_VS_o(VGA_VS_o)
  );
endmodule
