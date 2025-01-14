-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Sun Jan 12 22:24:10 2025
-- Host        : mint-ssd running 64-bit Linux Mint 21.1
-- Command     : write_vhdl -force -mode funcsim
--               /home/maxwelljung/programming/fpga-gpu/vivado/doom/doom.gen/sources_1/bd/design_1/ip/design_1_micro_sd_0_0/design_1_micro_sd_0_0_sim_netlist.vhdl
-- Design      : design_1_micro_sd_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_micro_sd_0_0 is
  port (
    reset : in STD_LOGIC;
    sck : in STD_LOGIC;
    cs : in STD_LOGIC;
    mosi : in STD_LOGIC;
    miso : out STD_LOGIC;
    sd_vdd : out STD_LOGIC;
    sd_clk : out STD_LOGIC;
    sd_dat3 : out STD_LOGIC;
    sd_cmd : out STD_LOGIC;
    sd_dat0 : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_micro_sd_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_micro_sd_0_0 : entity is "design_1_micro_sd_0_0,micro_sd,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_micro_sd_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_micro_sd_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_micro_sd_0_0 : entity is "micro_sd,Vivado 2024.2";
end design_1_micro_sd_0_0;

architecture STRUCTURE of design_1_micro_sd_0_0 is
  signal \^cs\ : STD_LOGIC;
  signal \^mosi\ : STD_LOGIC;
  signal \^reset\ : STD_LOGIC;
  signal \^sck\ : STD_LOGIC;
  signal \^sd_dat0\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of reset : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of sd_clk : signal is "xilinx.com:signal:clock:1.0 sd_clk CLK";
  attribute X_INTERFACE_MODE of sd_clk : signal is "master";
  attribute X_INTERFACE_PARAMETER of sd_clk : signal is "XIL_INTERFACENAME sd_clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_micro_sd_0_0_sd_clk, INSERT_VIP 0";
begin
  \^cs\ <= cs;
  \^mosi\ <= mosi;
  \^reset\ <= reset;
  \^sck\ <= sck;
  \^sd_dat0\ <= sd_dat0;
  miso <= \^sd_dat0\;
  sd_clk <= \^sck\;
  sd_cmd <= \^mosi\;
  sd_dat3 <= \^cs\;
  sd_vdd <= \^reset\;
end STRUCTURE;
