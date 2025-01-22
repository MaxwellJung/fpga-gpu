//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Tue Jan 21 22:46:44 2025
//Host        : mint-ssd running 64-bit Linux Mint 21.1
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=45,numReposBlks=29,numNonXlnxBlks=0,numHierBlks=16,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=11,da_board_cnt=2,da_bram_cntlr_cnt=2,da_clkrst_cnt=12,da_microblaze_riscv_cnt=3,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (CLK100MHZ,
    CPU_RESETN,
    SD_CMD,
    SD_DAT0,
    SD_DAT3,
    SD_RESET,
    SD_SCK,
    VGA_B,
    VGA_G,
    VGA_HS,
    VGA_R,
    VGA_VS,
    ddr2_sdram_addr,
    ddr2_sdram_ba,
    ddr2_sdram_cas_n,
    ddr2_sdram_ck_n,
    ddr2_sdram_ck_p,
    ddr2_sdram_cke,
    ddr2_sdram_cs_n,
    ddr2_sdram_dm,
    ddr2_sdram_dq,
    ddr2_sdram_dqs_n,
    ddr2_sdram_dqs_p,
    ddr2_sdram_odt,
    ddr2_sdram_ras_n,
    ddr2_sdram_we_n,
    dip_switches_16bits_tri_i,
    led_16bits_tri_o,
    push_buttons_5bits_tri_i,
    rgb_led_tri_o,
    usb_uart_rxd,
    usb_uart_txd);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK100MHZ, CLK_DOMAIN design_1_CLK100MHZ, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input CLK100MHZ;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.CPU_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.CPU_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input CPU_RESETN;
  output SD_CMD;
  input SD_DAT0;
  output SD_DAT3;
  output SD_RESET;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SD_SCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SD_SCK, CLK_DOMAIN design_1_micro_sd_0_0_sd_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output SD_SCK;
  output [3:0]VGA_B;
  output [3:0]VGA_G;
  output VGA_HS;
  output [3:0]VGA_R;
  output VGA_VS;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram ADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr2_sdram, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) output [12:0]ddr2_sdram_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram BA" *) output [2:0]ddr2_sdram_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CAS_N" *) output ddr2_sdram_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CK_N" *) output [0:0]ddr2_sdram_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CK_P" *) output [0:0]ddr2_sdram_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CKE" *) output [0:0]ddr2_sdram_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram CS_N" *) output [0:0]ddr2_sdram_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DM" *) output [1:0]ddr2_sdram_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DQ" *) inout [15:0]ddr2_sdram_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DQS_N" *) inout [1:0]ddr2_sdram_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram DQS_P" *) inout [1:0]ddr2_sdram_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram ODT" *) output [0:0]ddr2_sdram_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram RAS_N" *) output ddr2_sdram_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2_sdram WE_N" *) output ddr2_sdram_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 dip_switches_16bits TRI_I" *) (* X_INTERFACE_MODE = "Master" *) input [15:0]dip_switches_16bits_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 led_16bits TRI_O" *) (* X_INTERFACE_MODE = "Master" *) output [15:0]led_16bits_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 push_buttons_5bits TRI_I" *) (* X_INTERFACE_MODE = "Master" *) input [4:0]push_buttons_5bits_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 rgb_led TRI_O" *) (* X_INTERFACE_MODE = "Master" *) output [5:0]rgb_led_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart RxD" *) (* X_INTERFACE_MODE = "Master" *) input usb_uart_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart TxD" *) output usb_uart_txd;

  wire CLK100MHZ;
  wire CPU_RESETN;
  wire SD_CMD;
  wire SD_DAT0;
  wire SD_DAT3;
  wire SD_RESET;
  wire SD_SCK;
  wire [3:0]VGA_B;
  wire [3:0]VGA_G;
  wire VGA_HS;
  wire [3:0]VGA_R;
  wire VGA_VS;
  wire axi_gpio_1_ip2intc_irpt;
  wire axi_timer_0_interrupt;
  wire clk_wiz_0_clk_out2;
  wire clk_wiz_0_locked;
  wire clk_wiz_0_vga_clk;
  wire [12:0]ddr2_sdram_addr;
  wire [2:0]ddr2_sdram_ba;
  wire ddr2_sdram_cas_n;
  wire [0:0]ddr2_sdram_ck_n;
  wire [0:0]ddr2_sdram_ck_p;
  wire [0:0]ddr2_sdram_cke;
  wire [0:0]ddr2_sdram_cs_n;
  wire [1:0]ddr2_sdram_dm;
  wire [15:0]ddr2_sdram_dq;
  wire [1:0]ddr2_sdram_dqs_n;
  wire [1:0]ddr2_sdram_dqs_p;
  wire [0:0]ddr2_sdram_odt;
  wire ddr2_sdram_ras_n;
  wire ddr2_sdram_we_n;
  wire [15:0]dip_switches_16bits_tri_i;
  wire gpu_clk_i_1;
  wire [15:0]led_16bits_tri_o;
  wire mdm_1_debug_sys_rst;
  wire microblaze_riscv_0_Clk;
  wire [31:0]microblaze_riscv_0_M_AXI_DC_ARADDR;
  wire [1:0]microblaze_riscv_0_M_AXI_DC_ARBURST;
  wire [3:0]microblaze_riscv_0_M_AXI_DC_ARCACHE;
  wire [7:0]microblaze_riscv_0_M_AXI_DC_ARLEN;
  wire microblaze_riscv_0_M_AXI_DC_ARLOCK;
  wire [2:0]microblaze_riscv_0_M_AXI_DC_ARPROT;
  wire [3:0]microblaze_riscv_0_M_AXI_DC_ARQOS;
  wire microblaze_riscv_0_M_AXI_DC_ARREADY;
  wire [2:0]microblaze_riscv_0_M_AXI_DC_ARSIZE;
  wire microblaze_riscv_0_M_AXI_DC_ARVALID;
  wire [31:0]microblaze_riscv_0_M_AXI_DC_AWADDR;
  wire [1:0]microblaze_riscv_0_M_AXI_DC_AWBURST;
  wire [3:0]microblaze_riscv_0_M_AXI_DC_AWCACHE;
  wire [7:0]microblaze_riscv_0_M_AXI_DC_AWLEN;
  wire microblaze_riscv_0_M_AXI_DC_AWLOCK;
  wire [2:0]microblaze_riscv_0_M_AXI_DC_AWPROT;
  wire [3:0]microblaze_riscv_0_M_AXI_DC_AWQOS;
  wire microblaze_riscv_0_M_AXI_DC_AWREADY;
  wire [2:0]microblaze_riscv_0_M_AXI_DC_AWSIZE;
  wire microblaze_riscv_0_M_AXI_DC_AWVALID;
  wire microblaze_riscv_0_M_AXI_DC_BREADY;
  wire [1:0]microblaze_riscv_0_M_AXI_DC_BRESP;
  wire microblaze_riscv_0_M_AXI_DC_BVALID;
  wire [31:0]microblaze_riscv_0_M_AXI_DC_RDATA;
  wire microblaze_riscv_0_M_AXI_DC_RLAST;
  wire microblaze_riscv_0_M_AXI_DC_RREADY;
  wire [1:0]microblaze_riscv_0_M_AXI_DC_RRESP;
  wire microblaze_riscv_0_M_AXI_DC_RVALID;
  wire [31:0]microblaze_riscv_0_M_AXI_DC_WDATA;
  wire microblaze_riscv_0_M_AXI_DC_WLAST;
  wire microblaze_riscv_0_M_AXI_DC_WREADY;
  wire [3:0]microblaze_riscv_0_M_AXI_DC_WSTRB;
  wire microblaze_riscv_0_M_AXI_DC_WVALID;
  wire [31:0]microblaze_riscv_0_M_AXI_IC_ARADDR;
  wire [1:0]microblaze_riscv_0_M_AXI_IC_ARBURST;
  wire [3:0]microblaze_riscv_0_M_AXI_IC_ARCACHE;
  wire [7:0]microblaze_riscv_0_M_AXI_IC_ARLEN;
  wire microblaze_riscv_0_M_AXI_IC_ARLOCK;
  wire [2:0]microblaze_riscv_0_M_AXI_IC_ARPROT;
  wire [3:0]microblaze_riscv_0_M_AXI_IC_ARQOS;
  wire microblaze_riscv_0_M_AXI_IC_ARREADY;
  wire [2:0]microblaze_riscv_0_M_AXI_IC_ARSIZE;
  wire microblaze_riscv_0_M_AXI_IC_ARVALID;
  wire [31:0]microblaze_riscv_0_M_AXI_IC_RDATA;
  wire microblaze_riscv_0_M_AXI_IC_RLAST;
  wire microblaze_riscv_0_M_AXI_IC_RREADY;
  wire [1:0]microblaze_riscv_0_M_AXI_IC_RRESP;
  wire microblaze_riscv_0_M_AXI_IC_RVALID;
  wire [31:0]microblaze_riscv_0_axi_dp_ARADDR;
  wire [2:0]microblaze_riscv_0_axi_dp_ARPROT;
  wire [0:0]microblaze_riscv_0_axi_dp_ARREADY;
  wire microblaze_riscv_0_axi_dp_ARVALID;
  wire [31:0]microblaze_riscv_0_axi_dp_AWADDR;
  wire [2:0]microblaze_riscv_0_axi_dp_AWPROT;
  wire [0:0]microblaze_riscv_0_axi_dp_AWREADY;
  wire microblaze_riscv_0_axi_dp_AWVALID;
  wire microblaze_riscv_0_axi_dp_BREADY;
  wire [1:0]microblaze_riscv_0_axi_dp_BRESP;
  wire [0:0]microblaze_riscv_0_axi_dp_BVALID;
  wire [31:0]microblaze_riscv_0_axi_dp_RDATA;
  wire microblaze_riscv_0_axi_dp_RREADY;
  wire [1:0]microblaze_riscv_0_axi_dp_RRESP;
  wire [0:0]microblaze_riscv_0_axi_dp_RVALID;
  wire [31:0]microblaze_riscv_0_axi_dp_WDATA;
  wire [0:0]microblaze_riscv_0_axi_dp_WREADY;
  wire [3:0]microblaze_riscv_0_axi_dp_WSTRB;
  wire microblaze_riscv_0_axi_dp_WVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M01_AXI_ARADDR;
  wire microblaze_riscv_0_axi_periph_M01_AXI_ARREADY;
  wire microblaze_riscv_0_axi_periph_M01_AXI_ARVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M01_AXI_AWADDR;
  wire microblaze_riscv_0_axi_periph_M01_AXI_AWREADY;
  wire microblaze_riscv_0_axi_periph_M01_AXI_AWVALID;
  wire microblaze_riscv_0_axi_periph_M01_AXI_BREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M01_AXI_BRESP;
  wire microblaze_riscv_0_axi_periph_M01_AXI_BVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M01_AXI_RDATA;
  wire microblaze_riscv_0_axi_periph_M01_AXI_RREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M01_AXI_RRESP;
  wire microblaze_riscv_0_axi_periph_M01_AXI_RVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M01_AXI_WDATA;
  wire microblaze_riscv_0_axi_periph_M01_AXI_WREADY;
  wire [3:0]microblaze_riscv_0_axi_periph_M01_AXI_WSTRB;
  wire microblaze_riscv_0_axi_periph_M01_AXI_WVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M02_AXI_ARADDR;
  wire microblaze_riscv_0_axi_periph_M02_AXI_ARREADY;
  wire [0:0]microblaze_riscv_0_axi_periph_M02_AXI_ARVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M02_AXI_AWADDR;
  wire microblaze_riscv_0_axi_periph_M02_AXI_AWREADY;
  wire [0:0]microblaze_riscv_0_axi_periph_M02_AXI_AWVALID;
  wire [0:0]microblaze_riscv_0_axi_periph_M02_AXI_BREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M02_AXI_BRESP;
  wire microblaze_riscv_0_axi_periph_M02_AXI_BVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M02_AXI_RDATA;
  wire [0:0]microblaze_riscv_0_axi_periph_M02_AXI_RREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M02_AXI_RRESP;
  wire microblaze_riscv_0_axi_periph_M02_AXI_RVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M02_AXI_WDATA;
  wire microblaze_riscv_0_axi_periph_M02_AXI_WREADY;
  wire [3:0]microblaze_riscv_0_axi_periph_M02_AXI_WSTRB;
  wire [0:0]microblaze_riscv_0_axi_periph_M02_AXI_WVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M03_AXI_ARADDR;
  wire microblaze_riscv_0_axi_periph_M03_AXI_ARREADY;
  wire microblaze_riscv_0_axi_periph_M03_AXI_ARVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M03_AXI_AWADDR;
  wire microblaze_riscv_0_axi_periph_M03_AXI_AWREADY;
  wire microblaze_riscv_0_axi_periph_M03_AXI_AWVALID;
  wire microblaze_riscv_0_axi_periph_M03_AXI_BREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M03_AXI_BRESP;
  wire microblaze_riscv_0_axi_periph_M03_AXI_BVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M03_AXI_RDATA;
  wire microblaze_riscv_0_axi_periph_M03_AXI_RREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M03_AXI_RRESP;
  wire microblaze_riscv_0_axi_periph_M03_AXI_RVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M03_AXI_WDATA;
  wire microblaze_riscv_0_axi_periph_M03_AXI_WREADY;
  wire [3:0]microblaze_riscv_0_axi_periph_M03_AXI_WSTRB;
  wire microblaze_riscv_0_axi_periph_M03_AXI_WVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M04_AXI_ARADDR;
  wire microblaze_riscv_0_axi_periph_M04_AXI_ARREADY;
  wire microblaze_riscv_0_axi_periph_M04_AXI_ARVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M04_AXI_AWADDR;
  wire microblaze_riscv_0_axi_periph_M04_AXI_AWREADY;
  wire microblaze_riscv_0_axi_periph_M04_AXI_AWVALID;
  wire microblaze_riscv_0_axi_periph_M04_AXI_BREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M04_AXI_BRESP;
  wire microblaze_riscv_0_axi_periph_M04_AXI_BVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M04_AXI_RDATA;
  wire microblaze_riscv_0_axi_periph_M04_AXI_RREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M04_AXI_RRESP;
  wire microblaze_riscv_0_axi_periph_M04_AXI_RVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M04_AXI_WDATA;
  wire microblaze_riscv_0_axi_periph_M04_AXI_WREADY;
  wire [3:0]microblaze_riscv_0_axi_periph_M04_AXI_WSTRB;
  wire microblaze_riscv_0_axi_periph_M04_AXI_WVALID;
  wire [16:0]microblaze_riscv_0_axi_periph_M05_AXI_ARADDR;
  wire [1:0]microblaze_riscv_0_axi_periph_M05_AXI_ARBURST;
  wire [3:0]microblaze_riscv_0_axi_periph_M05_AXI_ARCACHE;
  wire [7:0]microblaze_riscv_0_axi_periph_M05_AXI_ARLEN;
  wire microblaze_riscv_0_axi_periph_M05_AXI_ARLOCK;
  wire [2:0]microblaze_riscv_0_axi_periph_M05_AXI_ARPROT;
  wire microblaze_riscv_0_axi_periph_M05_AXI_ARREADY;
  wire [2:0]microblaze_riscv_0_axi_periph_M05_AXI_ARSIZE;
  wire microblaze_riscv_0_axi_periph_M05_AXI_ARVALID;
  wire [16:0]microblaze_riscv_0_axi_periph_M05_AXI_AWADDR;
  wire [1:0]microblaze_riscv_0_axi_periph_M05_AXI_AWBURST;
  wire [3:0]microblaze_riscv_0_axi_periph_M05_AXI_AWCACHE;
  wire [7:0]microblaze_riscv_0_axi_periph_M05_AXI_AWLEN;
  wire microblaze_riscv_0_axi_periph_M05_AXI_AWLOCK;
  wire [2:0]microblaze_riscv_0_axi_periph_M05_AXI_AWPROT;
  wire microblaze_riscv_0_axi_periph_M05_AXI_AWREADY;
  wire [2:0]microblaze_riscv_0_axi_periph_M05_AXI_AWSIZE;
  wire microblaze_riscv_0_axi_periph_M05_AXI_AWVALID;
  wire microblaze_riscv_0_axi_periph_M05_AXI_BREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M05_AXI_BRESP;
  wire microblaze_riscv_0_axi_periph_M05_AXI_BVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M05_AXI_RDATA;
  wire microblaze_riscv_0_axi_periph_M05_AXI_RLAST;
  wire microblaze_riscv_0_axi_periph_M05_AXI_RREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M05_AXI_RRESP;
  wire microblaze_riscv_0_axi_periph_M05_AXI_RVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M05_AXI_WDATA;
  wire microblaze_riscv_0_axi_periph_M05_AXI_WLAST;
  wire microblaze_riscv_0_axi_periph_M05_AXI_WREADY;
  wire [3:0]microblaze_riscv_0_axi_periph_M05_AXI_WSTRB;
  wire microblaze_riscv_0_axi_periph_M05_AXI_WVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M06_AXI_ARADDR;
  wire microblaze_riscv_0_axi_periph_M06_AXI_ARREADY;
  wire microblaze_riscv_0_axi_periph_M06_AXI_ARVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M06_AXI_AWADDR;
  wire microblaze_riscv_0_axi_periph_M06_AXI_AWREADY;
  wire microblaze_riscv_0_axi_periph_M06_AXI_AWVALID;
  wire microblaze_riscv_0_axi_periph_M06_AXI_BREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M06_AXI_BRESP;
  wire microblaze_riscv_0_axi_periph_M06_AXI_BVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M06_AXI_RDATA;
  wire microblaze_riscv_0_axi_periph_M06_AXI_RREADY;
  wire [1:0]microblaze_riscv_0_axi_periph_M06_AXI_RRESP;
  wire microblaze_riscv_0_axi_periph_M06_AXI_RVALID;
  wire [31:0]microblaze_riscv_0_axi_periph_M06_AXI_WDATA;
  wire microblaze_riscv_0_axi_periph_M06_AXI_WREADY;
  wire [3:0]microblaze_riscv_0_axi_periph_M06_AXI_WSTRB;
  wire microblaze_riscv_0_axi_periph_M06_AXI_WVALID;
  wire microblaze_riscv_0_debug_CAPTURE;
  wire microblaze_riscv_0_debug_CLK;
  wire microblaze_riscv_0_debug_DISABLE;
  wire [0:7]microblaze_riscv_0_debug_REG_EN;
  wire microblaze_riscv_0_debug_RST;
  wire microblaze_riscv_0_debug_SHIFT;
  wire microblaze_riscv_0_debug_TDI;
  wire microblaze_riscv_0_debug_TDO;
  wire microblaze_riscv_0_debug_UPDATE;
  wire [0:31]microblaze_riscv_0_dlmb_1_ABUS;
  wire microblaze_riscv_0_dlmb_1_ADDRSTROBE;
  wire [0:3]microblaze_riscv_0_dlmb_1_BE;
  wire microblaze_riscv_0_dlmb_1_CE;
  wire [0:31]microblaze_riscv_0_dlmb_1_READDBUS;
  wire microblaze_riscv_0_dlmb_1_READSTROBE;
  wire microblaze_riscv_0_dlmb_1_READY;
  wire microblaze_riscv_0_dlmb_1_UE;
  wire microblaze_riscv_0_dlmb_1_WAIT;
  wire [0:31]microblaze_riscv_0_dlmb_1_WRITEDBUS;
  wire microblaze_riscv_0_dlmb_1_WRITESTROBE;
  wire [0:31]microblaze_riscv_0_ilmb_1_ABUS;
  wire microblaze_riscv_0_ilmb_1_ADDRSTROBE;
  wire microblaze_riscv_0_ilmb_1_CE;
  wire [0:31]microblaze_riscv_0_ilmb_1_READDBUS;
  wire microblaze_riscv_0_ilmb_1_READSTROBE;
  wire microblaze_riscv_0_ilmb_1_READY;
  wire microblaze_riscv_0_ilmb_1_UE;
  wire microblaze_riscv_0_ilmb_1_WAIT;
  wire [31:0]microblaze_riscv_0_intc_axi_ARADDR;
  wire microblaze_riscv_0_intc_axi_ARREADY;
  wire microblaze_riscv_0_intc_axi_ARVALID;
  wire [31:0]microblaze_riscv_0_intc_axi_AWADDR;
  wire microblaze_riscv_0_intc_axi_AWREADY;
  wire microblaze_riscv_0_intc_axi_AWVALID;
  wire microblaze_riscv_0_intc_axi_BREADY;
  wire [1:0]microblaze_riscv_0_intc_axi_BRESP;
  wire microblaze_riscv_0_intc_axi_BVALID;
  wire [31:0]microblaze_riscv_0_intc_axi_RDATA;
  wire microblaze_riscv_0_intc_axi_RREADY;
  wire [1:0]microblaze_riscv_0_intc_axi_RRESP;
  wire microblaze_riscv_0_intc_axi_RVALID;
  wire [31:0]microblaze_riscv_0_intc_axi_WDATA;
  wire microblaze_riscv_0_intc_axi_WREADY;
  wire [3:0]microblaze_riscv_0_intc_axi_WSTRB;
  wire microblaze_riscv_0_intc_axi_WVALID;
  wire [0:1]microblaze_riscv_0_interrupt_ACK;
  wire [31:0]microblaze_riscv_0_interrupt_ADDRESS;
  wire microblaze_riscv_0_interrupt_INTERRUPT;
  wire [2:0]microblaze_riscv_0_intr;
  wire microsd_ip2intc_irpt;
  wire mig_7series_0_mmcm_locked;
  wire mig_7series_0_ui_clk;
  wire mig_7series_0_ui_clk_sync_rst;
  wire [4:0]push_buttons_5bits_tri_i;
  wire [26:0]ram_interconnect_M00_AXI_ARADDR;
  wire [1:0]ram_interconnect_M00_AXI_ARBURST;
  wire [3:0]ram_interconnect_M00_AXI_ARCACHE;
  wire [0:0]ram_interconnect_M00_AXI_ARID;
  wire [7:0]ram_interconnect_M00_AXI_ARLEN;
  wire [0:0]ram_interconnect_M00_AXI_ARLOCK;
  wire [2:0]ram_interconnect_M00_AXI_ARPROT;
  wire [3:0]ram_interconnect_M00_AXI_ARQOS;
  wire ram_interconnect_M00_AXI_ARREADY;
  wire [2:0]ram_interconnect_M00_AXI_ARSIZE;
  wire ram_interconnect_M00_AXI_ARVALID;
  wire [26:0]ram_interconnect_M00_AXI_AWADDR;
  wire [1:0]ram_interconnect_M00_AXI_AWBURST;
  wire [3:0]ram_interconnect_M00_AXI_AWCACHE;
  wire [0:0]ram_interconnect_M00_AXI_AWID;
  wire [7:0]ram_interconnect_M00_AXI_AWLEN;
  wire [0:0]ram_interconnect_M00_AXI_AWLOCK;
  wire [2:0]ram_interconnect_M00_AXI_AWPROT;
  wire [3:0]ram_interconnect_M00_AXI_AWQOS;
  wire ram_interconnect_M00_AXI_AWREADY;
  wire [2:0]ram_interconnect_M00_AXI_AWSIZE;
  wire ram_interconnect_M00_AXI_AWVALID;
  wire [0:0]ram_interconnect_M00_AXI_BID;
  wire ram_interconnect_M00_AXI_BREADY;
  wire [1:0]ram_interconnect_M00_AXI_BRESP;
  wire ram_interconnect_M00_AXI_BVALID;
  wire [127:0]ram_interconnect_M00_AXI_RDATA;
  wire [0:0]ram_interconnect_M00_AXI_RID;
  wire ram_interconnect_M00_AXI_RLAST;
  wire ram_interconnect_M00_AXI_RREADY;
  wire [1:0]ram_interconnect_M00_AXI_RRESP;
  wire ram_interconnect_M00_AXI_RVALID;
  wire [127:0]ram_interconnect_M00_AXI_WDATA;
  wire ram_interconnect_M00_AXI_WLAST;
  wire ram_interconnect_M00_AXI_WREADY;
  wire [15:0]ram_interconnect_M00_AXI_WSTRB;
  wire ram_interconnect_M00_AXI_WVALID;
  wire [5:0]rgb_led_tri_o;
  wire [0:0]rst_clk_wiz_0_200M_bus_struct_reset;
  wire rst_clk_wiz_0_200M_mb_reset;
  wire [0:0]rst_clk_wiz_0_200M_peripheral_aresetn;
  wire [0:0]rst_clk_wiz_0_200M_peripheral_reset;
  wire [0:0]rst_mig_7series_0_81M_peripheral_aresetn;
  wire usb_uart_rxd;
  wire usb_uart_txd;
  wire [0:0]util_ds_buf_0_BUFG_O;

  design_1_axi_gpio_0_3 axi_gpio_0
       (.gpio2_io_o(rgb_led_tri_o),
        .gpio_io_o(led_16bits_tri_o),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_araddr(microblaze_riscv_0_axi_periph_M01_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_clk_wiz_0_200M_peripheral_aresetn),
        .s_axi_arready(microblaze_riscv_0_axi_periph_M01_AXI_ARREADY),
        .s_axi_arvalid(microblaze_riscv_0_axi_periph_M01_AXI_ARVALID),
        .s_axi_awaddr(microblaze_riscv_0_axi_periph_M01_AXI_AWADDR[8:0]),
        .s_axi_awready(microblaze_riscv_0_axi_periph_M01_AXI_AWREADY),
        .s_axi_awvalid(microblaze_riscv_0_axi_periph_M01_AXI_AWVALID),
        .s_axi_bready(microblaze_riscv_0_axi_periph_M01_AXI_BREADY),
        .s_axi_bresp(microblaze_riscv_0_axi_periph_M01_AXI_BRESP),
        .s_axi_bvalid(microblaze_riscv_0_axi_periph_M01_AXI_BVALID),
        .s_axi_rdata(microblaze_riscv_0_axi_periph_M01_AXI_RDATA),
        .s_axi_rready(microblaze_riscv_0_axi_periph_M01_AXI_RREADY),
        .s_axi_rresp(microblaze_riscv_0_axi_periph_M01_AXI_RRESP),
        .s_axi_rvalid(microblaze_riscv_0_axi_periph_M01_AXI_RVALID),
        .s_axi_wdata(microblaze_riscv_0_axi_periph_M01_AXI_WDATA),
        .s_axi_wready(microblaze_riscv_0_axi_periph_M01_AXI_WREADY),
        .s_axi_wstrb(microblaze_riscv_0_axi_periph_M01_AXI_WSTRB),
        .s_axi_wvalid(microblaze_riscv_0_axi_periph_M01_AXI_WVALID));
  design_1_axi_gpio_1_1 axi_gpio_1
       (.gpio2_io_i(push_buttons_5bits_tri_i),
        .gpio_io_i(dip_switches_16bits_tri_i),
        .ip2intc_irpt(axi_gpio_1_ip2intc_irpt),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_araddr(microblaze_riscv_0_axi_periph_M06_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_clk_wiz_0_200M_peripheral_aresetn),
        .s_axi_arready(microblaze_riscv_0_axi_periph_M06_AXI_ARREADY),
        .s_axi_arvalid(microblaze_riscv_0_axi_periph_M06_AXI_ARVALID),
        .s_axi_awaddr(microblaze_riscv_0_axi_periph_M06_AXI_AWADDR[8:0]),
        .s_axi_awready(microblaze_riscv_0_axi_periph_M06_AXI_AWREADY),
        .s_axi_awvalid(microblaze_riscv_0_axi_periph_M06_AXI_AWVALID),
        .s_axi_bready(microblaze_riscv_0_axi_periph_M06_AXI_BREADY),
        .s_axi_bresp(microblaze_riscv_0_axi_periph_M06_AXI_BRESP),
        .s_axi_bvalid(microblaze_riscv_0_axi_periph_M06_AXI_BVALID),
        .s_axi_rdata(microblaze_riscv_0_axi_periph_M06_AXI_RDATA),
        .s_axi_rready(microblaze_riscv_0_axi_periph_M06_AXI_RREADY),
        .s_axi_rresp(microblaze_riscv_0_axi_periph_M06_AXI_RRESP),
        .s_axi_rvalid(microblaze_riscv_0_axi_periph_M06_AXI_RVALID),
        .s_axi_wdata(microblaze_riscv_0_axi_periph_M06_AXI_WDATA),
        .s_axi_wready(microblaze_riscv_0_axi_periph_M06_AXI_WREADY),
        .s_axi_wstrb(microblaze_riscv_0_axi_periph_M06_AXI_WSTRB),
        .s_axi_wvalid(microblaze_riscv_0_axi_periph_M06_AXI_WVALID));
  design_1_axi_timer_0_0 axi_timer_0
       (.capturetrig0(1'b0),
        .capturetrig1(1'b0),
        .freeze(1'b0),
        .interrupt(axi_timer_0_interrupt),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_araddr(microblaze_riscv_0_axi_periph_M03_AXI_ARADDR[4:0]),
        .s_axi_aresetn(rst_clk_wiz_0_200M_peripheral_aresetn),
        .s_axi_arready(microblaze_riscv_0_axi_periph_M03_AXI_ARREADY),
        .s_axi_arvalid(microblaze_riscv_0_axi_periph_M03_AXI_ARVALID),
        .s_axi_awaddr(microblaze_riscv_0_axi_periph_M03_AXI_AWADDR[4:0]),
        .s_axi_awready(microblaze_riscv_0_axi_periph_M03_AXI_AWREADY),
        .s_axi_awvalid(microblaze_riscv_0_axi_periph_M03_AXI_AWVALID),
        .s_axi_bready(microblaze_riscv_0_axi_periph_M03_AXI_BREADY),
        .s_axi_bresp(microblaze_riscv_0_axi_periph_M03_AXI_BRESP),
        .s_axi_bvalid(microblaze_riscv_0_axi_periph_M03_AXI_BVALID),
        .s_axi_rdata(microblaze_riscv_0_axi_periph_M03_AXI_RDATA),
        .s_axi_rready(microblaze_riscv_0_axi_periph_M03_AXI_RREADY),
        .s_axi_rresp(microblaze_riscv_0_axi_periph_M03_AXI_RRESP),
        .s_axi_rvalid(microblaze_riscv_0_axi_periph_M03_AXI_RVALID),
        .s_axi_wdata(microblaze_riscv_0_axi_periph_M03_AXI_WDATA),
        .s_axi_wready(microblaze_riscv_0_axi_periph_M03_AXI_WREADY),
        .s_axi_wstrb(microblaze_riscv_0_axi_periph_M03_AXI_WSTRB),
        .s_axi_wvalid(microblaze_riscv_0_axi_periph_M03_AXI_WVALID));
  design_1_axi_uartlite_0_0 axi_uartlite_0
       (.rx(usb_uart_rxd),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_araddr(microblaze_riscv_0_axi_periph_M02_AXI_ARADDR[3:0]),
        .s_axi_aresetn(rst_clk_wiz_0_200M_peripheral_aresetn),
        .s_axi_arready(microblaze_riscv_0_axi_periph_M02_AXI_ARREADY),
        .s_axi_arvalid(microblaze_riscv_0_axi_periph_M02_AXI_ARVALID),
        .s_axi_awaddr(microblaze_riscv_0_axi_periph_M02_AXI_AWADDR[3:0]),
        .s_axi_awready(microblaze_riscv_0_axi_periph_M02_AXI_AWREADY),
        .s_axi_awvalid(microblaze_riscv_0_axi_periph_M02_AXI_AWVALID),
        .s_axi_bready(microblaze_riscv_0_axi_periph_M02_AXI_BREADY),
        .s_axi_bresp(microblaze_riscv_0_axi_periph_M02_AXI_BRESP),
        .s_axi_bvalid(microblaze_riscv_0_axi_periph_M02_AXI_BVALID),
        .s_axi_rdata(microblaze_riscv_0_axi_periph_M02_AXI_RDATA),
        .s_axi_rready(microblaze_riscv_0_axi_periph_M02_AXI_RREADY),
        .s_axi_rresp(microblaze_riscv_0_axi_periph_M02_AXI_RRESP),
        .s_axi_rvalid(microblaze_riscv_0_axi_periph_M02_AXI_RVALID),
        .s_axi_wdata(microblaze_riscv_0_axi_periph_M02_AXI_WDATA),
        .s_axi_wready(microblaze_riscv_0_axi_periph_M02_AXI_WREADY),
        .s_axi_wstrb(microblaze_riscv_0_axi_periph_M02_AXI_WSTRB),
        .s_axi_wvalid(microblaze_riscv_0_axi_periph_M02_AXI_WVALID),
        .tx(usb_uart_txd));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(util_ds_buf_0_BUFG_O),
        .cpu_clk(microblaze_riscv_0_Clk),
        .ddr_clk(clk_wiz_0_clk_out2),
        .gpu_clk(gpu_clk_i_1),
        .locked(clk_wiz_0_locked),
        .resetn(CPU_RESETN),
        .vga_clk(clk_wiz_0_vga_clk));
  gpu_imp_FKHPVI gpu
       (.S_AXI_araddr(microblaze_riscv_0_axi_periph_M05_AXI_ARADDR),
        .S_AXI_arburst(microblaze_riscv_0_axi_periph_M05_AXI_ARBURST),
        .S_AXI_arcache(microblaze_riscv_0_axi_periph_M05_AXI_ARCACHE),
        .S_AXI_arlen(microblaze_riscv_0_axi_periph_M05_AXI_ARLEN),
        .S_AXI_arlock(microblaze_riscv_0_axi_periph_M05_AXI_ARLOCK),
        .S_AXI_arprot(microblaze_riscv_0_axi_periph_M05_AXI_ARPROT),
        .S_AXI_arready(microblaze_riscv_0_axi_periph_M05_AXI_ARREADY),
        .S_AXI_arsize(microblaze_riscv_0_axi_periph_M05_AXI_ARSIZE),
        .S_AXI_arvalid(microblaze_riscv_0_axi_periph_M05_AXI_ARVALID),
        .S_AXI_awaddr(microblaze_riscv_0_axi_periph_M05_AXI_AWADDR),
        .S_AXI_awburst(microblaze_riscv_0_axi_periph_M05_AXI_AWBURST),
        .S_AXI_awcache(microblaze_riscv_0_axi_periph_M05_AXI_AWCACHE),
        .S_AXI_awlen(microblaze_riscv_0_axi_periph_M05_AXI_AWLEN),
        .S_AXI_awlock(microblaze_riscv_0_axi_periph_M05_AXI_AWLOCK),
        .S_AXI_awprot(microblaze_riscv_0_axi_periph_M05_AXI_AWPROT),
        .S_AXI_awready(microblaze_riscv_0_axi_periph_M05_AXI_AWREADY),
        .S_AXI_awsize(microblaze_riscv_0_axi_periph_M05_AXI_AWSIZE),
        .S_AXI_awvalid(microblaze_riscv_0_axi_periph_M05_AXI_AWVALID),
        .S_AXI_bready(microblaze_riscv_0_axi_periph_M05_AXI_BREADY),
        .S_AXI_bresp(microblaze_riscv_0_axi_periph_M05_AXI_BRESP),
        .S_AXI_bvalid(microblaze_riscv_0_axi_periph_M05_AXI_BVALID),
        .S_AXI_rdata(microblaze_riscv_0_axi_periph_M05_AXI_RDATA),
        .S_AXI_rlast(microblaze_riscv_0_axi_periph_M05_AXI_RLAST),
        .S_AXI_rready(microblaze_riscv_0_axi_periph_M05_AXI_RREADY),
        .S_AXI_rresp(microblaze_riscv_0_axi_periph_M05_AXI_RRESP),
        .S_AXI_rvalid(microblaze_riscv_0_axi_periph_M05_AXI_RVALID),
        .S_AXI_wdata(microblaze_riscv_0_axi_periph_M05_AXI_WDATA),
        .S_AXI_wlast(microblaze_riscv_0_axi_periph_M05_AXI_WLAST),
        .S_AXI_wready(microblaze_riscv_0_axi_periph_M05_AXI_WREADY),
        .S_AXI_wstrb(microblaze_riscv_0_axi_periph_M05_AXI_WSTRB),
        .S_AXI_wvalid(microblaze_riscv_0_axi_periph_M05_AXI_WVALID),
        .VGA_B(VGA_B),
        .VGA_G(VGA_G),
        .VGA_HS(VGA_HS),
        .VGA_R(VGA_R),
        .VGA_VS(VGA_VS),
        .gpu_clk_i(gpu_clk_i_1),
        .reset_i(rst_clk_wiz_0_200M_peripheral_reset),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_aresetn(rst_clk_wiz_0_200M_peripheral_aresetn),
        .vga_clk_i(clk_wiz_0_vga_clk));
  design_1_mdm_1_2 mdm_1
       (.Dbg_Capture_0(microblaze_riscv_0_debug_CAPTURE),
        .Dbg_Clk_0(microblaze_riscv_0_debug_CLK),
        .Dbg_Disable_0(microblaze_riscv_0_debug_DISABLE),
        .Dbg_Reg_En_0(microblaze_riscv_0_debug_REG_EN),
        .Dbg_Rst_0(microblaze_riscv_0_debug_RST),
        .Dbg_Shift_0(microblaze_riscv_0_debug_SHIFT),
        .Dbg_TDI_0(microblaze_riscv_0_debug_TDI),
        .Dbg_TDO_0(microblaze_riscv_0_debug_TDO),
        .Dbg_Update_0(microblaze_riscv_0_debug_UPDATE),
        .Debug_SYS_Rst(mdm_1_debug_sys_rst));
  (* BMM_INFO_PROCESSOR = "riscv > design_1 microblaze_riscv_0_local_memory/dlmb_bram_if_cntlr design_1 gpu/axi_bram_ctrl_0" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  design_1_microblaze_riscv_0_0 microblaze_riscv_0
       (.Byte_Enable(microblaze_riscv_0_dlmb_1_BE),
        .Clk(microblaze_riscv_0_Clk),
        .DCE(microblaze_riscv_0_dlmb_1_CE),
        .DReady(microblaze_riscv_0_dlmb_1_READY),
        .DUE(microblaze_riscv_0_dlmb_1_UE),
        .DWait(microblaze_riscv_0_dlmb_1_WAIT),
        .D_AS(microblaze_riscv_0_dlmb_1_ADDRSTROBE),
        .Data_Addr(microblaze_riscv_0_dlmb_1_ABUS),
        .Data_Read(microblaze_riscv_0_dlmb_1_READDBUS),
        .Data_Write(microblaze_riscv_0_dlmb_1_WRITEDBUS),
        .Dbg_Capture(microblaze_riscv_0_debug_CAPTURE),
        .Dbg_Clk(microblaze_riscv_0_debug_CLK),
        .Dbg_Disable(microblaze_riscv_0_debug_DISABLE),
        .Dbg_Reg_En(microblaze_riscv_0_debug_REG_EN),
        .Dbg_Shift(microblaze_riscv_0_debug_SHIFT),
        .Dbg_TDI(microblaze_riscv_0_debug_TDI),
        .Dbg_TDO(microblaze_riscv_0_debug_TDO),
        .Dbg_Update(microblaze_riscv_0_debug_UPDATE),
        .Debug_Rst(microblaze_riscv_0_debug_RST),
        .ICE(microblaze_riscv_0_ilmb_1_CE),
        .IFetch(microblaze_riscv_0_ilmb_1_READSTROBE),
        .IReady(microblaze_riscv_0_ilmb_1_READY),
        .IUE(microblaze_riscv_0_ilmb_1_UE),
        .IWAIT(microblaze_riscv_0_ilmb_1_WAIT),
        .I_AS(microblaze_riscv_0_ilmb_1_ADDRSTROBE),
        .Instr(microblaze_riscv_0_ilmb_1_READDBUS),
        .Instr_Addr(microblaze_riscv_0_ilmb_1_ABUS),
        .Interrupt(microblaze_riscv_0_interrupt_INTERRUPT),
        .Interrupt_Ack(microblaze_riscv_0_interrupt_ACK),
        .Interrupt_Address({microblaze_riscv_0_interrupt_ADDRESS[31],microblaze_riscv_0_interrupt_ADDRESS[30],microblaze_riscv_0_interrupt_ADDRESS[29],microblaze_riscv_0_interrupt_ADDRESS[28],microblaze_riscv_0_interrupt_ADDRESS[27],microblaze_riscv_0_interrupt_ADDRESS[26],microblaze_riscv_0_interrupt_ADDRESS[25],microblaze_riscv_0_interrupt_ADDRESS[24],microblaze_riscv_0_interrupt_ADDRESS[23],microblaze_riscv_0_interrupt_ADDRESS[22],microblaze_riscv_0_interrupt_ADDRESS[21],microblaze_riscv_0_interrupt_ADDRESS[20],microblaze_riscv_0_interrupt_ADDRESS[19],microblaze_riscv_0_interrupt_ADDRESS[18],microblaze_riscv_0_interrupt_ADDRESS[17],microblaze_riscv_0_interrupt_ADDRESS[16],microblaze_riscv_0_interrupt_ADDRESS[15],microblaze_riscv_0_interrupt_ADDRESS[14],microblaze_riscv_0_interrupt_ADDRESS[13],microblaze_riscv_0_interrupt_ADDRESS[12],microblaze_riscv_0_interrupt_ADDRESS[11],microblaze_riscv_0_interrupt_ADDRESS[10],microblaze_riscv_0_interrupt_ADDRESS[9],microblaze_riscv_0_interrupt_ADDRESS[8],microblaze_riscv_0_interrupt_ADDRESS[7],microblaze_riscv_0_interrupt_ADDRESS[6],microblaze_riscv_0_interrupt_ADDRESS[5],microblaze_riscv_0_interrupt_ADDRESS[4],microblaze_riscv_0_interrupt_ADDRESS[3],microblaze_riscv_0_interrupt_ADDRESS[2],microblaze_riscv_0_interrupt_ADDRESS[1],microblaze_riscv_0_interrupt_ADDRESS[0]}),
        .M_AXI_DC_ARADDR(microblaze_riscv_0_M_AXI_DC_ARADDR),
        .M_AXI_DC_ARBURST(microblaze_riscv_0_M_AXI_DC_ARBURST),
        .M_AXI_DC_ARCACHE(microblaze_riscv_0_M_AXI_DC_ARCACHE),
        .M_AXI_DC_ARLEN(microblaze_riscv_0_M_AXI_DC_ARLEN),
        .M_AXI_DC_ARLOCK(microblaze_riscv_0_M_AXI_DC_ARLOCK),
        .M_AXI_DC_ARPROT(microblaze_riscv_0_M_AXI_DC_ARPROT),
        .M_AXI_DC_ARQOS(microblaze_riscv_0_M_AXI_DC_ARQOS),
        .M_AXI_DC_ARREADY(microblaze_riscv_0_M_AXI_DC_ARREADY),
        .M_AXI_DC_ARSIZE(microblaze_riscv_0_M_AXI_DC_ARSIZE),
        .M_AXI_DC_ARVALID(microblaze_riscv_0_M_AXI_DC_ARVALID),
        .M_AXI_DC_AWADDR(microblaze_riscv_0_M_AXI_DC_AWADDR),
        .M_AXI_DC_AWBURST(microblaze_riscv_0_M_AXI_DC_AWBURST),
        .M_AXI_DC_AWCACHE(microblaze_riscv_0_M_AXI_DC_AWCACHE),
        .M_AXI_DC_AWLEN(microblaze_riscv_0_M_AXI_DC_AWLEN),
        .M_AXI_DC_AWLOCK(microblaze_riscv_0_M_AXI_DC_AWLOCK),
        .M_AXI_DC_AWPROT(microblaze_riscv_0_M_AXI_DC_AWPROT),
        .M_AXI_DC_AWQOS(microblaze_riscv_0_M_AXI_DC_AWQOS),
        .M_AXI_DC_AWREADY(microblaze_riscv_0_M_AXI_DC_AWREADY),
        .M_AXI_DC_AWSIZE(microblaze_riscv_0_M_AXI_DC_AWSIZE),
        .M_AXI_DC_AWVALID(microblaze_riscv_0_M_AXI_DC_AWVALID),
        .M_AXI_DC_BID(1'b0),
        .M_AXI_DC_BREADY(microblaze_riscv_0_M_AXI_DC_BREADY),
        .M_AXI_DC_BRESP(microblaze_riscv_0_M_AXI_DC_BRESP),
        .M_AXI_DC_BVALID(microblaze_riscv_0_M_AXI_DC_BVALID),
        .M_AXI_DC_RDATA(microblaze_riscv_0_M_AXI_DC_RDATA),
        .M_AXI_DC_RID(1'b0),
        .M_AXI_DC_RLAST(microblaze_riscv_0_M_AXI_DC_RLAST),
        .M_AXI_DC_RREADY(microblaze_riscv_0_M_AXI_DC_RREADY),
        .M_AXI_DC_RRESP(microblaze_riscv_0_M_AXI_DC_RRESP),
        .M_AXI_DC_RVALID(microblaze_riscv_0_M_AXI_DC_RVALID),
        .M_AXI_DC_WDATA(microblaze_riscv_0_M_AXI_DC_WDATA),
        .M_AXI_DC_WLAST(microblaze_riscv_0_M_AXI_DC_WLAST),
        .M_AXI_DC_WREADY(microblaze_riscv_0_M_AXI_DC_WREADY),
        .M_AXI_DC_WSTRB(microblaze_riscv_0_M_AXI_DC_WSTRB),
        .M_AXI_DC_WVALID(microblaze_riscv_0_M_AXI_DC_WVALID),
        .M_AXI_DP_ARADDR(microblaze_riscv_0_axi_dp_ARADDR),
        .M_AXI_DP_ARPROT(microblaze_riscv_0_axi_dp_ARPROT),
        .M_AXI_DP_ARREADY(microblaze_riscv_0_axi_dp_ARREADY),
        .M_AXI_DP_ARVALID(microblaze_riscv_0_axi_dp_ARVALID),
        .M_AXI_DP_AWADDR(microblaze_riscv_0_axi_dp_AWADDR),
        .M_AXI_DP_AWPROT(microblaze_riscv_0_axi_dp_AWPROT),
        .M_AXI_DP_AWREADY(microblaze_riscv_0_axi_dp_AWREADY),
        .M_AXI_DP_AWVALID(microblaze_riscv_0_axi_dp_AWVALID),
        .M_AXI_DP_BREADY(microblaze_riscv_0_axi_dp_BREADY),
        .M_AXI_DP_BRESP(microblaze_riscv_0_axi_dp_BRESP),
        .M_AXI_DP_BVALID(microblaze_riscv_0_axi_dp_BVALID),
        .M_AXI_DP_RDATA(microblaze_riscv_0_axi_dp_RDATA),
        .M_AXI_DP_RREADY(microblaze_riscv_0_axi_dp_RREADY),
        .M_AXI_DP_RRESP(microblaze_riscv_0_axi_dp_RRESP),
        .M_AXI_DP_RVALID(microblaze_riscv_0_axi_dp_RVALID),
        .M_AXI_DP_WDATA(microblaze_riscv_0_axi_dp_WDATA),
        .M_AXI_DP_WREADY(microblaze_riscv_0_axi_dp_WREADY),
        .M_AXI_DP_WSTRB(microblaze_riscv_0_axi_dp_WSTRB),
        .M_AXI_DP_WVALID(microblaze_riscv_0_axi_dp_WVALID),
        .M_AXI_IC_ARADDR(microblaze_riscv_0_M_AXI_IC_ARADDR),
        .M_AXI_IC_ARBURST(microblaze_riscv_0_M_AXI_IC_ARBURST),
        .M_AXI_IC_ARCACHE(microblaze_riscv_0_M_AXI_IC_ARCACHE),
        .M_AXI_IC_ARLEN(microblaze_riscv_0_M_AXI_IC_ARLEN),
        .M_AXI_IC_ARLOCK(microblaze_riscv_0_M_AXI_IC_ARLOCK),
        .M_AXI_IC_ARPROT(microblaze_riscv_0_M_AXI_IC_ARPROT),
        .M_AXI_IC_ARQOS(microblaze_riscv_0_M_AXI_IC_ARQOS),
        .M_AXI_IC_ARREADY(microblaze_riscv_0_M_AXI_IC_ARREADY),
        .M_AXI_IC_ARSIZE(microblaze_riscv_0_M_AXI_IC_ARSIZE),
        .M_AXI_IC_ARVALID(microblaze_riscv_0_M_AXI_IC_ARVALID),
        .M_AXI_IC_AWREADY(1'b0),
        .M_AXI_IC_BID(1'b0),
        .M_AXI_IC_BRESP({1'b0,1'b0}),
        .M_AXI_IC_BVALID(1'b0),
        .M_AXI_IC_RDATA(microblaze_riscv_0_M_AXI_IC_RDATA),
        .M_AXI_IC_RID(1'b0),
        .M_AXI_IC_RLAST(microblaze_riscv_0_M_AXI_IC_RLAST),
        .M_AXI_IC_RREADY(microblaze_riscv_0_M_AXI_IC_RREADY),
        .M_AXI_IC_RRESP(microblaze_riscv_0_M_AXI_IC_RRESP),
        .M_AXI_IC_RVALID(microblaze_riscv_0_M_AXI_IC_RVALID),
        .M_AXI_IC_WREADY(1'b0),
        .Read_Strobe(microblaze_riscv_0_dlmb_1_READSTROBE),
        .Reset(rst_clk_wiz_0_200M_mb_reset),
        .Write_Strobe(microblaze_riscv_0_dlmb_1_WRITESTROBE));
  design_1_microblaze_riscv_0_axi_intc_2 microblaze_riscv_0_axi_intc
       (.interrupt_address(microblaze_riscv_0_interrupt_ADDRESS),
        .intr(microblaze_riscv_0_intr),
        .irq(microblaze_riscv_0_interrupt_INTERRUPT),
        .processor_ack({microblaze_riscv_0_interrupt_ACK[0],microblaze_riscv_0_interrupt_ACK[1]}),
        .processor_clk(microblaze_riscv_0_Clk),
        .processor_rst(rst_clk_wiz_0_200M_mb_reset),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_araddr(microblaze_riscv_0_intc_axi_ARADDR[8:0]),
        .s_axi_aresetn(rst_clk_wiz_0_200M_peripheral_aresetn),
        .s_axi_arready(microblaze_riscv_0_intc_axi_ARREADY),
        .s_axi_arvalid(microblaze_riscv_0_intc_axi_ARVALID),
        .s_axi_awaddr(microblaze_riscv_0_intc_axi_AWADDR[8:0]),
        .s_axi_awready(microblaze_riscv_0_intc_axi_AWREADY),
        .s_axi_awvalid(microblaze_riscv_0_intc_axi_AWVALID),
        .s_axi_bready(microblaze_riscv_0_intc_axi_BREADY),
        .s_axi_bresp(microblaze_riscv_0_intc_axi_BRESP),
        .s_axi_bvalid(microblaze_riscv_0_intc_axi_BVALID),
        .s_axi_rdata(microblaze_riscv_0_intc_axi_RDATA),
        .s_axi_rready(microblaze_riscv_0_intc_axi_RREADY),
        .s_axi_rresp(microblaze_riscv_0_intc_axi_RRESP),
        .s_axi_rvalid(microblaze_riscv_0_intc_axi_RVALID),
        .s_axi_wdata(microblaze_riscv_0_intc_axi_WDATA),
        .s_axi_wready(microblaze_riscv_0_intc_axi_WREADY),
        .s_axi_wstrb(microblaze_riscv_0_intc_axi_WSTRB),
        .s_axi_wvalid(microblaze_riscv_0_intc_axi_WVALID));
  design_1_microblaze_riscv_0_axi_periph_2 microblaze_riscv_0_axi_periph
       (.ACLK(microblaze_riscv_0_Clk),
        .ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .M00_ACLK(microblaze_riscv_0_Clk),
        .M00_ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .M00_AXI_araddr(microblaze_riscv_0_intc_axi_ARADDR),
        .M00_AXI_arready(microblaze_riscv_0_intc_axi_ARREADY),
        .M00_AXI_arvalid(microblaze_riscv_0_intc_axi_ARVALID),
        .M00_AXI_awaddr(microblaze_riscv_0_intc_axi_AWADDR),
        .M00_AXI_awready(microblaze_riscv_0_intc_axi_AWREADY),
        .M00_AXI_awvalid(microblaze_riscv_0_intc_axi_AWVALID),
        .M00_AXI_bready(microblaze_riscv_0_intc_axi_BREADY),
        .M00_AXI_bresp(microblaze_riscv_0_intc_axi_BRESP),
        .M00_AXI_bvalid(microblaze_riscv_0_intc_axi_BVALID),
        .M00_AXI_rdata(microblaze_riscv_0_intc_axi_RDATA),
        .M00_AXI_rready(microblaze_riscv_0_intc_axi_RREADY),
        .M00_AXI_rresp(microblaze_riscv_0_intc_axi_RRESP),
        .M00_AXI_rvalid(microblaze_riscv_0_intc_axi_RVALID),
        .M00_AXI_wdata(microblaze_riscv_0_intc_axi_WDATA),
        .M00_AXI_wready(microblaze_riscv_0_intc_axi_WREADY),
        .M00_AXI_wstrb(microblaze_riscv_0_intc_axi_WSTRB),
        .M00_AXI_wvalid(microblaze_riscv_0_intc_axi_WVALID),
        .M01_ACLK(microblaze_riscv_0_Clk),
        .M01_ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .M01_AXI_araddr(microblaze_riscv_0_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(microblaze_riscv_0_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(microblaze_riscv_0_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(microblaze_riscv_0_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(microblaze_riscv_0_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(microblaze_riscv_0_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(microblaze_riscv_0_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(microblaze_riscv_0_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(microblaze_riscv_0_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(microblaze_riscv_0_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(microblaze_riscv_0_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(microblaze_riscv_0_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(microblaze_riscv_0_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(microblaze_riscv_0_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(microblaze_riscv_0_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wstrb(microblaze_riscv_0_axi_periph_M01_AXI_WSTRB),
        .M01_AXI_wvalid(microblaze_riscv_0_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(microblaze_riscv_0_Clk),
        .M02_ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .M02_AXI_araddr(microblaze_riscv_0_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arready(microblaze_riscv_0_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arvalid(microblaze_riscv_0_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(microblaze_riscv_0_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awready(microblaze_riscv_0_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awvalid(microblaze_riscv_0_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bready(microblaze_riscv_0_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(microblaze_riscv_0_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(microblaze_riscv_0_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(microblaze_riscv_0_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rready(microblaze_riscv_0_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(microblaze_riscv_0_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(microblaze_riscv_0_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(microblaze_riscv_0_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wready(microblaze_riscv_0_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wstrb(microblaze_riscv_0_axi_periph_M02_AXI_WSTRB),
        .M02_AXI_wvalid(microblaze_riscv_0_axi_periph_M02_AXI_WVALID),
        .M03_ACLK(microblaze_riscv_0_Clk),
        .M03_ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .M03_AXI_araddr(microblaze_riscv_0_axi_periph_M03_AXI_ARADDR),
        .M03_AXI_arready(microblaze_riscv_0_axi_periph_M03_AXI_ARREADY),
        .M03_AXI_arvalid(microblaze_riscv_0_axi_periph_M03_AXI_ARVALID),
        .M03_AXI_awaddr(microblaze_riscv_0_axi_periph_M03_AXI_AWADDR),
        .M03_AXI_awready(microblaze_riscv_0_axi_periph_M03_AXI_AWREADY),
        .M03_AXI_awvalid(microblaze_riscv_0_axi_periph_M03_AXI_AWVALID),
        .M03_AXI_bready(microblaze_riscv_0_axi_periph_M03_AXI_BREADY),
        .M03_AXI_bresp(microblaze_riscv_0_axi_periph_M03_AXI_BRESP),
        .M03_AXI_bvalid(microblaze_riscv_0_axi_periph_M03_AXI_BVALID),
        .M03_AXI_rdata(microblaze_riscv_0_axi_periph_M03_AXI_RDATA),
        .M03_AXI_rready(microblaze_riscv_0_axi_periph_M03_AXI_RREADY),
        .M03_AXI_rresp(microblaze_riscv_0_axi_periph_M03_AXI_RRESP),
        .M03_AXI_rvalid(microblaze_riscv_0_axi_periph_M03_AXI_RVALID),
        .M03_AXI_wdata(microblaze_riscv_0_axi_periph_M03_AXI_WDATA),
        .M03_AXI_wready(microblaze_riscv_0_axi_periph_M03_AXI_WREADY),
        .M03_AXI_wstrb(microblaze_riscv_0_axi_periph_M03_AXI_WSTRB),
        .M03_AXI_wvalid(microblaze_riscv_0_axi_periph_M03_AXI_WVALID),
        .M04_ACLK(microblaze_riscv_0_Clk),
        .M04_ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .M04_AXI_araddr(microblaze_riscv_0_axi_periph_M04_AXI_ARADDR),
        .M04_AXI_arready(microblaze_riscv_0_axi_periph_M04_AXI_ARREADY),
        .M04_AXI_arvalid(microblaze_riscv_0_axi_periph_M04_AXI_ARVALID),
        .M04_AXI_awaddr(microblaze_riscv_0_axi_periph_M04_AXI_AWADDR),
        .M04_AXI_awready(microblaze_riscv_0_axi_periph_M04_AXI_AWREADY),
        .M04_AXI_awvalid(microblaze_riscv_0_axi_periph_M04_AXI_AWVALID),
        .M04_AXI_bready(microblaze_riscv_0_axi_periph_M04_AXI_BREADY),
        .M04_AXI_bresp(microblaze_riscv_0_axi_periph_M04_AXI_BRESP),
        .M04_AXI_bvalid(microblaze_riscv_0_axi_periph_M04_AXI_BVALID),
        .M04_AXI_rdata(microblaze_riscv_0_axi_periph_M04_AXI_RDATA),
        .M04_AXI_rready(microblaze_riscv_0_axi_periph_M04_AXI_RREADY),
        .M04_AXI_rresp(microblaze_riscv_0_axi_periph_M04_AXI_RRESP),
        .M04_AXI_rvalid(microblaze_riscv_0_axi_periph_M04_AXI_RVALID),
        .M04_AXI_wdata(microblaze_riscv_0_axi_periph_M04_AXI_WDATA),
        .M04_AXI_wready(microblaze_riscv_0_axi_periph_M04_AXI_WREADY),
        .M04_AXI_wstrb(microblaze_riscv_0_axi_periph_M04_AXI_WSTRB),
        .M04_AXI_wvalid(microblaze_riscv_0_axi_periph_M04_AXI_WVALID),
        .M05_ACLK(microblaze_riscv_0_Clk),
        .M05_ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .M05_AXI_araddr(microblaze_riscv_0_axi_periph_M05_AXI_ARADDR),
        .M05_AXI_arburst(microblaze_riscv_0_axi_periph_M05_AXI_ARBURST),
        .M05_AXI_arcache(microblaze_riscv_0_axi_periph_M05_AXI_ARCACHE),
        .M05_AXI_arlen(microblaze_riscv_0_axi_periph_M05_AXI_ARLEN),
        .M05_AXI_arlock(microblaze_riscv_0_axi_periph_M05_AXI_ARLOCK),
        .M05_AXI_arprot(microblaze_riscv_0_axi_periph_M05_AXI_ARPROT),
        .M05_AXI_arready(microblaze_riscv_0_axi_periph_M05_AXI_ARREADY),
        .M05_AXI_arsize(microblaze_riscv_0_axi_periph_M05_AXI_ARSIZE),
        .M05_AXI_arvalid(microblaze_riscv_0_axi_periph_M05_AXI_ARVALID),
        .M05_AXI_awaddr(microblaze_riscv_0_axi_periph_M05_AXI_AWADDR),
        .M05_AXI_awburst(microblaze_riscv_0_axi_periph_M05_AXI_AWBURST),
        .M05_AXI_awcache(microblaze_riscv_0_axi_periph_M05_AXI_AWCACHE),
        .M05_AXI_awlen(microblaze_riscv_0_axi_periph_M05_AXI_AWLEN),
        .M05_AXI_awlock(microblaze_riscv_0_axi_periph_M05_AXI_AWLOCK),
        .M05_AXI_awprot(microblaze_riscv_0_axi_periph_M05_AXI_AWPROT),
        .M05_AXI_awready(microblaze_riscv_0_axi_periph_M05_AXI_AWREADY),
        .M05_AXI_awsize(microblaze_riscv_0_axi_periph_M05_AXI_AWSIZE),
        .M05_AXI_awvalid(microblaze_riscv_0_axi_periph_M05_AXI_AWVALID),
        .M05_AXI_bready(microblaze_riscv_0_axi_periph_M05_AXI_BREADY),
        .M05_AXI_bresp(microblaze_riscv_0_axi_periph_M05_AXI_BRESP),
        .M05_AXI_bvalid(microblaze_riscv_0_axi_periph_M05_AXI_BVALID),
        .M05_AXI_rdata(microblaze_riscv_0_axi_periph_M05_AXI_RDATA),
        .M05_AXI_rlast(microblaze_riscv_0_axi_periph_M05_AXI_RLAST),
        .M05_AXI_rready(microblaze_riscv_0_axi_periph_M05_AXI_RREADY),
        .M05_AXI_rresp(microblaze_riscv_0_axi_periph_M05_AXI_RRESP),
        .M05_AXI_rvalid(microblaze_riscv_0_axi_periph_M05_AXI_RVALID),
        .M05_AXI_wdata(microblaze_riscv_0_axi_periph_M05_AXI_WDATA),
        .M05_AXI_wlast(microblaze_riscv_0_axi_periph_M05_AXI_WLAST),
        .M05_AXI_wready(microblaze_riscv_0_axi_periph_M05_AXI_WREADY),
        .M05_AXI_wstrb(microblaze_riscv_0_axi_periph_M05_AXI_WSTRB),
        .M05_AXI_wvalid(microblaze_riscv_0_axi_periph_M05_AXI_WVALID),
        .M06_ACLK(microblaze_riscv_0_Clk),
        .M06_ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .M06_AXI_araddr(microblaze_riscv_0_axi_periph_M06_AXI_ARADDR),
        .M06_AXI_arready(microblaze_riscv_0_axi_periph_M06_AXI_ARREADY),
        .M06_AXI_arvalid(microblaze_riscv_0_axi_periph_M06_AXI_ARVALID),
        .M06_AXI_awaddr(microblaze_riscv_0_axi_periph_M06_AXI_AWADDR),
        .M06_AXI_awready(microblaze_riscv_0_axi_periph_M06_AXI_AWREADY),
        .M06_AXI_awvalid(microblaze_riscv_0_axi_periph_M06_AXI_AWVALID),
        .M06_AXI_bready(microblaze_riscv_0_axi_periph_M06_AXI_BREADY),
        .M06_AXI_bresp(microblaze_riscv_0_axi_periph_M06_AXI_BRESP),
        .M06_AXI_bvalid(microblaze_riscv_0_axi_periph_M06_AXI_BVALID),
        .M06_AXI_rdata(microblaze_riscv_0_axi_periph_M06_AXI_RDATA),
        .M06_AXI_rready(microblaze_riscv_0_axi_periph_M06_AXI_RREADY),
        .M06_AXI_rresp(microblaze_riscv_0_axi_periph_M06_AXI_RRESP),
        .M06_AXI_rvalid(microblaze_riscv_0_axi_periph_M06_AXI_RVALID),
        .M06_AXI_wdata(microblaze_riscv_0_axi_periph_M06_AXI_WDATA),
        .M06_AXI_wready(microblaze_riscv_0_axi_periph_M06_AXI_WREADY),
        .M06_AXI_wstrb(microblaze_riscv_0_axi_periph_M06_AXI_WSTRB),
        .M06_AXI_wvalid(microblaze_riscv_0_axi_periph_M06_AXI_WVALID),
        .S00_ACLK(microblaze_riscv_0_Clk),
        .S00_ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .S00_AXI_araddr(microblaze_riscv_0_axi_dp_ARADDR),
        .S00_AXI_arprot(microblaze_riscv_0_axi_dp_ARPROT),
        .S00_AXI_arready(microblaze_riscv_0_axi_dp_ARREADY),
        .S00_AXI_arvalid(microblaze_riscv_0_axi_dp_ARVALID),
        .S00_AXI_awaddr(microblaze_riscv_0_axi_dp_AWADDR),
        .S00_AXI_awprot(microblaze_riscv_0_axi_dp_AWPROT),
        .S00_AXI_awready(microblaze_riscv_0_axi_dp_AWREADY),
        .S00_AXI_awvalid(microblaze_riscv_0_axi_dp_AWVALID),
        .S00_AXI_bready(microblaze_riscv_0_axi_dp_BREADY),
        .S00_AXI_bresp(microblaze_riscv_0_axi_dp_BRESP),
        .S00_AXI_bvalid(microblaze_riscv_0_axi_dp_BVALID),
        .S00_AXI_rdata(microblaze_riscv_0_axi_dp_RDATA),
        .S00_AXI_rready(microblaze_riscv_0_axi_dp_RREADY),
        .S00_AXI_rresp(microblaze_riscv_0_axi_dp_RRESP),
        .S00_AXI_rvalid(microblaze_riscv_0_axi_dp_RVALID),
        .S00_AXI_wdata(microblaze_riscv_0_axi_dp_WDATA),
        .S00_AXI_wready(microblaze_riscv_0_axi_dp_WREADY),
        .S00_AXI_wstrb(microblaze_riscv_0_axi_dp_WSTRB),
        .S00_AXI_wvalid(microblaze_riscv_0_axi_dp_WVALID));
  microblaze_riscv_0_local_memory_imp_1TUIWYR microblaze_riscv_0_local_memory
       (.DLMB_abus(microblaze_riscv_0_dlmb_1_ABUS),
        .DLMB_addrstrobe(microblaze_riscv_0_dlmb_1_ADDRSTROBE),
        .DLMB_be(microblaze_riscv_0_dlmb_1_BE),
        .DLMB_ce(microblaze_riscv_0_dlmb_1_CE),
        .DLMB_readdbus(microblaze_riscv_0_dlmb_1_READDBUS),
        .DLMB_readstrobe(microblaze_riscv_0_dlmb_1_READSTROBE),
        .DLMB_ready(microblaze_riscv_0_dlmb_1_READY),
        .DLMB_ue(microblaze_riscv_0_dlmb_1_UE),
        .DLMB_wait(microblaze_riscv_0_dlmb_1_WAIT),
        .DLMB_writedbus(microblaze_riscv_0_dlmb_1_WRITEDBUS),
        .DLMB_writestrobe(microblaze_riscv_0_dlmb_1_WRITESTROBE),
        .ILMB_abus(microblaze_riscv_0_ilmb_1_ABUS),
        .ILMB_addrstrobe(microblaze_riscv_0_ilmb_1_ADDRSTROBE),
        .ILMB_ce(microblaze_riscv_0_ilmb_1_CE),
        .ILMB_readdbus(microblaze_riscv_0_ilmb_1_READDBUS),
        .ILMB_readstrobe(microblaze_riscv_0_ilmb_1_READSTROBE),
        .ILMB_ready(microblaze_riscv_0_ilmb_1_READY),
        .ILMB_ue(microblaze_riscv_0_ilmb_1_UE),
        .ILMB_wait(microblaze_riscv_0_ilmb_1_WAIT),
        .LMB_Clk(microblaze_riscv_0_Clk),
        .SYS_Rst(rst_clk_wiz_0_200M_bus_struct_reset));
  design_1_microblaze_riscv_0_xlconcat_2 microblaze_riscv_0_xlconcat
       (.In0(axi_timer_0_interrupt),
        .In1(axi_gpio_1_ip2intc_irpt),
        .In2(microsd_ip2intc_irpt),
        .dout(microblaze_riscv_0_intr));
  microsd_imp_MOJDFN microsd
       (.AXI_LITE_araddr(microblaze_riscv_0_axi_periph_M04_AXI_ARADDR),
        .AXI_LITE_arready(microblaze_riscv_0_axi_periph_M04_AXI_ARREADY),
        .AXI_LITE_arvalid(microblaze_riscv_0_axi_periph_M04_AXI_ARVALID),
        .AXI_LITE_awaddr(microblaze_riscv_0_axi_periph_M04_AXI_AWADDR),
        .AXI_LITE_awready(microblaze_riscv_0_axi_periph_M04_AXI_AWREADY),
        .AXI_LITE_awvalid(microblaze_riscv_0_axi_periph_M04_AXI_AWVALID),
        .AXI_LITE_bready(microblaze_riscv_0_axi_periph_M04_AXI_BREADY),
        .AXI_LITE_bresp(microblaze_riscv_0_axi_periph_M04_AXI_BRESP),
        .AXI_LITE_bvalid(microblaze_riscv_0_axi_periph_M04_AXI_BVALID),
        .AXI_LITE_rdata(microblaze_riscv_0_axi_periph_M04_AXI_RDATA),
        .AXI_LITE_rready(microblaze_riscv_0_axi_periph_M04_AXI_RREADY),
        .AXI_LITE_rresp(microblaze_riscv_0_axi_periph_M04_AXI_RRESP),
        .AXI_LITE_rvalid(microblaze_riscv_0_axi_periph_M04_AXI_RVALID),
        .AXI_LITE_wdata(microblaze_riscv_0_axi_periph_M04_AXI_WDATA),
        .AXI_LITE_wready(microblaze_riscv_0_axi_periph_M04_AXI_WREADY),
        .AXI_LITE_wstrb(microblaze_riscv_0_axi_periph_M04_AXI_WSTRB),
        .AXI_LITE_wvalid(microblaze_riscv_0_axi_periph_M04_AXI_WVALID),
        .SD_CMD(SD_CMD),
        .SD_DAT0(SD_DAT0),
        .SD_DAT3(SD_DAT3),
        .SD_RESET(SD_RESET),
        .SD_SCK(SD_SCK),
        .ip2intc_irpt(microsd_ip2intc_irpt),
        .reset(rst_clk_wiz_0_200M_peripheral_reset),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_aresetn(rst_clk_wiz_0_200M_peripheral_aresetn));
  design_1_mig_7series_0_0 mig_7series_0
       (.aresetn(rst_mig_7series_0_81M_peripheral_aresetn),
        .clk_ref_i(clk_wiz_0_clk_out2),
        .ddr2_addr(ddr2_sdram_addr),
        .ddr2_ba(ddr2_sdram_ba),
        .ddr2_cas_n(ddr2_sdram_cas_n),
        .ddr2_ck_n(ddr2_sdram_ck_n),
        .ddr2_ck_p(ddr2_sdram_ck_p),
        .ddr2_cke(ddr2_sdram_cke),
        .ddr2_cs_n(ddr2_sdram_cs_n),
        .ddr2_dm(ddr2_sdram_dm),
        .ddr2_dq(ddr2_sdram_dq),
        .ddr2_dqs_n(ddr2_sdram_dqs_n),
        .ddr2_dqs_p(ddr2_sdram_dqs_p),
        .ddr2_odt(ddr2_sdram_odt),
        .ddr2_ras_n(ddr2_sdram_ras_n),
        .ddr2_we_n(ddr2_sdram_we_n),
        .mmcm_locked(mig_7series_0_mmcm_locked),
        .s_axi_araddr(ram_interconnect_M00_AXI_ARADDR),
        .s_axi_arburst(ram_interconnect_M00_AXI_ARBURST),
        .s_axi_arcache(ram_interconnect_M00_AXI_ARCACHE),
        .s_axi_arid(ram_interconnect_M00_AXI_ARID),
        .s_axi_arlen(ram_interconnect_M00_AXI_ARLEN),
        .s_axi_arlock(ram_interconnect_M00_AXI_ARLOCK),
        .s_axi_arprot(ram_interconnect_M00_AXI_ARPROT),
        .s_axi_arqos(ram_interconnect_M00_AXI_ARQOS),
        .s_axi_arready(ram_interconnect_M00_AXI_ARREADY),
        .s_axi_arsize(ram_interconnect_M00_AXI_ARSIZE),
        .s_axi_arvalid(ram_interconnect_M00_AXI_ARVALID),
        .s_axi_awaddr(ram_interconnect_M00_AXI_AWADDR),
        .s_axi_awburst(ram_interconnect_M00_AXI_AWBURST),
        .s_axi_awcache(ram_interconnect_M00_AXI_AWCACHE),
        .s_axi_awid(ram_interconnect_M00_AXI_AWID),
        .s_axi_awlen(ram_interconnect_M00_AXI_AWLEN),
        .s_axi_awlock(ram_interconnect_M00_AXI_AWLOCK),
        .s_axi_awprot(ram_interconnect_M00_AXI_AWPROT),
        .s_axi_awqos(ram_interconnect_M00_AXI_AWQOS),
        .s_axi_awready(ram_interconnect_M00_AXI_AWREADY),
        .s_axi_awsize(ram_interconnect_M00_AXI_AWSIZE),
        .s_axi_awvalid(ram_interconnect_M00_AXI_AWVALID),
        .s_axi_bid(ram_interconnect_M00_AXI_BID),
        .s_axi_bready(ram_interconnect_M00_AXI_BREADY),
        .s_axi_bresp(ram_interconnect_M00_AXI_BRESP),
        .s_axi_bvalid(ram_interconnect_M00_AXI_BVALID),
        .s_axi_rdata(ram_interconnect_M00_AXI_RDATA),
        .s_axi_rid(ram_interconnect_M00_AXI_RID),
        .s_axi_rlast(ram_interconnect_M00_AXI_RLAST),
        .s_axi_rready(ram_interconnect_M00_AXI_RREADY),
        .s_axi_rresp(ram_interconnect_M00_AXI_RRESP),
        .s_axi_rvalid(ram_interconnect_M00_AXI_RVALID),
        .s_axi_wdata(ram_interconnect_M00_AXI_WDATA),
        .s_axi_wlast(ram_interconnect_M00_AXI_WLAST),
        .s_axi_wready(ram_interconnect_M00_AXI_WREADY),
        .s_axi_wstrb(ram_interconnect_M00_AXI_WSTRB),
        .s_axi_wvalid(ram_interconnect_M00_AXI_WVALID),
        .sys_clk_i(util_ds_buf_0_BUFG_O),
        .sys_rst(CPU_RESETN),
        .ui_clk(mig_7series_0_ui_clk),
        .ui_clk_sync_rst(mig_7series_0_ui_clk_sync_rst));
  design_1_axi_interconnect_0_2 ram_interconnect
       (.ACLK(microblaze_riscv_0_Clk),
        .ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .M00_ACLK(mig_7series_0_ui_clk),
        .M00_ARESETN(rst_mig_7series_0_81M_peripheral_aresetn),
        .M00_AXI_araddr(ram_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arburst(ram_interconnect_M00_AXI_ARBURST),
        .M00_AXI_arcache(ram_interconnect_M00_AXI_ARCACHE),
        .M00_AXI_arid(ram_interconnect_M00_AXI_ARID),
        .M00_AXI_arlen(ram_interconnect_M00_AXI_ARLEN),
        .M00_AXI_arlock(ram_interconnect_M00_AXI_ARLOCK),
        .M00_AXI_arprot(ram_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arqos(ram_interconnect_M00_AXI_ARQOS),
        .M00_AXI_arready(ram_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arsize(ram_interconnect_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(ram_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(ram_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awburst(ram_interconnect_M00_AXI_AWBURST),
        .M00_AXI_awcache(ram_interconnect_M00_AXI_AWCACHE),
        .M00_AXI_awid(ram_interconnect_M00_AXI_AWID),
        .M00_AXI_awlen(ram_interconnect_M00_AXI_AWLEN),
        .M00_AXI_awlock(ram_interconnect_M00_AXI_AWLOCK),
        .M00_AXI_awprot(ram_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awqos(ram_interconnect_M00_AXI_AWQOS),
        .M00_AXI_awready(ram_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awsize(ram_interconnect_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(ram_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bid(ram_interconnect_M00_AXI_BID),
        .M00_AXI_bready(ram_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(ram_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(ram_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(ram_interconnect_M00_AXI_RDATA),
        .M00_AXI_rid(ram_interconnect_M00_AXI_RID),
        .M00_AXI_rlast(ram_interconnect_M00_AXI_RLAST),
        .M00_AXI_rready(ram_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(ram_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(ram_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(ram_interconnect_M00_AXI_WDATA),
        .M00_AXI_wlast(ram_interconnect_M00_AXI_WLAST),
        .M00_AXI_wready(ram_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(ram_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(ram_interconnect_M00_AXI_WVALID),
        .S00_ACLK(microblaze_riscv_0_Clk),
        .S00_ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .S00_AXI_araddr(microblaze_riscv_0_M_AXI_DC_ARADDR),
        .S00_AXI_arburst(microblaze_riscv_0_M_AXI_DC_ARBURST),
        .S00_AXI_arcache(microblaze_riscv_0_M_AXI_DC_ARCACHE),
        .S00_AXI_arlen(microblaze_riscv_0_M_AXI_DC_ARLEN),
        .S00_AXI_arlock(microblaze_riscv_0_M_AXI_DC_ARLOCK),
        .S00_AXI_arprot(microblaze_riscv_0_M_AXI_DC_ARPROT),
        .S00_AXI_arqos(microblaze_riscv_0_M_AXI_DC_ARQOS),
        .S00_AXI_arready(microblaze_riscv_0_M_AXI_DC_ARREADY),
        .S00_AXI_arsize(microblaze_riscv_0_M_AXI_DC_ARSIZE),
        .S00_AXI_arvalid(microblaze_riscv_0_M_AXI_DC_ARVALID),
        .S00_AXI_awaddr(microblaze_riscv_0_M_AXI_DC_AWADDR),
        .S00_AXI_awburst(microblaze_riscv_0_M_AXI_DC_AWBURST),
        .S00_AXI_awcache(microblaze_riscv_0_M_AXI_DC_AWCACHE),
        .S00_AXI_awlen(microblaze_riscv_0_M_AXI_DC_AWLEN),
        .S00_AXI_awlock(microblaze_riscv_0_M_AXI_DC_AWLOCK),
        .S00_AXI_awprot(microblaze_riscv_0_M_AXI_DC_AWPROT),
        .S00_AXI_awqos(microblaze_riscv_0_M_AXI_DC_AWQOS),
        .S00_AXI_awready(microblaze_riscv_0_M_AXI_DC_AWREADY),
        .S00_AXI_awsize(microblaze_riscv_0_M_AXI_DC_AWSIZE),
        .S00_AXI_awvalid(microblaze_riscv_0_M_AXI_DC_AWVALID),
        .S00_AXI_bready(microblaze_riscv_0_M_AXI_DC_BREADY),
        .S00_AXI_bresp(microblaze_riscv_0_M_AXI_DC_BRESP),
        .S00_AXI_bvalid(microblaze_riscv_0_M_AXI_DC_BVALID),
        .S00_AXI_rdata(microblaze_riscv_0_M_AXI_DC_RDATA),
        .S00_AXI_rlast(microblaze_riscv_0_M_AXI_DC_RLAST),
        .S00_AXI_rready(microblaze_riscv_0_M_AXI_DC_RREADY),
        .S00_AXI_rresp(microblaze_riscv_0_M_AXI_DC_RRESP),
        .S00_AXI_rvalid(microblaze_riscv_0_M_AXI_DC_RVALID),
        .S00_AXI_wdata(microblaze_riscv_0_M_AXI_DC_WDATA),
        .S00_AXI_wlast(microblaze_riscv_0_M_AXI_DC_WLAST),
        .S00_AXI_wready(microblaze_riscv_0_M_AXI_DC_WREADY),
        .S00_AXI_wstrb(microblaze_riscv_0_M_AXI_DC_WSTRB),
        .S00_AXI_wvalid(microblaze_riscv_0_M_AXI_DC_WVALID),
        .S01_ACLK(microblaze_riscv_0_Clk),
        .S01_ARESETN(rst_clk_wiz_0_200M_peripheral_aresetn),
        .S01_AXI_araddr(microblaze_riscv_0_M_AXI_IC_ARADDR),
        .S01_AXI_arburst(microblaze_riscv_0_M_AXI_IC_ARBURST),
        .S01_AXI_arcache(microblaze_riscv_0_M_AXI_IC_ARCACHE),
        .S01_AXI_arlen(microblaze_riscv_0_M_AXI_IC_ARLEN),
        .S01_AXI_arlock(microblaze_riscv_0_M_AXI_IC_ARLOCK),
        .S01_AXI_arprot(microblaze_riscv_0_M_AXI_IC_ARPROT),
        .S01_AXI_arqos(microblaze_riscv_0_M_AXI_IC_ARQOS),
        .S01_AXI_arready(microblaze_riscv_0_M_AXI_IC_ARREADY),
        .S01_AXI_arsize(microblaze_riscv_0_M_AXI_IC_ARSIZE),
        .S01_AXI_arvalid(microblaze_riscv_0_M_AXI_IC_ARVALID),
        .S01_AXI_rdata(microblaze_riscv_0_M_AXI_IC_RDATA),
        .S01_AXI_rlast(microblaze_riscv_0_M_AXI_IC_RLAST),
        .S01_AXI_rready(microblaze_riscv_0_M_AXI_IC_RREADY),
        .S01_AXI_rresp(microblaze_riscv_0_M_AXI_IC_RRESP),
        .S01_AXI_rvalid(microblaze_riscv_0_M_AXI_IC_RVALID));
  design_1_rst_clk_wiz_0_200M_2 rst_clk_wiz_0_200M
       (.aux_reset_in(1'b1),
        .bus_struct_reset(rst_clk_wiz_0_200M_bus_struct_reset),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(CPU_RESETN),
        .mb_debug_sys_rst(mdm_1_debug_sys_rst),
        .mb_reset(rst_clk_wiz_0_200M_mb_reset),
        .peripheral_aresetn(rst_clk_wiz_0_200M_peripheral_aresetn),
        .peripheral_reset(rst_clk_wiz_0_200M_peripheral_reset),
        .slowest_sync_clk(microblaze_riscv_0_Clk));
  design_1_rst_mig_7series_0_81M_1 rst_mig_7series_0_81M
       (.aux_reset_in(1'b1),
        .dcm_locked(mig_7series_0_mmcm_locked),
        .ext_reset_in(mig_7series_0_ui_clk_sync_rst),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_mig_7series_0_81M_peripheral_aresetn),
        .slowest_sync_clk(mig_7series_0_ui_clk));
  design_1_util_ds_buf_0_0 util_ds_buf_0
       (.BUFG_I(CLK100MHZ),
        .BUFG_O(util_ds_buf_0_BUFG_O));
endmodule

module design_1_axi_interconnect_0_2
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    S01_ACLK,
    S01_ARESETN,
    S01_AXI_araddr,
    S01_AXI_arburst,
    S01_AXI_arcache,
    S01_AXI_arlen,
    S01_AXI_arlock,
    S01_AXI_arprot,
    S01_AXI_arqos,
    S01_AXI_arready,
    S01_AXI_arsize,
    S01_AXI_arvalid,
    S01_AXI_rdata,
    S01_AXI_rlast,
    S01_AXI_rready,
    S01_AXI_rresp,
    S01_AXI_rvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [26:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [0:0]M00_AXI_arid;
  output [7:0]M00_AXI_arlen;
  output [0:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [26:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [0:0]M00_AXI_awid;
  output [7:0]M00_AXI_awlen;
  output [0:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [0:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [127:0]M00_AXI_rdata;
  input [0:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [127:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [15:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [7:0]S00_AXI_arlen;
  input [0:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [7:0]S00_AXI_awlen;
  input [0:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;
  input S01_ACLK;
  input S01_ARESETN;
  input [31:0]S01_AXI_araddr;
  input [1:0]S01_AXI_arburst;
  input [3:0]S01_AXI_arcache;
  input [7:0]S01_AXI_arlen;
  input [0:0]S01_AXI_arlock;
  input [2:0]S01_AXI_arprot;
  input [3:0]S01_AXI_arqos;
  output S01_AXI_arready;
  input [2:0]S01_AXI_arsize;
  input S01_AXI_arvalid;
  output [31:0]S01_AXI_rdata;
  output S01_AXI_rlast;
  input S01_AXI_rready;
  output [1:0]S01_AXI_rresp;
  output S01_AXI_rvalid;

  wire ACLK;
  wire ARESETN;
  wire M00_ACLK;
  wire M00_ARESETN;
  wire [26:0]M00_AXI_araddr;
  wire [1:0]M00_AXI_arburst;
  wire [3:0]M00_AXI_arcache;
  wire [0:0]M00_AXI_arid;
  wire [7:0]M00_AXI_arlen;
  wire [0:0]M00_AXI_arlock;
  wire [2:0]M00_AXI_arprot;
  wire [3:0]M00_AXI_arqos;
  wire M00_AXI_arready;
  wire [2:0]M00_AXI_arsize;
  wire M00_AXI_arvalid;
  wire [26:0]M00_AXI_awaddr;
  wire [1:0]M00_AXI_awburst;
  wire [3:0]M00_AXI_awcache;
  wire [0:0]M00_AXI_awid;
  wire [7:0]M00_AXI_awlen;
  wire [0:0]M00_AXI_awlock;
  wire [2:0]M00_AXI_awprot;
  wire [3:0]M00_AXI_awqos;
  wire M00_AXI_awready;
  wire [2:0]M00_AXI_awsize;
  wire M00_AXI_awvalid;
  wire [0:0]M00_AXI_bid;
  wire M00_AXI_bready;
  wire [1:0]M00_AXI_bresp;
  wire M00_AXI_bvalid;
  wire [127:0]M00_AXI_rdata;
  wire [0:0]M00_AXI_rid;
  wire M00_AXI_rlast;
  wire M00_AXI_rready;
  wire [1:0]M00_AXI_rresp;
  wire M00_AXI_rvalid;
  wire [127:0]M00_AXI_wdata;
  wire M00_AXI_wlast;
  wire M00_AXI_wready;
  wire [15:0]M00_AXI_wstrb;
  wire M00_AXI_wvalid;
  wire S00_ACLK;
  wire S00_ARESETN;
  wire [31:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [7:0]S00_AXI_arlen;
  wire [0:0]S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire S00_AXI_arready;
  wire [2:0]S00_AXI_arsize;
  wire S00_AXI_arvalid;
  wire [31:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [3:0]S00_AXI_awcache;
  wire [7:0]S00_AXI_awlen;
  wire [0:0]S00_AXI_awlock;
  wire [2:0]S00_AXI_awprot;
  wire [3:0]S00_AXI_awqos;
  wire S00_AXI_awready;
  wire [2:0]S00_AXI_awsize;
  wire S00_AXI_awvalid;
  wire S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire S00_AXI_bvalid;
  wire [31:0]S00_AXI_rdata;
  wire S00_AXI_rlast;
  wire S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire S00_AXI_rvalid;
  wire [31:0]S00_AXI_wdata;
  wire S00_AXI_wlast;
  wire S00_AXI_wready;
  wire [3:0]S00_AXI_wstrb;
  wire S00_AXI_wvalid;
  wire S01_ACLK;
  wire S01_ARESETN;
  wire [31:0]S01_AXI_araddr;
  wire [1:0]S01_AXI_arburst;
  wire [3:0]S01_AXI_arcache;
  wire [7:0]S01_AXI_arlen;
  wire [0:0]S01_AXI_arlock;
  wire [2:0]S01_AXI_arprot;
  wire [3:0]S01_AXI_arqos;
  wire S01_AXI_arready;
  wire [2:0]S01_AXI_arsize;
  wire S01_AXI_arvalid;
  wire [31:0]S01_AXI_rdata;
  wire S01_AXI_rlast;
  wire S01_AXI_rready;
  wire [1:0]S01_AXI_rresp;
  wire S01_AXI_rvalid;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire [0:0]s00_couplers_to_xbar_ARLOCK;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [3:0]s00_couplers_to_xbar_ARQOS;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [1:0]s00_couplers_to_xbar_AWBURST;
  wire [3:0]s00_couplers_to_xbar_AWCACHE;
  wire [7:0]s00_couplers_to_xbar_AWLEN;
  wire [0:0]s00_couplers_to_xbar_AWLOCK;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [3:0]s00_couplers_to_xbar_AWQOS;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [2:0]s00_couplers_to_xbar_AWSIZE;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [127:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [127:0]s00_couplers_to_xbar_WDATA;
  wire s00_couplers_to_xbar_WLAST;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [15:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]s01_couplers_to_xbar_ARADDR;
  wire [1:0]s01_couplers_to_xbar_ARBURST;
  wire [3:0]s01_couplers_to_xbar_ARCACHE;
  wire [7:0]s01_couplers_to_xbar_ARLEN;
  wire [0:0]s01_couplers_to_xbar_ARLOCK;
  wire [2:0]s01_couplers_to_xbar_ARPROT;
  wire [3:0]s01_couplers_to_xbar_ARQOS;
  wire [1:1]s01_couplers_to_xbar_ARREADY;
  wire [2:0]s01_couplers_to_xbar_ARSIZE;
  wire s01_couplers_to_xbar_ARVALID;
  wire [255:128]s01_couplers_to_xbar_RDATA;
  wire [1:1]s01_couplers_to_xbar_RLAST;
  wire s01_couplers_to_xbar_RREADY;
  wire [3:2]s01_couplers_to_xbar_RRESP;
  wire [1:1]s01_couplers_to_xbar_RVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [0:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [0:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [127:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [127:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [15:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;

  m00_couplers_imp_1U2PGAU m00_couplers
       (.M_ACLK(M00_ACLK),
        .M_ARESETN(M00_ARESETN),
        .M_AXI_araddr(M00_AXI_araddr),
        .M_AXI_arburst(M00_AXI_arburst),
        .M_AXI_arcache(M00_AXI_arcache),
        .M_AXI_arid(M00_AXI_arid),
        .M_AXI_arlen(M00_AXI_arlen),
        .M_AXI_arlock(M00_AXI_arlock),
        .M_AXI_arprot(M00_AXI_arprot),
        .M_AXI_arqos(M00_AXI_arqos),
        .M_AXI_arready(M00_AXI_arready),
        .M_AXI_arsize(M00_AXI_arsize),
        .M_AXI_arvalid(M00_AXI_arvalid),
        .M_AXI_awaddr(M00_AXI_awaddr),
        .M_AXI_awburst(M00_AXI_awburst),
        .M_AXI_awcache(M00_AXI_awcache),
        .M_AXI_awid(M00_AXI_awid),
        .M_AXI_awlen(M00_AXI_awlen),
        .M_AXI_awlock(M00_AXI_awlock),
        .M_AXI_awprot(M00_AXI_awprot),
        .M_AXI_awqos(M00_AXI_awqos),
        .M_AXI_awready(M00_AXI_awready),
        .M_AXI_awsize(M00_AXI_awsize),
        .M_AXI_awvalid(M00_AXI_awvalid),
        .M_AXI_bid(M00_AXI_bid),
        .M_AXI_bready(M00_AXI_bready),
        .M_AXI_bresp(M00_AXI_bresp),
        .M_AXI_bvalid(M00_AXI_bvalid),
        .M_AXI_rdata(M00_AXI_rdata),
        .M_AXI_rid(M00_AXI_rid),
        .M_AXI_rlast(M00_AXI_rlast),
        .M_AXI_rready(M00_AXI_rready),
        .M_AXI_rresp(M00_AXI_rresp),
        .M_AXI_rvalid(M00_AXI_rvalid),
        .M_AXI_wdata(M00_AXI_wdata),
        .M_AXI_wlast(M00_AXI_wlast),
        .M_AXI_wready(M00_AXI_wready),
        .M_AXI_wstrb(M00_AXI_wstrb),
        .M_AXI_wvalid(M00_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  s00_couplers_imp_6EVSLG s00_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s00_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s00_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s00_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s00_couplers_to_xbar_AWCACHE),
        .M_AXI_awlen(s00_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s00_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s00_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s00_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s00_couplers_to_xbar_WLAST),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK),
        .S_ARESETN(S00_ARESETN),
        .S_AXI_araddr(S00_AXI_araddr),
        .S_AXI_arburst(S00_AXI_arburst),
        .S_AXI_arcache(S00_AXI_arcache),
        .S_AXI_arlen(S00_AXI_arlen),
        .S_AXI_arlock(S00_AXI_arlock),
        .S_AXI_arprot(S00_AXI_arprot),
        .S_AXI_arqos(S00_AXI_arqos),
        .S_AXI_arready(S00_AXI_arready),
        .S_AXI_arsize(S00_AXI_arsize),
        .S_AXI_arvalid(S00_AXI_arvalid),
        .S_AXI_awaddr(S00_AXI_awaddr),
        .S_AXI_awburst(S00_AXI_awburst),
        .S_AXI_awcache(S00_AXI_awcache),
        .S_AXI_awlen(S00_AXI_awlen),
        .S_AXI_awlock(S00_AXI_awlock),
        .S_AXI_awprot(S00_AXI_awprot),
        .S_AXI_awqos(S00_AXI_awqos),
        .S_AXI_awready(S00_AXI_awready),
        .S_AXI_awsize(S00_AXI_awsize),
        .S_AXI_awvalid(S00_AXI_awvalid),
        .S_AXI_bready(S00_AXI_bready),
        .S_AXI_bresp(S00_AXI_bresp),
        .S_AXI_bvalid(S00_AXI_bvalid),
        .S_AXI_rdata(S00_AXI_rdata),
        .S_AXI_rlast(S00_AXI_rlast),
        .S_AXI_rready(S00_AXI_rready),
        .S_AXI_rresp(S00_AXI_rresp),
        .S_AXI_rvalid(S00_AXI_rvalid),
        .S_AXI_wdata(S00_AXI_wdata),
        .S_AXI_wlast(S00_AXI_wlast),
        .S_AXI_wready(S00_AXI_wready),
        .S_AXI_wstrb(S00_AXI_wstrb),
        .S_AXI_wvalid(S00_AXI_wvalid));
  s01_couplers_imp_1WWBO11 s01_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(s01_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s01_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s01_couplers_to_xbar_ARCACHE),
        .M_AXI_arlen(s01_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s01_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s01_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s01_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s01_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s01_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s01_couplers_to_xbar_ARVALID),
        .M_AXI_rdata(s01_couplers_to_xbar_RDATA),
        .M_AXI_rlast(s01_couplers_to_xbar_RLAST),
        .M_AXI_rready(s01_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s01_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s01_couplers_to_xbar_RVALID),
        .S_ACLK(S01_ACLK),
        .S_ARESETN(S01_ARESETN),
        .S_AXI_araddr(S01_AXI_araddr),
        .S_AXI_arburst(S01_AXI_arburst),
        .S_AXI_arcache(S01_AXI_arcache),
        .S_AXI_arlen(S01_AXI_arlen),
        .S_AXI_arlock(S01_AXI_arlock),
        .S_AXI_arprot(S01_AXI_arprot),
        .S_AXI_arqos(S01_AXI_arqos),
        .S_AXI_arready(S01_AXI_arready),
        .S_AXI_arsize(S01_AXI_arsize),
        .S_AXI_arvalid(S01_AXI_arvalid),
        .S_AXI_rdata(S01_AXI_rdata),
        .S_AXI_rlast(S01_AXI_rlast),
        .S_AXI_rready(S01_AXI_rready),
        .S_AXI_rresp(S01_AXI_rresp),
        .S_AXI_rvalid(S01_AXI_rvalid));
  design_1_axi_interconnect_0_imp_xbar_2 xbar
       (.aclk(ACLK),
        .aresetn(ARESETN),
        .m_axi_araddr(xbar_to_m00_couplers_ARADDR),
        .m_axi_arburst(xbar_to_m00_couplers_ARBURST),
        .m_axi_arcache(xbar_to_m00_couplers_ARCACHE),
        .m_axi_arid(xbar_to_m00_couplers_ARID),
        .m_axi_arlen(xbar_to_m00_couplers_ARLEN),
        .m_axi_arlock(xbar_to_m00_couplers_ARLOCK),
        .m_axi_arprot(xbar_to_m00_couplers_ARPROT),
        .m_axi_arqos(xbar_to_m00_couplers_ARQOS),
        .m_axi_arready(xbar_to_m00_couplers_ARREADY),
        .m_axi_arregion(xbar_to_m00_couplers_ARREGION),
        .m_axi_arsize(xbar_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(xbar_to_m00_couplers_ARVALID),
        .m_axi_awaddr(xbar_to_m00_couplers_AWADDR),
        .m_axi_awburst(xbar_to_m00_couplers_AWBURST),
        .m_axi_awcache(xbar_to_m00_couplers_AWCACHE),
        .m_axi_awid(xbar_to_m00_couplers_AWID),
        .m_axi_awlen(xbar_to_m00_couplers_AWLEN),
        .m_axi_awlock(xbar_to_m00_couplers_AWLOCK),
        .m_axi_awprot(xbar_to_m00_couplers_AWPROT),
        .m_axi_awqos(xbar_to_m00_couplers_AWQOS),
        .m_axi_awready(xbar_to_m00_couplers_AWREADY),
        .m_axi_awregion(xbar_to_m00_couplers_AWREGION),
        .m_axi_awsize(xbar_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(xbar_to_m00_couplers_AWVALID),
        .m_axi_bid(xbar_to_m00_couplers_BID),
        .m_axi_bready(xbar_to_m00_couplers_BREADY),
        .m_axi_bresp(xbar_to_m00_couplers_BRESP),
        .m_axi_bvalid(xbar_to_m00_couplers_BVALID),
        .m_axi_rdata(xbar_to_m00_couplers_RDATA),
        .m_axi_rid(xbar_to_m00_couplers_RID),
        .m_axi_rlast(xbar_to_m00_couplers_RLAST),
        .m_axi_rready(xbar_to_m00_couplers_RREADY),
        .m_axi_rresp(xbar_to_m00_couplers_RRESP),
        .m_axi_rvalid(xbar_to_m00_couplers_RVALID),
        .m_axi_wdata(xbar_to_m00_couplers_WDATA),
        .m_axi_wlast(xbar_to_m00_couplers_WLAST),
        .m_axi_wready(xbar_to_m00_couplers_WREADY),
        .m_axi_wstrb(xbar_to_m00_couplers_WSTRB),
        .m_axi_wvalid(xbar_to_m00_couplers_WVALID),
        .s_axi_araddr({s01_couplers_to_xbar_ARADDR,s00_couplers_to_xbar_ARADDR}),
        .s_axi_arburst({s01_couplers_to_xbar_ARBURST,s00_couplers_to_xbar_ARBURST}),
        .s_axi_arcache({s01_couplers_to_xbar_ARCACHE,s00_couplers_to_xbar_ARCACHE}),
        .s_axi_arid({1'b0,1'b0}),
        .s_axi_arlen({s01_couplers_to_xbar_ARLEN,s00_couplers_to_xbar_ARLEN}),
        .s_axi_arlock({s01_couplers_to_xbar_ARLOCK,s00_couplers_to_xbar_ARLOCK}),
        .s_axi_arprot({s01_couplers_to_xbar_ARPROT,s00_couplers_to_xbar_ARPROT}),
        .s_axi_arqos({s01_couplers_to_xbar_ARQOS,s00_couplers_to_xbar_ARQOS}),
        .s_axi_arready({s01_couplers_to_xbar_ARREADY,s00_couplers_to_xbar_ARREADY}),
        .s_axi_arsize({s01_couplers_to_xbar_ARSIZE,s00_couplers_to_xbar_ARSIZE}),
        .s_axi_arvalid({s01_couplers_to_xbar_ARVALID,s00_couplers_to_xbar_ARVALID}),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_AWADDR}),
        .s_axi_awburst({1'b0,1'b0,s00_couplers_to_xbar_AWBURST}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_AWCACHE}),
        .s_axi_awid({1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_AWLEN}),
        .s_axi_awlock({1'b0,s00_couplers_to_xbar_AWLOCK}),
        .s_axi_awprot({1'b0,1'b0,1'b0,s00_couplers_to_xbar_AWPROT}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_AWQOS}),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awsize({1'b1,1'b0,1'b0,s00_couplers_to_xbar_AWSIZE}),
        .s_axi_awvalid({1'b0,s00_couplers_to_xbar_AWVALID}),
        .s_axi_bready({1'b0,s00_couplers_to_xbar_BREADY}),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata({s01_couplers_to_xbar_RDATA,s00_couplers_to_xbar_RDATA}),
        .s_axi_rlast({s01_couplers_to_xbar_RLAST,s00_couplers_to_xbar_RLAST}),
        .s_axi_rready({s01_couplers_to_xbar_RREADY,s00_couplers_to_xbar_RREADY}),
        .s_axi_rresp({s01_couplers_to_xbar_RRESP,s00_couplers_to_xbar_RRESP}),
        .s_axi_rvalid({s01_couplers_to_xbar_RVALID,s00_couplers_to_xbar_RVALID}),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_WDATA}),
        .s_axi_wlast({1'b0,s00_couplers_to_xbar_WLAST}),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,s00_couplers_to_xbar_WSTRB}),
        .s_axi_wvalid({1'b0,s00_couplers_to_xbar_WVALID}));
endmodule

module design_1_microblaze_riscv_0_axi_periph_2
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arburst,
    M05_AXI_arcache,
    M05_AXI_arlen,
    M05_AXI_arlock,
    M05_AXI_arprot,
    M05_AXI_arready,
    M05_AXI_arsize,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awburst,
    M05_AXI_awcache,
    M05_AXI_awlen,
    M05_AXI_awlock,
    M05_AXI_awprot,
    M05_AXI_awready,
    M05_AXI_awsize,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rlast,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wlast,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_ACLK,
    M06_ARESETN,
    M06_AXI_araddr,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  input [0:0]M02_AXI_arready;
  output [0:0]M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input [0:0]M02_AXI_awready;
  output [0:0]M02_AXI_awvalid;
  output [0:0]M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input [0:0]M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output [0:0]M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input [0:0]M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input [0:0]M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output [0:0]M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [31:0]M03_AXI_araddr;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [31:0]M03_AXI_awaddr;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [31:0]M04_AXI_araddr;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  input M05_ACLK;
  input M05_ARESETN;
  output [16:0]M05_AXI_araddr;
  output [1:0]M05_AXI_arburst;
  output [3:0]M05_AXI_arcache;
  output [7:0]M05_AXI_arlen;
  output M05_AXI_arlock;
  output [2:0]M05_AXI_arprot;
  input M05_AXI_arready;
  output [2:0]M05_AXI_arsize;
  output M05_AXI_arvalid;
  output [16:0]M05_AXI_awaddr;
  output [1:0]M05_AXI_awburst;
  output [3:0]M05_AXI_awcache;
  output [7:0]M05_AXI_awlen;
  output M05_AXI_awlock;
  output [2:0]M05_AXI_awprot;
  input M05_AXI_awready;
  output [2:0]M05_AXI_awsize;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  input M05_AXI_rlast;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  output M05_AXI_wlast;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  input M06_ACLK;
  input M06_ARESETN;
  output [31:0]M06_AXI_araddr;
  input M06_AXI_arready;
  output M06_AXI_arvalid;
  output [31:0]M06_AXI_awaddr;
  input M06_AXI_awready;
  output M06_AXI_awvalid;
  output M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output M06_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [0:0]S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output [0:0]S00_AXI_awready;
  input [0:0]S00_AXI_awvalid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;

  wire ACLK;
  wire ARESETN;
  wire [31:0]M00_AXI_araddr;
  wire M00_AXI_arready;
  wire M00_AXI_arvalid;
  wire [31:0]M00_AXI_awaddr;
  wire M00_AXI_awready;
  wire M00_AXI_awvalid;
  wire M00_AXI_bready;
  wire [1:0]M00_AXI_bresp;
  wire M00_AXI_bvalid;
  wire [31:0]M00_AXI_rdata;
  wire M00_AXI_rready;
  wire [1:0]M00_AXI_rresp;
  wire M00_AXI_rvalid;
  wire [31:0]M00_AXI_wdata;
  wire M00_AXI_wready;
  wire [3:0]M00_AXI_wstrb;
  wire M00_AXI_wvalid;
  wire [31:0]M01_AXI_araddr;
  wire M01_AXI_arready;
  wire M01_AXI_arvalid;
  wire [31:0]M01_AXI_awaddr;
  wire M01_AXI_awready;
  wire M01_AXI_awvalid;
  wire M01_AXI_bready;
  wire [1:0]M01_AXI_bresp;
  wire M01_AXI_bvalid;
  wire [31:0]M01_AXI_rdata;
  wire M01_AXI_rready;
  wire [1:0]M01_AXI_rresp;
  wire M01_AXI_rvalid;
  wire [31:0]M01_AXI_wdata;
  wire M01_AXI_wready;
  wire [3:0]M01_AXI_wstrb;
  wire M01_AXI_wvalid;
  wire [31:0]M02_AXI_araddr;
  wire [0:0]M02_AXI_arready;
  wire [0:0]M02_AXI_arvalid;
  wire [31:0]M02_AXI_awaddr;
  wire [0:0]M02_AXI_awready;
  wire [0:0]M02_AXI_awvalid;
  wire [0:0]M02_AXI_bready;
  wire [1:0]M02_AXI_bresp;
  wire [0:0]M02_AXI_bvalid;
  wire [31:0]M02_AXI_rdata;
  wire [0:0]M02_AXI_rready;
  wire [1:0]M02_AXI_rresp;
  wire [0:0]M02_AXI_rvalid;
  wire [31:0]M02_AXI_wdata;
  wire [0:0]M02_AXI_wready;
  wire [3:0]M02_AXI_wstrb;
  wire [0:0]M02_AXI_wvalid;
  wire [31:0]M03_AXI_araddr;
  wire M03_AXI_arready;
  wire M03_AXI_arvalid;
  wire [31:0]M03_AXI_awaddr;
  wire M03_AXI_awready;
  wire M03_AXI_awvalid;
  wire M03_AXI_bready;
  wire [1:0]M03_AXI_bresp;
  wire M03_AXI_bvalid;
  wire [31:0]M03_AXI_rdata;
  wire M03_AXI_rready;
  wire [1:0]M03_AXI_rresp;
  wire M03_AXI_rvalid;
  wire [31:0]M03_AXI_wdata;
  wire M03_AXI_wready;
  wire [3:0]M03_AXI_wstrb;
  wire M03_AXI_wvalid;
  wire [31:0]M04_AXI_araddr;
  wire M04_AXI_arready;
  wire M04_AXI_arvalid;
  wire [31:0]M04_AXI_awaddr;
  wire M04_AXI_awready;
  wire M04_AXI_awvalid;
  wire M04_AXI_bready;
  wire [1:0]M04_AXI_bresp;
  wire M04_AXI_bvalid;
  wire [31:0]M04_AXI_rdata;
  wire M04_AXI_rready;
  wire [1:0]M04_AXI_rresp;
  wire M04_AXI_rvalid;
  wire [31:0]M04_AXI_wdata;
  wire M04_AXI_wready;
  wire [3:0]M04_AXI_wstrb;
  wire M04_AXI_wvalid;
  wire [16:0]M05_AXI_araddr;
  wire [1:0]M05_AXI_arburst;
  wire [3:0]M05_AXI_arcache;
  wire [7:0]M05_AXI_arlen;
  wire M05_AXI_arlock;
  wire [2:0]M05_AXI_arprot;
  wire M05_AXI_arready;
  wire [2:0]M05_AXI_arsize;
  wire M05_AXI_arvalid;
  wire [16:0]M05_AXI_awaddr;
  wire [1:0]M05_AXI_awburst;
  wire [3:0]M05_AXI_awcache;
  wire [7:0]M05_AXI_awlen;
  wire M05_AXI_awlock;
  wire [2:0]M05_AXI_awprot;
  wire M05_AXI_awready;
  wire [2:0]M05_AXI_awsize;
  wire M05_AXI_awvalid;
  wire M05_AXI_bready;
  wire [1:0]M05_AXI_bresp;
  wire M05_AXI_bvalid;
  wire [31:0]M05_AXI_rdata;
  wire M05_AXI_rlast;
  wire M05_AXI_rready;
  wire [1:0]M05_AXI_rresp;
  wire M05_AXI_rvalid;
  wire [31:0]M05_AXI_wdata;
  wire M05_AXI_wlast;
  wire M05_AXI_wready;
  wire [3:0]M05_AXI_wstrb;
  wire M05_AXI_wvalid;
  wire [31:0]M06_AXI_araddr;
  wire M06_AXI_arready;
  wire M06_AXI_arvalid;
  wire [31:0]M06_AXI_awaddr;
  wire M06_AXI_awready;
  wire M06_AXI_awvalid;
  wire M06_AXI_bready;
  wire [1:0]M06_AXI_bresp;
  wire M06_AXI_bvalid;
  wire [31:0]M06_AXI_rdata;
  wire M06_AXI_rready;
  wire [1:0]M06_AXI_rresp;
  wire M06_AXI_rvalid;
  wire [31:0]M06_AXI_wdata;
  wire M06_AXI_wready;
  wire [3:0]M06_AXI_wstrb;
  wire M06_AXI_wvalid;
  wire [31:0]S00_AXI_araddr;
  wire [2:0]S00_AXI_arprot;
  wire [0:0]S00_AXI_arready;
  wire [0:0]S00_AXI_arvalid;
  wire [31:0]S00_AXI_awaddr;
  wire [2:0]S00_AXI_awprot;
  wire [0:0]S00_AXI_awready;
  wire [0:0]S00_AXI_awvalid;
  wire [0:0]S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire [0:0]S00_AXI_bvalid;
  wire [31:0]S00_AXI_rdata;
  wire [0:0]S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire [0:0]S00_AXI_rvalid;
  wire [31:0]S00_AXI_wdata;
  wire [0:0]S00_AXI_wready;
  wire [3:0]S00_AXI_wstrb;
  wire [0:0]S00_AXI_wvalid;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [0:0]s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [0:0]s00_couplers_to_xbar_AWVALID;
  wire [0:0]s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire [0:0]s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [0:0]xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [0:0]xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire [0:0]xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire [0:0]xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [0:0]xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [127:96]xbar_to_m03_couplers_ARADDR;
  wire xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [127:96]xbar_to_m03_couplers_AWADDR;
  wire xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [159:128]xbar_to_m04_couplers_ARADDR;
  wire xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [159:128]xbar_to_m04_couplers_AWADDR;
  wire xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [191:160]xbar_to_m05_couplers_ARADDR;
  wire [17:15]xbar_to_m05_couplers_ARPROT;
  wire xbar_to_m05_couplers_ARREADY;
  wire [5:5]xbar_to_m05_couplers_ARVALID;
  wire [191:160]xbar_to_m05_couplers_AWADDR;
  wire [17:15]xbar_to_m05_couplers_AWPROT;
  wire xbar_to_m05_couplers_AWREADY;
  wire [5:5]xbar_to_m05_couplers_AWVALID;
  wire [5:5]xbar_to_m05_couplers_BREADY;
  wire [1:0]xbar_to_m05_couplers_BRESP;
  wire xbar_to_m05_couplers_BVALID;
  wire [31:0]xbar_to_m05_couplers_RDATA;
  wire [5:5]xbar_to_m05_couplers_RREADY;
  wire [1:0]xbar_to_m05_couplers_RRESP;
  wire xbar_to_m05_couplers_RVALID;
  wire [191:160]xbar_to_m05_couplers_WDATA;
  wire xbar_to_m05_couplers_WREADY;
  wire [23:20]xbar_to_m05_couplers_WSTRB;
  wire [5:5]xbar_to_m05_couplers_WVALID;
  wire [223:192]xbar_to_m06_couplers_ARADDR;
  wire xbar_to_m06_couplers_ARREADY;
  wire [6:6]xbar_to_m06_couplers_ARVALID;
  wire [223:192]xbar_to_m06_couplers_AWADDR;
  wire xbar_to_m06_couplers_AWREADY;
  wire [6:6]xbar_to_m06_couplers_AWVALID;
  wire [6:6]xbar_to_m06_couplers_BREADY;
  wire [1:0]xbar_to_m06_couplers_BRESP;
  wire xbar_to_m06_couplers_BVALID;
  wire [31:0]xbar_to_m06_couplers_RDATA;
  wire [6:6]xbar_to_m06_couplers_RREADY;
  wire [1:0]xbar_to_m06_couplers_RRESP;
  wire xbar_to_m06_couplers_RVALID;
  wire [223:192]xbar_to_m06_couplers_WDATA;
  wire xbar_to_m06_couplers_WREADY;
  wire [27:24]xbar_to_m06_couplers_WSTRB;
  wire [6:6]xbar_to_m06_couplers_WVALID;
  wire [20:0]NLW_xbar_m_axi_arprot_UNCONNECTED;
  wire [20:0]NLW_xbar_m_axi_awprot_UNCONNECTED;

  m00_couplers_imp_XH10JP m00_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(M00_AXI_araddr),
        .M_AXI_arready(M00_AXI_arready),
        .M_AXI_arvalid(M00_AXI_arvalid),
        .M_AXI_awaddr(M00_AXI_awaddr),
        .M_AXI_awready(M00_AXI_awready),
        .M_AXI_awvalid(M00_AXI_awvalid),
        .M_AXI_bready(M00_AXI_bready),
        .M_AXI_bresp(M00_AXI_bresp),
        .M_AXI_bvalid(M00_AXI_bvalid),
        .M_AXI_rdata(M00_AXI_rdata),
        .M_AXI_rready(M00_AXI_rready),
        .M_AXI_rresp(M00_AXI_rresp),
        .M_AXI_rvalid(M00_AXI_rvalid),
        .M_AXI_wdata(M00_AXI_wdata),
        .M_AXI_wready(M00_AXI_wready),
        .M_AXI_wstrb(M00_AXI_wstrb),
        .M_AXI_wvalid(M00_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_165PIW4 m01_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(M01_AXI_araddr),
        .M_AXI_arready(M01_AXI_arready),
        .M_AXI_arvalid(M01_AXI_arvalid),
        .M_AXI_awaddr(M01_AXI_awaddr),
        .M_AXI_awready(M01_AXI_awready),
        .M_AXI_awvalid(M01_AXI_awvalid),
        .M_AXI_bready(M01_AXI_bready),
        .M_AXI_bresp(M01_AXI_bresp),
        .M_AXI_bvalid(M01_AXI_bvalid),
        .M_AXI_rdata(M01_AXI_rdata),
        .M_AXI_rready(M01_AXI_rready),
        .M_AXI_rresp(M01_AXI_rresp),
        .M_AXI_rvalid(M01_AXI_rvalid),
        .M_AXI_wdata(M01_AXI_wdata),
        .M_AXI_wready(M01_AXI_wready),
        .M_AXI_wstrb(M01_AXI_wstrb),
        .M_AXI_wvalid(M01_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_YT9NRA m02_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(M02_AXI_araddr),
        .M_AXI_arready(M02_AXI_arready),
        .M_AXI_arvalid(M02_AXI_arvalid),
        .M_AXI_awaddr(M02_AXI_awaddr),
        .M_AXI_awready(M02_AXI_awready),
        .M_AXI_awvalid(M02_AXI_awvalid),
        .M_AXI_bready(M02_AXI_bready),
        .M_AXI_bresp(M02_AXI_bresp),
        .M_AXI_bvalid(M02_AXI_bvalid),
        .M_AXI_rdata(M02_AXI_rdata),
        .M_AXI_rready(M02_AXI_rready),
        .M_AXI_rresp(M02_AXI_rresp),
        .M_AXI_rvalid(M02_AXI_rvalid),
        .M_AXI_wdata(M02_AXI_wdata),
        .M_AXI_wready(M02_AXI_wready),
        .M_AXI_wstrb(M02_AXI_wstrb),
        .M_AXI_wvalid(M02_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_14JT5D3 m03_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(M03_AXI_araddr),
        .M_AXI_arready(M03_AXI_arready),
        .M_AXI_arvalid(M03_AXI_arvalid),
        .M_AXI_awaddr(M03_AXI_awaddr),
        .M_AXI_awready(M03_AXI_awready),
        .M_AXI_awvalid(M03_AXI_awvalid),
        .M_AXI_bready(M03_AXI_bready),
        .M_AXI_bresp(M03_AXI_bresp),
        .M_AXI_bvalid(M03_AXI_bvalid),
        .M_AXI_rdata(M03_AXI_rdata),
        .M_AXI_rready(M03_AXI_rready),
        .M_AXI_rresp(M03_AXI_rresp),
        .M_AXI_rvalid(M03_AXI_rvalid),
        .M_AXI_wdata(M03_AXI_wdata),
        .M_AXI_wready(M03_AXI_wready),
        .M_AXI_wstrb(M03_AXI_wstrb),
        .M_AXI_wvalid(M03_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_VX58UB m04_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(M04_AXI_araddr),
        .M_AXI_arready(M04_AXI_arready),
        .M_AXI_arvalid(M04_AXI_arvalid),
        .M_AXI_awaddr(M04_AXI_awaddr),
        .M_AXI_awready(M04_AXI_awready),
        .M_AXI_awvalid(M04_AXI_awvalid),
        .M_AXI_bready(M04_AXI_bready),
        .M_AXI_bresp(M04_AXI_bresp),
        .M_AXI_bvalid(M04_AXI_bvalid),
        .M_AXI_rdata(M04_AXI_rdata),
        .M_AXI_rready(M04_AXI_rready),
        .M_AXI_rresp(M04_AXI_rresp),
        .M_AXI_rvalid(M04_AXI_rvalid),
        .M_AXI_wdata(M04_AXI_wdata),
        .M_AXI_wready(M04_AXI_wready),
        .M_AXI_wstrb(M04_AXI_wstrb),
        .M_AXI_wvalid(M04_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  m05_couplers_imp_17DQZMQ m05_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(M05_AXI_araddr),
        .M_AXI_arburst(M05_AXI_arburst),
        .M_AXI_arcache(M05_AXI_arcache),
        .M_AXI_arlen(M05_AXI_arlen),
        .M_AXI_arlock(M05_AXI_arlock),
        .M_AXI_arprot(M05_AXI_arprot),
        .M_AXI_arready(M05_AXI_arready),
        .M_AXI_arsize(M05_AXI_arsize),
        .M_AXI_arvalid(M05_AXI_arvalid),
        .M_AXI_awaddr(M05_AXI_awaddr),
        .M_AXI_awburst(M05_AXI_awburst),
        .M_AXI_awcache(M05_AXI_awcache),
        .M_AXI_awlen(M05_AXI_awlen),
        .M_AXI_awlock(M05_AXI_awlock),
        .M_AXI_awprot(M05_AXI_awprot),
        .M_AXI_awready(M05_AXI_awready),
        .M_AXI_awsize(M05_AXI_awsize),
        .M_AXI_awvalid(M05_AXI_awvalid),
        .M_AXI_bready(M05_AXI_bready),
        .M_AXI_bresp(M05_AXI_bresp),
        .M_AXI_bvalid(M05_AXI_bvalid),
        .M_AXI_rdata(M05_AXI_rdata),
        .M_AXI_rlast(M05_AXI_rlast),
        .M_AXI_rready(M05_AXI_rready),
        .M_AXI_rresp(M05_AXI_rresp),
        .M_AXI_rvalid(M05_AXI_rvalid),
        .M_AXI_wdata(M05_AXI_wdata),
        .M_AXI_wlast(M05_AXI_wlast),
        .M_AXI_wready(M05_AXI_wready),
        .M_AXI_wstrb(M05_AXI_wstrb),
        .M_AXI_wvalid(M05_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m05_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m05_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m05_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m05_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m05_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m05_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m05_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m05_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m05_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m05_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m05_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m05_couplers_RDATA),
        .S_AXI_rready(xbar_to_m05_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m05_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m05_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m05_couplers_WDATA),
        .S_AXI_wready(xbar_to_m05_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m05_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m05_couplers_WVALID));
  m06_couplers_imp_WZDLS0 m06_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(M06_AXI_araddr),
        .M_AXI_arready(M06_AXI_arready),
        .M_AXI_arvalid(M06_AXI_arvalid),
        .M_AXI_awaddr(M06_AXI_awaddr),
        .M_AXI_awready(M06_AXI_awready),
        .M_AXI_awvalid(M06_AXI_awvalid),
        .M_AXI_bready(M06_AXI_bready),
        .M_AXI_bresp(M06_AXI_bresp),
        .M_AXI_bvalid(M06_AXI_bvalid),
        .M_AXI_rdata(M06_AXI_rdata),
        .M_AXI_rready(M06_AXI_rready),
        .M_AXI_rresp(M06_AXI_rresp),
        .M_AXI_rvalid(M06_AXI_rvalid),
        .M_AXI_wdata(M06_AXI_wdata),
        .M_AXI_wready(M06_AXI_wready),
        .M_AXI_wstrb(M06_AXI_wstrb),
        .M_AXI_wvalid(M06_AXI_wvalid),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(xbar_to_m06_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m06_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m06_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m06_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m06_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m06_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m06_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m06_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m06_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m06_couplers_RDATA),
        .S_AXI_rready(xbar_to_m06_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m06_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m06_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m06_couplers_WDATA),
        .S_AXI_wready(xbar_to_m06_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m06_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m06_couplers_WVALID));
  s00_couplers_imp_ZYORBB s00_couplers
       (.M_ACLK(ACLK),
        .M_ARESETN(ARESETN),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(ACLK),
        .S_ARESETN(ARESETN),
        .S_AXI_araddr(S00_AXI_araddr),
        .S_AXI_arprot(S00_AXI_arprot),
        .S_AXI_arready(S00_AXI_arready),
        .S_AXI_arvalid(S00_AXI_arvalid),
        .S_AXI_awaddr(S00_AXI_awaddr),
        .S_AXI_awprot(S00_AXI_awprot),
        .S_AXI_awready(S00_AXI_awready),
        .S_AXI_awvalid(S00_AXI_awvalid),
        .S_AXI_bready(S00_AXI_bready),
        .S_AXI_bresp(S00_AXI_bresp),
        .S_AXI_bvalid(S00_AXI_bvalid),
        .S_AXI_rdata(S00_AXI_rdata),
        .S_AXI_rready(S00_AXI_rready),
        .S_AXI_rresp(S00_AXI_rresp),
        .S_AXI_rvalid(S00_AXI_rvalid),
        .S_AXI_wdata(S00_AXI_wdata),
        .S_AXI_wready(S00_AXI_wready),
        .S_AXI_wstrb(S00_AXI_wstrb),
        .S_AXI_wvalid(S00_AXI_wvalid));
  design_1_microblaze_riscv_0_axi_periph_imp_xbar_2 xbar
       (.aclk(ACLK),
        .aresetn(ARESETN),
        .m_axi_araddr({xbar_to_m06_couplers_ARADDR,xbar_to_m05_couplers_ARADDR,xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m05_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[14:0]}),
        .m_axi_arready({xbar_to_m06_couplers_ARREADY,xbar_to_m05_couplers_ARREADY,xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m06_couplers_ARVALID,xbar_to_m05_couplers_ARVALID,xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m06_couplers_AWADDR,xbar_to_m05_couplers_AWADDR,xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m05_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[14:0]}),
        .m_axi_awready({xbar_to_m06_couplers_AWREADY,xbar_to_m05_couplers_AWREADY,xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m06_couplers_AWVALID,xbar_to_m05_couplers_AWVALID,xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m06_couplers_BREADY,xbar_to_m05_couplers_BREADY,xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m06_couplers_BRESP,xbar_to_m05_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m06_couplers_BVALID,xbar_to_m05_couplers_BVALID,xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m06_couplers_RDATA,xbar_to_m05_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m06_couplers_RREADY,xbar_to_m05_couplers_RREADY,xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m06_couplers_RRESP,xbar_to_m05_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m06_couplers_RVALID,xbar_to_m05_couplers_RVALID,xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m06_couplers_WDATA,xbar_to_m05_couplers_WDATA,xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m06_couplers_WREADY,xbar_to_m05_couplers_WREADY,xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m06_couplers_WSTRB,xbar_to_m05_couplers_WSTRB,xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m06_couplers_WVALID,xbar_to_m05_couplers_WVALID,xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module gpu_imp_FKHPVI
   (S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    VGA_B,
    VGA_G,
    VGA_HS,
    VGA_R,
    VGA_VS,
    gpu_clk_i,
    reset_i,
    s_axi_aclk,
    s_axi_aresetn,
    vga_clk_i);
  input [16:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [16:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;
  output [3:0]VGA_B;
  output [3:0]VGA_G;
  output VGA_HS;
  output [3:0]VGA_R;
  output VGA_VS;
  input gpu_clk_i;
  input reset_i;
  input s_axi_aclk;
  input s_axi_aresetn;
  input vga_clk_i;

  wire [16:0]S_AXI_araddr;
  wire [1:0]S_AXI_arburst;
  wire [3:0]S_AXI_arcache;
  wire [7:0]S_AXI_arlen;
  wire S_AXI_arlock;
  wire [2:0]S_AXI_arprot;
  wire S_AXI_arready;
  wire [2:0]S_AXI_arsize;
  wire S_AXI_arvalid;
  wire [16:0]S_AXI_awaddr;
  wire [1:0]S_AXI_awburst;
  wire [3:0]S_AXI_awcache;
  wire [7:0]S_AXI_awlen;
  wire S_AXI_awlock;
  wire [2:0]S_AXI_awprot;
  wire S_AXI_awready;
  wire [2:0]S_AXI_awsize;
  wire S_AXI_awvalid;
  wire S_AXI_bready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire S_AXI_rlast;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire [31:0]S_AXI_wdata;
  wire S_AXI_wlast;
  wire S_AXI_wready;
  wire [3:0]S_AXI_wstrb;
  wire S_AXI_wvalid;
  wire [3:0]VGA_B;
  wire [3:0]VGA_G;
  wire VGA_HS;
  wire [3:0]VGA_R;
  wire VGA_VS;
  wire [16:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire [31:0]blk_mem_gen_0_doutb;
  wire [31:0]gpu_0_bram_addr_o;
  wire gpu_0_bram_clk_o;
  wire [31:0]gpu_0_bram_din_o;
  wire gpu_0_bram_en_o;
  wire gpu_0_bram_rst_o;
  wire [3:0]gpu_0_bram_we_o;
  wire gpu_clk_i;
  wire reset_i;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire vga_clk_i;

  (* BMM_INFO_ADDRESS_SPACE = "byte  0xC0000000 32 > design_1 gpu/blk_mem_gen_0" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  design_1_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(S_AXI_araddr),
        .s_axi_arburst(S_AXI_arburst),
        .s_axi_arcache(S_AXI_arcache),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arlen(S_AXI_arlen),
        .s_axi_arlock(S_AXI_arlock),
        .s_axi_arprot(S_AXI_arprot),
        .s_axi_arready(S_AXI_arready),
        .s_axi_arsize(S_AXI_arsize),
        .s_axi_arvalid(S_AXI_arvalid),
        .s_axi_awaddr(S_AXI_awaddr),
        .s_axi_awburst(S_AXI_awburst),
        .s_axi_awcache(S_AXI_awcache),
        .s_axi_awlen(S_AXI_awlen),
        .s_axi_awlock(S_AXI_awlock),
        .s_axi_awprot(S_AXI_awprot),
        .s_axi_awready(S_AXI_awready),
        .s_axi_awsize(S_AXI_awsize),
        .s_axi_awvalid(S_AXI_awvalid),
        .s_axi_bready(S_AXI_bready),
        .s_axi_bresp(S_AXI_bresp),
        .s_axi_bvalid(S_AXI_bvalid),
        .s_axi_rdata(S_AXI_rdata),
        .s_axi_rlast(S_AXI_rlast),
        .s_axi_rready(S_AXI_rready),
        .s_axi_rresp(S_AXI_rresp),
        .s_axi_rvalid(S_AXI_rvalid),
        .s_axi_wdata(S_AXI_wdata),
        .s_axi_wlast(S_AXI_wlast),
        .s_axi_wready(S_AXI_wready),
        .s_axi_wstrb(S_AXI_wstrb),
        .s_axi_wvalid(S_AXI_wvalid));
  design_1_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .addrb(gpu_0_bram_addr_o),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .clkb(gpu_0_bram_clk_o),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .dinb(gpu_0_bram_din_o),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .doutb(blk_mem_gen_0_doutb),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .enb(gpu_0_bram_en_o),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .rstb(gpu_0_bram_rst_o),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .web(gpu_0_bram_we_o));
  design_1_gpu_0_0 gpu_0
       (.VGA_B_o(VGA_B),
        .VGA_G_o(VGA_G),
        .VGA_HS_o(VGA_HS),
        .VGA_R_o(VGA_R),
        .VGA_VS_o(VGA_VS),
        .bram_addr_o(gpu_0_bram_addr_o),
        .bram_clk_o(gpu_0_bram_clk_o),
        .bram_din_o(gpu_0_bram_din_o),
        .bram_dout_i(blk_mem_gen_0_doutb),
        .bram_en_o(gpu_0_bram_en_o),
        .bram_rst_o(gpu_0_bram_rst_o),
        .bram_we_o(gpu_0_bram_we_o),
        .gpu_clk_i(gpu_clk_i),
        .reset_i(reset_i),
        .vga_clk_i(vga_clk_i));
endmodule

module m00_couplers_imp_1U2PGAU
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [26:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [0:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [26:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [0:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [0:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [127:0]M_AXI_rdata;
  input [0:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [127:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [15:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [0:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [127:0]S_AXI_rdata;
  output [0:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [127:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [15:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK;
  wire M_ARESETN;
  wire [26:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [0:0]M_AXI_arid;
  wire [7:0]M_AXI_arlen;
  wire [0:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [26:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [0:0]M_AXI_awid;
  wire [7:0]M_AXI_awlen;
  wire [0:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire [2:0]M_AXI_awsize;
  wire M_AXI_awvalid;
  wire [0:0]M_AXI_bid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [127:0]M_AXI_rdata;
  wire [0:0]M_AXI_rid;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [127:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [15:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_ACLK;
  wire S_ARESETN;
  wire [31:0]S_AXI_araddr;
  wire [1:0]S_AXI_arburst;
  wire [3:0]S_AXI_arcache;
  wire [0:0]S_AXI_arid;
  wire [7:0]S_AXI_arlen;
  wire [0:0]S_AXI_arlock;
  wire [2:0]S_AXI_arprot;
  wire [3:0]S_AXI_arqos;
  wire S_AXI_arready;
  wire [3:0]S_AXI_arregion;
  wire [2:0]S_AXI_arsize;
  wire S_AXI_arvalid;
  wire [31:0]S_AXI_awaddr;
  wire [1:0]S_AXI_awburst;
  wire [3:0]S_AXI_awcache;
  wire [0:0]S_AXI_awid;
  wire [7:0]S_AXI_awlen;
  wire [0:0]S_AXI_awlock;
  wire [2:0]S_AXI_awprot;
  wire [3:0]S_AXI_awqos;
  wire S_AXI_awready;
  wire [3:0]S_AXI_awregion;
  wire [2:0]S_AXI_awsize;
  wire S_AXI_awvalid;
  wire [0:0]S_AXI_bid;
  wire S_AXI_bready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [127:0]S_AXI_rdata;
  wire [0:0]S_AXI_rid;
  wire S_AXI_rlast;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire [127:0]S_AXI_wdata;
  wire S_AXI_wlast;
  wire S_AXI_wready;
  wire [15:0]S_AXI_wstrb;
  wire S_AXI_wvalid;

  design_1_ram_interconnect_imp_auto_cc_0 auto_cc
       (.m_axi_aclk(M_ACLK),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_aresetn(M_ARESETN),
        .m_axi_arid(M_AXI_arid),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(M_AXI_arsize),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awid(M_AXI_awid),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(M_AXI_awlock),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awqos(M_AXI_awqos),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(M_AXI_awsize),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bid(M_AXI_bid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rid(M_AXI_rid),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_aclk(S_ACLK),
        .s_axi_araddr(S_AXI_araddr[26:0]),
        .s_axi_arburst(S_AXI_arburst),
        .s_axi_arcache(S_AXI_arcache),
        .s_axi_aresetn(S_ARESETN),
        .s_axi_arid(S_AXI_arid),
        .s_axi_arlen(S_AXI_arlen),
        .s_axi_arlock(S_AXI_arlock),
        .s_axi_arprot(S_AXI_arprot),
        .s_axi_arqos(S_AXI_arqos),
        .s_axi_arready(S_AXI_arready),
        .s_axi_arregion(S_AXI_arregion),
        .s_axi_arsize(S_AXI_arsize),
        .s_axi_arvalid(S_AXI_arvalid),
        .s_axi_awaddr(S_AXI_awaddr[26:0]),
        .s_axi_awburst(S_AXI_awburst),
        .s_axi_awcache(S_AXI_awcache),
        .s_axi_awid(S_AXI_awid),
        .s_axi_awlen(S_AXI_awlen),
        .s_axi_awlock(S_AXI_awlock),
        .s_axi_awprot(S_AXI_awprot),
        .s_axi_awqos(S_AXI_awqos),
        .s_axi_awready(S_AXI_awready),
        .s_axi_awregion(S_AXI_awregion),
        .s_axi_awsize(S_AXI_awsize),
        .s_axi_awvalid(S_AXI_awvalid),
        .s_axi_bid(S_AXI_bid),
        .s_axi_bready(S_AXI_bready),
        .s_axi_bresp(S_AXI_bresp),
        .s_axi_bvalid(S_AXI_bvalid),
        .s_axi_rdata(S_AXI_rdata),
        .s_axi_rid(S_AXI_rid),
        .s_axi_rlast(S_AXI_rlast),
        .s_axi_rready(S_AXI_rready),
        .s_axi_rresp(S_AXI_rresp),
        .s_axi_rvalid(S_AXI_rvalid),
        .s_axi_wdata(S_AXI_wdata),
        .s_axi_wlast(S_AXI_wlast),
        .s_axi_wready(S_AXI_wready),
        .s_axi_wstrb(S_AXI_wstrb),
        .s_axi_wvalid(S_AXI_wvalid));
endmodule

module m00_couplers_imp_XH10JP
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire M_AXI_rready;
  wire [31:0]M_AXI_wdata;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_AXI_arready;
  wire S_AXI_awready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire S_AXI_wready;

  assign M_AXI_araddr = S_AXI_araddr[31:0];
  assign M_AXI_arvalid = S_AXI_arvalid;
  assign M_AXI_awaddr = S_AXI_awaddr[31:0];
  assign M_AXI_awvalid = S_AXI_awvalid;
  assign M_AXI_bready = S_AXI_bready;
  assign M_AXI_rready = S_AXI_rready;
  assign M_AXI_wdata = S_AXI_wdata[31:0];
  assign M_AXI_wstrb = S_AXI_wstrb[3:0];
  assign M_AXI_wvalid = S_AXI_wvalid;
  assign S_AXI_arready = M_AXI_arready;
  assign S_AXI_awready = M_AXI_awready;
  assign S_AXI_bresp = M_AXI_bresp[1:0];
  assign S_AXI_bvalid = M_AXI_bvalid;
  assign S_AXI_rdata = M_AXI_rdata[31:0];
  assign S_AXI_rresp = M_AXI_rresp[1:0];
  assign S_AXI_rvalid = M_AXI_rvalid;
  assign S_AXI_wready = M_AXI_wready;
endmodule

module m01_couplers_imp_165PIW4
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire M_AXI_rready;
  wire [31:0]M_AXI_wdata;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_AXI_arready;
  wire S_AXI_awready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire S_AXI_wready;

  assign M_AXI_araddr = S_AXI_araddr[31:0];
  assign M_AXI_arvalid = S_AXI_arvalid;
  assign M_AXI_awaddr = S_AXI_awaddr[31:0];
  assign M_AXI_awvalid = S_AXI_awvalid;
  assign M_AXI_bready = S_AXI_bready;
  assign M_AXI_rready = S_AXI_rready;
  assign M_AXI_wdata = S_AXI_wdata[31:0];
  assign M_AXI_wstrb = S_AXI_wstrb[3:0];
  assign M_AXI_wvalid = S_AXI_wvalid;
  assign S_AXI_arready = M_AXI_arready;
  assign S_AXI_awready = M_AXI_awready;
  assign S_AXI_bresp = M_AXI_bresp[1:0];
  assign S_AXI_bvalid = M_AXI_bvalid;
  assign S_AXI_rdata = M_AXI_rdata[31:0];
  assign S_AXI_rresp = M_AXI_rresp[1:0];
  assign S_AXI_rvalid = M_AXI_rvalid;
  assign S_AXI_wready = M_AXI_wready;
endmodule

module m02_couplers_imp_YT9NRA
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire [0:0]M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire [0:0]M_AXI_awvalid;
  wire [0:0]M_AXI_bready;
  wire [0:0]M_AXI_rready;
  wire [31:0]M_AXI_wdata;
  wire [3:0]M_AXI_wstrb;
  wire [0:0]M_AXI_wvalid;
  wire [0:0]S_AXI_arready;
  wire [0:0]S_AXI_awready;
  wire [1:0]S_AXI_bresp;
  wire [0:0]S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [1:0]S_AXI_rresp;
  wire [0:0]S_AXI_rvalid;
  wire [0:0]S_AXI_wready;

  assign M_AXI_araddr = S_AXI_araddr[31:0];
  assign M_AXI_arvalid = S_AXI_arvalid[0];
  assign M_AXI_awaddr = S_AXI_awaddr[31:0];
  assign M_AXI_awvalid = S_AXI_awvalid[0];
  assign M_AXI_bready = S_AXI_bready[0];
  assign M_AXI_rready = S_AXI_rready[0];
  assign M_AXI_wdata = S_AXI_wdata[31:0];
  assign M_AXI_wstrb = S_AXI_wstrb[3:0];
  assign M_AXI_wvalid = S_AXI_wvalid[0];
  assign S_AXI_arready = M_AXI_arready[0];
  assign S_AXI_awready = M_AXI_awready[0];
  assign S_AXI_bresp = M_AXI_bresp[1:0];
  assign S_AXI_bvalid = M_AXI_bvalid[0];
  assign S_AXI_rdata = M_AXI_rdata[31:0];
  assign S_AXI_rresp = M_AXI_rresp[1:0];
  assign S_AXI_rvalid = M_AXI_rvalid[0];
  assign S_AXI_wready = M_AXI_wready[0];
endmodule

module m03_couplers_imp_14JT5D3
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire M_AXI_rready;
  wire [31:0]M_AXI_wdata;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_AXI_arready;
  wire S_AXI_awready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire S_AXI_wready;

  assign M_AXI_araddr = S_AXI_araddr[31:0];
  assign M_AXI_arvalid = S_AXI_arvalid;
  assign M_AXI_awaddr = S_AXI_awaddr[31:0];
  assign M_AXI_awvalid = S_AXI_awvalid;
  assign M_AXI_bready = S_AXI_bready;
  assign M_AXI_rready = S_AXI_rready;
  assign M_AXI_wdata = S_AXI_wdata[31:0];
  assign M_AXI_wstrb = S_AXI_wstrb[3:0];
  assign M_AXI_wvalid = S_AXI_wvalid;
  assign S_AXI_arready = M_AXI_arready;
  assign S_AXI_awready = M_AXI_awready;
  assign S_AXI_bresp = M_AXI_bresp[1:0];
  assign S_AXI_bvalid = M_AXI_bvalid;
  assign S_AXI_rdata = M_AXI_rdata[31:0];
  assign S_AXI_rresp = M_AXI_rresp[1:0];
  assign S_AXI_rvalid = M_AXI_rvalid;
  assign S_AXI_wready = M_AXI_wready;
endmodule

module m04_couplers_imp_VX58UB
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire M_AXI_rready;
  wire [31:0]M_AXI_wdata;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_AXI_arready;
  wire S_AXI_awready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire S_AXI_wready;

  assign M_AXI_araddr = S_AXI_araddr[31:0];
  assign M_AXI_arvalid = S_AXI_arvalid;
  assign M_AXI_awaddr = S_AXI_awaddr[31:0];
  assign M_AXI_awvalid = S_AXI_awvalid;
  assign M_AXI_bready = S_AXI_bready;
  assign M_AXI_rready = S_AXI_rready;
  assign M_AXI_wdata = S_AXI_wdata[31:0];
  assign M_AXI_wstrb = S_AXI_wstrb[3:0];
  assign M_AXI_wvalid = S_AXI_wvalid;
  assign S_AXI_arready = M_AXI_arready;
  assign S_AXI_awready = M_AXI_awready;
  assign S_AXI_bresp = M_AXI_bresp[1:0];
  assign S_AXI_bvalid = M_AXI_bvalid;
  assign S_AXI_rdata = M_AXI_rdata[31:0];
  assign S_AXI_rresp = M_AXI_rresp[1:0];
  assign S_AXI_rvalid = M_AXI_rvalid;
  assign S_AXI_wready = M_AXI_wready;
endmodule

module m05_couplers_imp_17DQZMQ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [16:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [16:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [16:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [7:0]M_AXI_arlen;
  wire [0:0]\^M_AXI_arlock ;
  wire [2:0]M_AXI_arprot;
  wire M_AXI_arready;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [16:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [7:0]M_AXI_awlen;
  wire [0:0]\^M_AXI_awlock ;
  wire [2:0]M_AXI_awprot;
  wire M_AXI_awready;
  wire [2:0]M_AXI_awsize;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [31:0]M_AXI_rdata;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [31:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_ACLK;
  wire S_ARESETN;
  wire [31:0]S_AXI_araddr;
  wire [2:0]S_AXI_arprot;
  wire S_AXI_arready;
  wire S_AXI_arvalid;
  wire [31:0]S_AXI_awaddr;
  wire [2:0]S_AXI_awprot;
  wire S_AXI_awready;
  wire S_AXI_awvalid;
  wire S_AXI_bready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire [31:0]S_AXI_wdata;
  wire S_AXI_wready;
  wire [3:0]S_AXI_wstrb;
  wire S_AXI_wvalid;

  assign M_AXI_arlock = \^M_AXI_arlock [0];
  assign M_AXI_awlock = \^M_AXI_awlock [0];
  design_1_microblaze_riscv_0_axi_periph_imp_auto_pc_0 auto_pc
       (.aclk(S_ACLK),
        .aresetn(S_ARESETN),
        .m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(\^M_AXI_arlock ),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(M_AXI_arsize),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(\^M_AXI_awlock ),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(M_AXI_awsize),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_araddr(S_AXI_araddr[16:0]),
        .s_axi_arprot(S_AXI_arprot),
        .s_axi_arready(S_AXI_arready),
        .s_axi_arvalid(S_AXI_arvalid),
        .s_axi_awaddr(S_AXI_awaddr[16:0]),
        .s_axi_awprot(S_AXI_awprot),
        .s_axi_awready(S_AXI_awready),
        .s_axi_awvalid(S_AXI_awvalid),
        .s_axi_bready(S_AXI_bready),
        .s_axi_bresp(S_AXI_bresp),
        .s_axi_bvalid(S_AXI_bvalid),
        .s_axi_rdata(S_AXI_rdata),
        .s_axi_rready(S_AXI_rready),
        .s_axi_rresp(S_AXI_rresp),
        .s_axi_rvalid(S_AXI_rvalid),
        .s_axi_wdata(S_AXI_wdata),
        .s_axi_wready(S_AXI_wready),
        .s_axi_wstrb(S_AXI_wstrb),
        .s_axi_wvalid(S_AXI_wvalid));
endmodule

module m06_couplers_imp_WZDLS0
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire M_AXI_rready;
  wire [31:0]M_AXI_wdata;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_AXI_arready;
  wire S_AXI_awready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire S_AXI_wready;

  assign M_AXI_araddr = S_AXI_araddr[31:0];
  assign M_AXI_arvalid = S_AXI_arvalid;
  assign M_AXI_awaddr = S_AXI_awaddr[31:0];
  assign M_AXI_awvalid = S_AXI_awvalid;
  assign M_AXI_bready = S_AXI_bready;
  assign M_AXI_rready = S_AXI_rready;
  assign M_AXI_wdata = S_AXI_wdata[31:0];
  assign M_AXI_wstrb = S_AXI_wstrb[3:0];
  assign M_AXI_wvalid = S_AXI_wvalid;
  assign S_AXI_arready = M_AXI_arready;
  assign S_AXI_awready = M_AXI_awready;
  assign S_AXI_bresp = M_AXI_bresp[1:0];
  assign S_AXI_bvalid = M_AXI_bvalid;
  assign S_AXI_rdata = M_AXI_rdata[31:0];
  assign S_AXI_rresp = M_AXI_rresp[1:0];
  assign S_AXI_rvalid = M_AXI_rvalid;
  assign S_AXI_wready = M_AXI_wready;
endmodule

module microblaze_riscv_0_local_memory_imp_1TUIWYR
   (DLMB_abus,
    DLMB_addrstrobe,
    DLMB_be,
    DLMB_ce,
    DLMB_readdbus,
    DLMB_readstrobe,
    DLMB_ready,
    DLMB_ue,
    DLMB_wait,
    DLMB_writedbus,
    DLMB_writestrobe,
    ILMB_abus,
    ILMB_addrstrobe,
    ILMB_ce,
    ILMB_readdbus,
    ILMB_readstrobe,
    ILMB_ready,
    ILMB_ue,
    ILMB_wait,
    LMB_Clk,
    SYS_Rst);
  input [0:31]DLMB_abus;
  input DLMB_addrstrobe;
  input [0:3]DLMB_be;
  output DLMB_ce;
  output [0:31]DLMB_readdbus;
  input DLMB_readstrobe;
  output DLMB_ready;
  output DLMB_ue;
  output DLMB_wait;
  input [0:31]DLMB_writedbus;
  input DLMB_writestrobe;
  input [0:31]ILMB_abus;
  input ILMB_addrstrobe;
  output ILMB_ce;
  output [0:31]ILMB_readdbus;
  input ILMB_readstrobe;
  output ILMB_ready;
  output ILMB_ue;
  output ILMB_wait;
  input LMB_Clk;
  input SYS_Rst;

  wire [0:31]DLMB_abus;
  wire DLMB_addrstrobe;
  wire [0:3]DLMB_be;
  wire DLMB_ce;
  wire [0:31]DLMB_readdbus;
  wire DLMB_readstrobe;
  wire DLMB_ready;
  wire DLMB_ue;
  wire DLMB_wait;
  wire [0:31]DLMB_writedbus;
  wire DLMB_writestrobe;
  wire [0:31]ILMB_abus;
  wire ILMB_addrstrobe;
  wire ILMB_ce;
  wire [0:31]ILMB_readdbus;
  wire ILMB_readstrobe;
  wire ILMB_ready;
  wire ILMB_ue;
  wire ILMB_wait;
  wire LMB_Clk;
  wire SYS_Rst;
  wire [0:31]microblaze_riscv_0_dlmb_bus_ABUS;
  wire microblaze_riscv_0_dlmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_riscv_0_dlmb_bus_BE;
  wire microblaze_riscv_0_dlmb_bus_CE;
  wire [0:31]microblaze_riscv_0_dlmb_bus_READDBUS;
  wire microblaze_riscv_0_dlmb_bus_READSTROBE;
  wire microblaze_riscv_0_dlmb_bus_READY;
  wire microblaze_riscv_0_dlmb_bus_UE;
  wire microblaze_riscv_0_dlmb_bus_WAIT;
  wire [0:31]microblaze_riscv_0_dlmb_bus_WRITEDBUS;
  wire microblaze_riscv_0_dlmb_bus_WRITESTROBE;
  wire [0:31]microblaze_riscv_0_dlmb_cntlr_ADDR;
  wire microblaze_riscv_0_dlmb_cntlr_CLK;
  wire [0:31]microblaze_riscv_0_dlmb_cntlr_DIN;
  wire [31:0]microblaze_riscv_0_dlmb_cntlr_DOUT;
  wire microblaze_riscv_0_dlmb_cntlr_EN;
  wire microblaze_riscv_0_dlmb_cntlr_RST;
  wire [0:3]microblaze_riscv_0_dlmb_cntlr_WE;
  wire [0:31]microblaze_riscv_0_ilmb_bus_ABUS;
  wire microblaze_riscv_0_ilmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_riscv_0_ilmb_bus_BE;
  wire microblaze_riscv_0_ilmb_bus_CE;
  wire [0:31]microblaze_riscv_0_ilmb_bus_READDBUS;
  wire microblaze_riscv_0_ilmb_bus_READSTROBE;
  wire microblaze_riscv_0_ilmb_bus_READY;
  wire microblaze_riscv_0_ilmb_bus_UE;
  wire microblaze_riscv_0_ilmb_bus_WAIT;
  wire [0:31]microblaze_riscv_0_ilmb_bus_WRITEDBUS;
  wire microblaze_riscv_0_ilmb_bus_WRITESTROBE;
  wire [0:31]microblaze_riscv_0_ilmb_cntlr_ADDR;
  wire microblaze_riscv_0_ilmb_cntlr_CLK;
  wire [0:31]microblaze_riscv_0_ilmb_cntlr_DIN;
  wire [31:0]microblaze_riscv_0_ilmb_cntlr_DOUT;
  wire microblaze_riscv_0_ilmb_cntlr_EN;
  wire microblaze_riscv_0_ilmb_cntlr_RST;
  wire [0:3]microblaze_riscv_0_ilmb_cntlr_WE;

  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00000000 32 > design_1 microblaze_riscv_0_local_memory/lmb_bram" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  design_1_dlmb_bram_if_cntlr_2 dlmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_riscv_0_dlmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_riscv_0_dlmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_riscv_0_dlmb_cntlr_DOUT[31],microblaze_riscv_0_dlmb_cntlr_DOUT[30],microblaze_riscv_0_dlmb_cntlr_DOUT[29],microblaze_riscv_0_dlmb_cntlr_DOUT[28],microblaze_riscv_0_dlmb_cntlr_DOUT[27],microblaze_riscv_0_dlmb_cntlr_DOUT[26],microblaze_riscv_0_dlmb_cntlr_DOUT[25],microblaze_riscv_0_dlmb_cntlr_DOUT[24],microblaze_riscv_0_dlmb_cntlr_DOUT[23],microblaze_riscv_0_dlmb_cntlr_DOUT[22],microblaze_riscv_0_dlmb_cntlr_DOUT[21],microblaze_riscv_0_dlmb_cntlr_DOUT[20],microblaze_riscv_0_dlmb_cntlr_DOUT[19],microblaze_riscv_0_dlmb_cntlr_DOUT[18],microblaze_riscv_0_dlmb_cntlr_DOUT[17],microblaze_riscv_0_dlmb_cntlr_DOUT[16],microblaze_riscv_0_dlmb_cntlr_DOUT[15],microblaze_riscv_0_dlmb_cntlr_DOUT[14],microblaze_riscv_0_dlmb_cntlr_DOUT[13],microblaze_riscv_0_dlmb_cntlr_DOUT[12],microblaze_riscv_0_dlmb_cntlr_DOUT[11],microblaze_riscv_0_dlmb_cntlr_DOUT[10],microblaze_riscv_0_dlmb_cntlr_DOUT[9],microblaze_riscv_0_dlmb_cntlr_DOUT[8],microblaze_riscv_0_dlmb_cntlr_DOUT[7],microblaze_riscv_0_dlmb_cntlr_DOUT[6],microblaze_riscv_0_dlmb_cntlr_DOUT[5],microblaze_riscv_0_dlmb_cntlr_DOUT[4],microblaze_riscv_0_dlmb_cntlr_DOUT[3],microblaze_riscv_0_dlmb_cntlr_DOUT[2],microblaze_riscv_0_dlmb_cntlr_DOUT[1],microblaze_riscv_0_dlmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_riscv_0_dlmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_riscv_0_dlmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_riscv_0_dlmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_riscv_0_dlmb_cntlr_WE),
        .LMB_ABus(microblaze_riscv_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_dlmb_bus_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(microblaze_riscv_0_dlmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst),
        .LMB_WriteDBus(microblaze_riscv_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_dlmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_riscv_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_dlmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_dlmb_bus_WAIT));
  design_1_dlmb_v10_2 dlmb_v10
       (.LMB_ABus(microblaze_riscv_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_dlmb_bus_BE),
        .LMB_CE(DLMB_ce),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadDBus(DLMB_readdbus),
        .LMB_ReadStrobe(microblaze_riscv_0_dlmb_bus_READSTROBE),
        .LMB_Ready(DLMB_ready),
        .LMB_UE(DLMB_ue),
        .LMB_Wait(DLMB_wait),
        .LMB_WriteDBus(microblaze_riscv_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_dlmb_bus_WRITESTROBE),
        .M_ABus(DLMB_abus),
        .M_AddrStrobe(DLMB_addrstrobe),
        .M_BE(DLMB_be),
        .M_DBus(DLMB_writedbus),
        .M_ReadStrobe(DLMB_readstrobe),
        .M_WriteStrobe(DLMB_writestrobe),
        .SYS_Rst(SYS_Rst),
        .Sl_CE(microblaze_riscv_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_dlmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_dlmb_bus_WAIT));
  design_1_ilmb_bram_if_cntlr_2 ilmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_riscv_0_ilmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_riscv_0_ilmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_riscv_0_ilmb_cntlr_DOUT[31],microblaze_riscv_0_ilmb_cntlr_DOUT[30],microblaze_riscv_0_ilmb_cntlr_DOUT[29],microblaze_riscv_0_ilmb_cntlr_DOUT[28],microblaze_riscv_0_ilmb_cntlr_DOUT[27],microblaze_riscv_0_ilmb_cntlr_DOUT[26],microblaze_riscv_0_ilmb_cntlr_DOUT[25],microblaze_riscv_0_ilmb_cntlr_DOUT[24],microblaze_riscv_0_ilmb_cntlr_DOUT[23],microblaze_riscv_0_ilmb_cntlr_DOUT[22],microblaze_riscv_0_ilmb_cntlr_DOUT[21],microblaze_riscv_0_ilmb_cntlr_DOUT[20],microblaze_riscv_0_ilmb_cntlr_DOUT[19],microblaze_riscv_0_ilmb_cntlr_DOUT[18],microblaze_riscv_0_ilmb_cntlr_DOUT[17],microblaze_riscv_0_ilmb_cntlr_DOUT[16],microblaze_riscv_0_ilmb_cntlr_DOUT[15],microblaze_riscv_0_ilmb_cntlr_DOUT[14],microblaze_riscv_0_ilmb_cntlr_DOUT[13],microblaze_riscv_0_ilmb_cntlr_DOUT[12],microblaze_riscv_0_ilmb_cntlr_DOUT[11],microblaze_riscv_0_ilmb_cntlr_DOUT[10],microblaze_riscv_0_ilmb_cntlr_DOUT[9],microblaze_riscv_0_ilmb_cntlr_DOUT[8],microblaze_riscv_0_ilmb_cntlr_DOUT[7],microblaze_riscv_0_ilmb_cntlr_DOUT[6],microblaze_riscv_0_ilmb_cntlr_DOUT[5],microblaze_riscv_0_ilmb_cntlr_DOUT[4],microblaze_riscv_0_ilmb_cntlr_DOUT[3],microblaze_riscv_0_ilmb_cntlr_DOUT[2],microblaze_riscv_0_ilmb_cntlr_DOUT[1],microblaze_riscv_0_ilmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_riscv_0_ilmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_riscv_0_ilmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_riscv_0_ilmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_riscv_0_ilmb_cntlr_WE),
        .LMB_ABus(microblaze_riscv_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_ilmb_bus_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(microblaze_riscv_0_ilmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst),
        .LMB_WriteDBus(microblaze_riscv_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_ilmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_riscv_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_ilmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_ilmb_bus_WAIT));
  design_1_ilmb_v10_2 ilmb_v10
       (.LMB_ABus(microblaze_riscv_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_ilmb_bus_BE),
        .LMB_CE(ILMB_ce),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadDBus(ILMB_readdbus),
        .LMB_ReadStrobe(microblaze_riscv_0_ilmb_bus_READSTROBE),
        .LMB_Ready(ILMB_ready),
        .LMB_UE(ILMB_ue),
        .LMB_Wait(ILMB_wait),
        .LMB_WriteDBus(microblaze_riscv_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_ilmb_bus_WRITESTROBE),
        .M_ABus(ILMB_abus),
        .M_AddrStrobe(ILMB_addrstrobe),
        .M_BE({1'b0,1'b0,1'b0,1'b0}),
        .M_DBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_ReadStrobe(ILMB_readstrobe),
        .M_WriteStrobe(1'b0),
        .SYS_Rst(SYS_Rst),
        .Sl_CE(microblaze_riscv_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_ilmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_ilmb_bus_WAIT));
  design_1_lmb_bram_2 lmb_bram
       (.addra({microblaze_riscv_0_dlmb_cntlr_ADDR[0],microblaze_riscv_0_dlmb_cntlr_ADDR[1],microblaze_riscv_0_dlmb_cntlr_ADDR[2],microblaze_riscv_0_dlmb_cntlr_ADDR[3],microblaze_riscv_0_dlmb_cntlr_ADDR[4],microblaze_riscv_0_dlmb_cntlr_ADDR[5],microblaze_riscv_0_dlmb_cntlr_ADDR[6],microblaze_riscv_0_dlmb_cntlr_ADDR[7],microblaze_riscv_0_dlmb_cntlr_ADDR[8],microblaze_riscv_0_dlmb_cntlr_ADDR[9],microblaze_riscv_0_dlmb_cntlr_ADDR[10],microblaze_riscv_0_dlmb_cntlr_ADDR[11],microblaze_riscv_0_dlmb_cntlr_ADDR[12],microblaze_riscv_0_dlmb_cntlr_ADDR[13],microblaze_riscv_0_dlmb_cntlr_ADDR[14],microblaze_riscv_0_dlmb_cntlr_ADDR[15],microblaze_riscv_0_dlmb_cntlr_ADDR[16],microblaze_riscv_0_dlmb_cntlr_ADDR[17],microblaze_riscv_0_dlmb_cntlr_ADDR[18],microblaze_riscv_0_dlmb_cntlr_ADDR[19],microblaze_riscv_0_dlmb_cntlr_ADDR[20],microblaze_riscv_0_dlmb_cntlr_ADDR[21],microblaze_riscv_0_dlmb_cntlr_ADDR[22],microblaze_riscv_0_dlmb_cntlr_ADDR[23],microblaze_riscv_0_dlmb_cntlr_ADDR[24],microblaze_riscv_0_dlmb_cntlr_ADDR[25],microblaze_riscv_0_dlmb_cntlr_ADDR[26],microblaze_riscv_0_dlmb_cntlr_ADDR[27],microblaze_riscv_0_dlmb_cntlr_ADDR[28],microblaze_riscv_0_dlmb_cntlr_ADDR[29],microblaze_riscv_0_dlmb_cntlr_ADDR[30],microblaze_riscv_0_dlmb_cntlr_ADDR[31]}),
        .addrb({microblaze_riscv_0_ilmb_cntlr_ADDR[0],microblaze_riscv_0_ilmb_cntlr_ADDR[1],microblaze_riscv_0_ilmb_cntlr_ADDR[2],microblaze_riscv_0_ilmb_cntlr_ADDR[3],microblaze_riscv_0_ilmb_cntlr_ADDR[4],microblaze_riscv_0_ilmb_cntlr_ADDR[5],microblaze_riscv_0_ilmb_cntlr_ADDR[6],microblaze_riscv_0_ilmb_cntlr_ADDR[7],microblaze_riscv_0_ilmb_cntlr_ADDR[8],microblaze_riscv_0_ilmb_cntlr_ADDR[9],microblaze_riscv_0_ilmb_cntlr_ADDR[10],microblaze_riscv_0_ilmb_cntlr_ADDR[11],microblaze_riscv_0_ilmb_cntlr_ADDR[12],microblaze_riscv_0_ilmb_cntlr_ADDR[13],microblaze_riscv_0_ilmb_cntlr_ADDR[14],microblaze_riscv_0_ilmb_cntlr_ADDR[15],microblaze_riscv_0_ilmb_cntlr_ADDR[16],microblaze_riscv_0_ilmb_cntlr_ADDR[17],microblaze_riscv_0_ilmb_cntlr_ADDR[18],microblaze_riscv_0_ilmb_cntlr_ADDR[19],microblaze_riscv_0_ilmb_cntlr_ADDR[20],microblaze_riscv_0_ilmb_cntlr_ADDR[21],microblaze_riscv_0_ilmb_cntlr_ADDR[22],microblaze_riscv_0_ilmb_cntlr_ADDR[23],microblaze_riscv_0_ilmb_cntlr_ADDR[24],microblaze_riscv_0_ilmb_cntlr_ADDR[25],microblaze_riscv_0_ilmb_cntlr_ADDR[26],microblaze_riscv_0_ilmb_cntlr_ADDR[27],microblaze_riscv_0_ilmb_cntlr_ADDR[28],microblaze_riscv_0_ilmb_cntlr_ADDR[29],microblaze_riscv_0_ilmb_cntlr_ADDR[30],microblaze_riscv_0_ilmb_cntlr_ADDR[31]}),
        .clka(microblaze_riscv_0_dlmb_cntlr_CLK),
        .clkb(microblaze_riscv_0_ilmb_cntlr_CLK),
        .dina({microblaze_riscv_0_dlmb_cntlr_DIN[0],microblaze_riscv_0_dlmb_cntlr_DIN[1],microblaze_riscv_0_dlmb_cntlr_DIN[2],microblaze_riscv_0_dlmb_cntlr_DIN[3],microblaze_riscv_0_dlmb_cntlr_DIN[4],microblaze_riscv_0_dlmb_cntlr_DIN[5],microblaze_riscv_0_dlmb_cntlr_DIN[6],microblaze_riscv_0_dlmb_cntlr_DIN[7],microblaze_riscv_0_dlmb_cntlr_DIN[8],microblaze_riscv_0_dlmb_cntlr_DIN[9],microblaze_riscv_0_dlmb_cntlr_DIN[10],microblaze_riscv_0_dlmb_cntlr_DIN[11],microblaze_riscv_0_dlmb_cntlr_DIN[12],microblaze_riscv_0_dlmb_cntlr_DIN[13],microblaze_riscv_0_dlmb_cntlr_DIN[14],microblaze_riscv_0_dlmb_cntlr_DIN[15],microblaze_riscv_0_dlmb_cntlr_DIN[16],microblaze_riscv_0_dlmb_cntlr_DIN[17],microblaze_riscv_0_dlmb_cntlr_DIN[18],microblaze_riscv_0_dlmb_cntlr_DIN[19],microblaze_riscv_0_dlmb_cntlr_DIN[20],microblaze_riscv_0_dlmb_cntlr_DIN[21],microblaze_riscv_0_dlmb_cntlr_DIN[22],microblaze_riscv_0_dlmb_cntlr_DIN[23],microblaze_riscv_0_dlmb_cntlr_DIN[24],microblaze_riscv_0_dlmb_cntlr_DIN[25],microblaze_riscv_0_dlmb_cntlr_DIN[26],microblaze_riscv_0_dlmb_cntlr_DIN[27],microblaze_riscv_0_dlmb_cntlr_DIN[28],microblaze_riscv_0_dlmb_cntlr_DIN[29],microblaze_riscv_0_dlmb_cntlr_DIN[30],microblaze_riscv_0_dlmb_cntlr_DIN[31]}),
        .dinb({microblaze_riscv_0_ilmb_cntlr_DIN[0],microblaze_riscv_0_ilmb_cntlr_DIN[1],microblaze_riscv_0_ilmb_cntlr_DIN[2],microblaze_riscv_0_ilmb_cntlr_DIN[3],microblaze_riscv_0_ilmb_cntlr_DIN[4],microblaze_riscv_0_ilmb_cntlr_DIN[5],microblaze_riscv_0_ilmb_cntlr_DIN[6],microblaze_riscv_0_ilmb_cntlr_DIN[7],microblaze_riscv_0_ilmb_cntlr_DIN[8],microblaze_riscv_0_ilmb_cntlr_DIN[9],microblaze_riscv_0_ilmb_cntlr_DIN[10],microblaze_riscv_0_ilmb_cntlr_DIN[11],microblaze_riscv_0_ilmb_cntlr_DIN[12],microblaze_riscv_0_ilmb_cntlr_DIN[13],microblaze_riscv_0_ilmb_cntlr_DIN[14],microblaze_riscv_0_ilmb_cntlr_DIN[15],microblaze_riscv_0_ilmb_cntlr_DIN[16],microblaze_riscv_0_ilmb_cntlr_DIN[17],microblaze_riscv_0_ilmb_cntlr_DIN[18],microblaze_riscv_0_ilmb_cntlr_DIN[19],microblaze_riscv_0_ilmb_cntlr_DIN[20],microblaze_riscv_0_ilmb_cntlr_DIN[21],microblaze_riscv_0_ilmb_cntlr_DIN[22],microblaze_riscv_0_ilmb_cntlr_DIN[23],microblaze_riscv_0_ilmb_cntlr_DIN[24],microblaze_riscv_0_ilmb_cntlr_DIN[25],microblaze_riscv_0_ilmb_cntlr_DIN[26],microblaze_riscv_0_ilmb_cntlr_DIN[27],microblaze_riscv_0_ilmb_cntlr_DIN[28],microblaze_riscv_0_ilmb_cntlr_DIN[29],microblaze_riscv_0_ilmb_cntlr_DIN[30],microblaze_riscv_0_ilmb_cntlr_DIN[31]}),
        .douta(microblaze_riscv_0_dlmb_cntlr_DOUT),
        .doutb(microblaze_riscv_0_ilmb_cntlr_DOUT),
        .ena(microblaze_riscv_0_dlmb_cntlr_EN),
        .enb(microblaze_riscv_0_ilmb_cntlr_EN),
        .rsta(microblaze_riscv_0_dlmb_cntlr_RST),
        .rstb(microblaze_riscv_0_ilmb_cntlr_RST),
        .wea({microblaze_riscv_0_dlmb_cntlr_WE[0],microblaze_riscv_0_dlmb_cntlr_WE[1],microblaze_riscv_0_dlmb_cntlr_WE[2],microblaze_riscv_0_dlmb_cntlr_WE[3]}),
        .web({microblaze_riscv_0_ilmb_cntlr_WE[0],microblaze_riscv_0_ilmb_cntlr_WE[1],microblaze_riscv_0_ilmb_cntlr_WE[2],microblaze_riscv_0_ilmb_cntlr_WE[3]}));
endmodule

module microsd_imp_MOJDFN
   (AXI_LITE_araddr,
    AXI_LITE_arready,
    AXI_LITE_arvalid,
    AXI_LITE_awaddr,
    AXI_LITE_awready,
    AXI_LITE_awvalid,
    AXI_LITE_bready,
    AXI_LITE_bresp,
    AXI_LITE_bvalid,
    AXI_LITE_rdata,
    AXI_LITE_rready,
    AXI_LITE_rresp,
    AXI_LITE_rvalid,
    AXI_LITE_wdata,
    AXI_LITE_wready,
    AXI_LITE_wstrb,
    AXI_LITE_wvalid,
    SD_CMD,
    SD_DAT0,
    SD_DAT3,
    SD_RESET,
    SD_SCK,
    ip2intc_irpt,
    reset,
    s_axi_aclk,
    s_axi_aresetn);
  input [31:0]AXI_LITE_araddr;
  output AXI_LITE_arready;
  input AXI_LITE_arvalid;
  input [31:0]AXI_LITE_awaddr;
  output AXI_LITE_awready;
  input AXI_LITE_awvalid;
  input AXI_LITE_bready;
  output [1:0]AXI_LITE_bresp;
  output AXI_LITE_bvalid;
  output [31:0]AXI_LITE_rdata;
  input AXI_LITE_rready;
  output [1:0]AXI_LITE_rresp;
  output AXI_LITE_rvalid;
  input [31:0]AXI_LITE_wdata;
  output AXI_LITE_wready;
  input [3:0]AXI_LITE_wstrb;
  input AXI_LITE_wvalid;
  output SD_CMD;
  input SD_DAT0;
  output SD_DAT3;
  output SD_RESET;
  output SD_SCK;
  output ip2intc_irpt;
  input reset;
  input s_axi_aclk;
  input s_axi_aresetn;

  wire [31:0]AXI_LITE_araddr;
  wire AXI_LITE_arready;
  wire AXI_LITE_arvalid;
  wire [31:0]AXI_LITE_awaddr;
  wire AXI_LITE_awready;
  wire AXI_LITE_awvalid;
  wire AXI_LITE_bready;
  wire [1:0]AXI_LITE_bresp;
  wire AXI_LITE_bvalid;
  wire [31:0]AXI_LITE_rdata;
  wire AXI_LITE_rready;
  wire [1:0]AXI_LITE_rresp;
  wire AXI_LITE_rvalid;
  wire [31:0]AXI_LITE_wdata;
  wire AXI_LITE_wready;
  wire [3:0]AXI_LITE_wstrb;
  wire AXI_LITE_wvalid;
  wire SD_CMD;
  wire SD_DAT0;
  wire SD_DAT3;
  wire SD_RESET;
  wire SD_SCK;
  wire axi_quad_spi_0_io0_o;
  wire axi_quad_spi_0_sck_o;
  wire [0:0]axi_quad_spi_0_ss_o;
  wire ip2intc_irpt;
  wire micro_sd_0_miso;
  wire reset;
  wire s_axi_aclk;
  wire s_axi_aresetn;

  design_1_axi_quad_spi_0_0 axi_quad_spi_0
       (.ext_spi_clk(s_axi_aclk),
        .io0_i(1'b0),
        .io0_o(axi_quad_spi_0_io0_o),
        .io1_i(micro_sd_0_miso),
        .ip2intc_irpt(ip2intc_irpt),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(AXI_LITE_araddr[6:0]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(AXI_LITE_arready),
        .s_axi_arvalid(AXI_LITE_arvalid),
        .s_axi_awaddr(AXI_LITE_awaddr[6:0]),
        .s_axi_awready(AXI_LITE_awready),
        .s_axi_awvalid(AXI_LITE_awvalid),
        .s_axi_bready(AXI_LITE_bready),
        .s_axi_bresp(AXI_LITE_bresp),
        .s_axi_bvalid(AXI_LITE_bvalid),
        .s_axi_rdata(AXI_LITE_rdata),
        .s_axi_rready(AXI_LITE_rready),
        .s_axi_rresp(AXI_LITE_rresp),
        .s_axi_rvalid(AXI_LITE_rvalid),
        .s_axi_wdata(AXI_LITE_wdata),
        .s_axi_wready(AXI_LITE_wready),
        .s_axi_wstrb(AXI_LITE_wstrb),
        .s_axi_wvalid(AXI_LITE_wvalid),
        .sck_i(1'b0),
        .sck_o(axi_quad_spi_0_sck_o),
        .ss_i(1'b0),
        .ss_o(axi_quad_spi_0_ss_o));
  design_1_micro_sd_0_0 micro_sd_0
       (.cs(axi_quad_spi_0_ss_o),
        .miso(micro_sd_0_miso),
        .mosi(axi_quad_spi_0_io0_o),
        .reset(reset),
        .sck(axi_quad_spi_0_sck_o),
        .sd_clk(SD_SCK),
        .sd_cmd(SD_CMD),
        .sd_dat0(SD_DAT0),
        .sd_dat3(SD_DAT3),
        .sd_vdd(SD_RESET));
endmodule

module s00_couplers_imp_6EVSLG
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [127:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [127:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [15:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [7:0]M_AXI_arlen;
  wire [0:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [7:0]M_AXI_awlen;
  wire [0:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire [2:0]M_AXI_awsize;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [127:0]M_AXI_rdata;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [127:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [15:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire S_ACLK;
  wire S_ARESETN;
  wire [31:0]S_AXI_araddr;
  wire [1:0]S_AXI_arburst;
  wire [3:0]S_AXI_arcache;
  wire [7:0]S_AXI_arlen;
  wire [0:0]S_AXI_arlock;
  wire [2:0]S_AXI_arprot;
  wire [3:0]S_AXI_arqos;
  wire S_AXI_arready;
  wire [2:0]S_AXI_arsize;
  wire S_AXI_arvalid;
  wire [31:0]S_AXI_awaddr;
  wire [1:0]S_AXI_awburst;
  wire [3:0]S_AXI_awcache;
  wire [7:0]S_AXI_awlen;
  wire [0:0]S_AXI_awlock;
  wire [2:0]S_AXI_awprot;
  wire [3:0]S_AXI_awqos;
  wire S_AXI_awready;
  wire [2:0]S_AXI_awsize;
  wire S_AXI_awvalid;
  wire S_AXI_bready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire S_AXI_rlast;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire [31:0]S_AXI_wdata;
  wire S_AXI_wlast;
  wire S_AXI_wready;
  wire [3:0]S_AXI_wstrb;
  wire S_AXI_wvalid;

  design_1_ram_interconnect_imp_auto_us_0 auto_us
       (.m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(M_AXI_arsize),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_awaddr(M_AXI_awaddr),
        .m_axi_awburst(M_AXI_awburst),
        .m_axi_awcache(M_AXI_awcache),
        .m_axi_awlen(M_AXI_awlen),
        .m_axi_awlock(M_AXI_awlock),
        .m_axi_awprot(M_AXI_awprot),
        .m_axi_awqos(M_AXI_awqos),
        .m_axi_awready(M_AXI_awready),
        .m_axi_awsize(M_AXI_awsize),
        .m_axi_awvalid(M_AXI_awvalid),
        .m_axi_bready(M_AXI_bready),
        .m_axi_bresp(M_AXI_bresp),
        .m_axi_bvalid(M_AXI_bvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .m_axi_wdata(M_AXI_wdata),
        .m_axi_wlast(M_AXI_wlast),
        .m_axi_wready(M_AXI_wready),
        .m_axi_wstrb(M_AXI_wstrb),
        .m_axi_wvalid(M_AXI_wvalid),
        .s_axi_aclk(S_ACLK),
        .s_axi_araddr(S_AXI_araddr),
        .s_axi_arburst(S_AXI_arburst),
        .s_axi_arcache(S_AXI_arcache),
        .s_axi_aresetn(S_ARESETN),
        .s_axi_arlen(S_AXI_arlen),
        .s_axi_arlock(S_AXI_arlock),
        .s_axi_arprot(S_AXI_arprot),
        .s_axi_arqos(S_AXI_arqos),
        .s_axi_arready(S_AXI_arready),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(S_AXI_arsize),
        .s_axi_arvalid(S_AXI_arvalid),
        .s_axi_awaddr(S_AXI_awaddr),
        .s_axi_awburst(S_AXI_awburst),
        .s_axi_awcache(S_AXI_awcache),
        .s_axi_awlen(S_AXI_awlen),
        .s_axi_awlock(S_AXI_awlock),
        .s_axi_awprot(S_AXI_awprot),
        .s_axi_awqos(S_AXI_awqos),
        .s_axi_awready(S_AXI_awready),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(S_AXI_awsize),
        .s_axi_awvalid(S_AXI_awvalid),
        .s_axi_bready(S_AXI_bready),
        .s_axi_bresp(S_AXI_bresp),
        .s_axi_bvalid(S_AXI_bvalid),
        .s_axi_rdata(S_AXI_rdata),
        .s_axi_rlast(S_AXI_rlast),
        .s_axi_rready(S_AXI_rready),
        .s_axi_rresp(S_AXI_rresp),
        .s_axi_rvalid(S_AXI_rvalid),
        .s_axi_wdata(S_AXI_wdata),
        .s_axi_wlast(S_AXI_wlast),
        .s_axi_wready(S_AXI_wready),
        .s_axi_wstrb(S_AXI_wstrb),
        .s_axi_wvalid(S_AXI_wvalid));
endmodule

module s00_couplers_imp_ZYORBB
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]M_AXI_araddr;
  wire [2:0]M_AXI_arprot;
  wire [0:0]M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire [2:0]M_AXI_awprot;
  wire [0:0]M_AXI_awvalid;
  wire [0:0]M_AXI_bready;
  wire [0:0]M_AXI_rready;
  wire [31:0]M_AXI_wdata;
  wire [3:0]M_AXI_wstrb;
  wire [0:0]M_AXI_wvalid;
  wire [0:0]S_AXI_arready;
  wire [0:0]S_AXI_awready;
  wire [1:0]S_AXI_bresp;
  wire [0:0]S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire [1:0]S_AXI_rresp;
  wire [0:0]S_AXI_rvalid;
  wire [0:0]S_AXI_wready;

  assign M_AXI_araddr = S_AXI_araddr[31:0];
  assign M_AXI_arprot = S_AXI_arprot[2:0];
  assign M_AXI_arvalid = S_AXI_arvalid[0];
  assign M_AXI_awaddr = S_AXI_awaddr[31:0];
  assign M_AXI_awprot = S_AXI_awprot[2:0];
  assign M_AXI_awvalid = S_AXI_awvalid[0];
  assign M_AXI_bready = S_AXI_bready[0];
  assign M_AXI_rready = S_AXI_rready[0];
  assign M_AXI_wdata = S_AXI_wdata[31:0];
  assign M_AXI_wstrb = S_AXI_wstrb[3:0];
  assign M_AXI_wvalid = S_AXI_wvalid[0];
  assign S_AXI_arready = M_AXI_arready[0];
  assign S_AXI_awready = M_AXI_awready[0];
  assign S_AXI_bresp = M_AXI_bresp[1:0];
  assign S_AXI_bvalid = M_AXI_bvalid[0];
  assign S_AXI_rdata = M_AXI_rdata[31:0];
  assign S_AXI_rresp = M_AXI_rresp[1:0];
  assign S_AXI_rvalid = M_AXI_rvalid[0];
  assign S_AXI_wready = M_AXI_wready[0];
endmodule

module s01_couplers_imp_1WWBO11
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  input [127:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  output [31:0]S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;

  wire [31:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [7:0]M_AXI_arlen;
  wire [0:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [127:0]M_AXI_rdata;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire S_ACLK;
  wire S_ARESETN;
  wire [31:0]S_AXI_araddr;
  wire [1:0]S_AXI_arburst;
  wire [3:0]S_AXI_arcache;
  wire [7:0]S_AXI_arlen;
  wire [0:0]S_AXI_arlock;
  wire [2:0]S_AXI_arprot;
  wire [3:0]S_AXI_arqos;
  wire S_AXI_arready;
  wire [2:0]S_AXI_arsize;
  wire S_AXI_arvalid;
  wire [31:0]S_AXI_rdata;
  wire S_AXI_rlast;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;

  design_1_ram_interconnect_imp_auto_us_1 auto_us
       (.m_axi_araddr(M_AXI_araddr),
        .m_axi_arburst(M_AXI_arburst),
        .m_axi_arcache(M_AXI_arcache),
        .m_axi_arlen(M_AXI_arlen),
        .m_axi_arlock(M_AXI_arlock),
        .m_axi_arprot(M_AXI_arprot),
        .m_axi_arqos(M_AXI_arqos),
        .m_axi_arready(M_AXI_arready),
        .m_axi_arsize(M_AXI_arsize),
        .m_axi_arvalid(M_AXI_arvalid),
        .m_axi_rdata(M_AXI_rdata),
        .m_axi_rlast(M_AXI_rlast),
        .m_axi_rready(M_AXI_rready),
        .m_axi_rresp(M_AXI_rresp),
        .m_axi_rvalid(M_AXI_rvalid),
        .s_axi_aclk(S_ACLK),
        .s_axi_araddr(S_AXI_araddr),
        .s_axi_arburst(S_AXI_arburst),
        .s_axi_arcache(S_AXI_arcache),
        .s_axi_aresetn(S_ARESETN),
        .s_axi_arlen(S_AXI_arlen),
        .s_axi_arlock(S_AXI_arlock),
        .s_axi_arprot(S_AXI_arprot),
        .s_axi_arqos(S_AXI_arqos),
        .s_axi_arready(S_AXI_arready),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(S_AXI_arsize),
        .s_axi_arvalid(S_AXI_arvalid),
        .s_axi_rdata(S_AXI_rdata),
        .s_axi_rlast(S_AXI_rlast),
        .s_axi_rready(S_AXI_rready),
        .s_axi_rresp(S_AXI_rresp),
        .s_axi_rvalid(S_AXI_rvalid));
endmodule
