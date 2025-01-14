// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module design_1 (
  ddr2_sdram_dq,
  ddr2_sdram_dqs_p,
  ddr2_sdram_dqs_n,
  ddr2_sdram_addr,
  ddr2_sdram_ba,
  ddr2_sdram_ras_n,
  ddr2_sdram_cas_n,
  ddr2_sdram_we_n,
  ddr2_sdram_ck_p,
  ddr2_sdram_ck_n,
  ddr2_sdram_cke,
  ddr2_sdram_cs_n,
  ddr2_sdram_dm,
  ddr2_sdram_odt,
  usb_uart_rxd,
  usb_uart_txd,
  led_16bits_tri_o,
  rgb_led_tri_o,
  dip_switches_16bits_tri_i,
  push_buttons_5bits_tri_i,
  CLK100MHZ,
  CPU_RESETN,
  SD_DAT0,
  SD_CMD,
  SD_DAT3,
  SD_SCK,
  SD_RESET,
  VGA_R,
  VGA_G,
  VGA_B,
  VGA_HS,
  VGA_VS
);

  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DQ" *)
  (* X_INTERFACE_MODE = "master ddr2_sdram" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr2_sdram, CAN_DEBUG false, TIMEPERIOD_PS 1250, MEMORY_TYPE COMPONENTS, DATA_WIDTH 8, CS_ENABLED true, DATA_MASK_ENABLED true, SLOT Single, MEM_ADDR_MAP ROW_COLUMN_BANK, BURST_LENGTH 8, AXI_ARBITRATION_SCHEME TDM, CAS_LATENCY 11, CAS_WRITE_LATENCY 11" *)
  inout [15:0]ddr2_sdram_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DQS_P" *)
  inout [1:0]ddr2_sdram_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DQS_N" *)
  inout [1:0]ddr2_sdram_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram ADDR" *)
  output [12:0]ddr2_sdram_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram BA" *)
  output [2:0]ddr2_sdram_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram RAS_N" *)
  output ddr2_sdram_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CAS_N" *)
  output ddr2_sdram_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram WE_N" *)
  output ddr2_sdram_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CK_P" *)
  output [0:0]ddr2_sdram_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CK_N" *)
  output [0:0]ddr2_sdram_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CKE" *)
  output [0:0]ddr2_sdram_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CS_N" *)
  output [0:0]ddr2_sdram_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DM" *)
  output [1:0]ddr2_sdram_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram ODT" *)
  output [0:0]ddr2_sdram_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart RxD" *)
  (* X_INTERFACE_MODE = "master usb_uart" *)
  input usb_uart_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart TxD" *)
  output usb_uart_txd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 led_16bits TRI_O" *)
  (* X_INTERFACE_MODE = "master led_16bits" *)
  output [15:0]led_16bits_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 rgb_led TRI_O" *)
  (* X_INTERFACE_MODE = "master rgb_led" *)
  output [5:0]rgb_led_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 dip_switches_16bits TRI_I" *)
  (* X_INTERFACE_MODE = "master dip_switches_16bits" *)
  input [15:0]dip_switches_16bits_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 push_buttons_5bits TRI_I" *)
  (* X_INTERFACE_MODE = "master push_buttons_5bits" *)
  input [4:0]push_buttons_5bits_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK100MHZ CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK100MHZ" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK100MHZ, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_CLK100MHZ, INSERT_VIP 0" *)
  input CLK100MHZ;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.CPU_RESETN RST" *)
  (* X_INTERFACE_MODE = "slave RST.CPU_RESETN" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.CPU_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input CPU_RESETN;
  (* X_INTERFACE_IGNORE = "true" *)
  input SD_DAT0;
  (* X_INTERFACE_IGNORE = "true" *)
  output SD_CMD;
  (* X_INTERFACE_IGNORE = "true" *)
  output SD_DAT3;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SD_SCK CLK" *)
  (* X_INTERFACE_MODE = "master CLK.SD_SCK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SD_SCK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_micro_sd_0_0_sd_clk, INSERT_VIP 0" *)
  output SD_SCK;
  (* X_INTERFACE_IGNORE = "true" *)
  output SD_RESET;
  (* X_INTERFACE_IGNORE = "true" *)
  output [3:0]VGA_R;
  (* X_INTERFACE_IGNORE = "true" *)
  output [3:0]VGA_G;
  (* X_INTERFACE_IGNORE = "true" *)
  output [3:0]VGA_B;
  (* X_INTERFACE_IGNORE = "true" *)
  output VGA_HS;
  (* X_INTERFACE_IGNORE = "true" *)
  output VGA_VS;

  // stub module has no contents

endmodule
