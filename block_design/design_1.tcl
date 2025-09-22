
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2024.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# micro_sd, gpu_wrapper

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
   set_property BOARD_PART digilentinc.com:nexys-a7-100t:part0:1.3 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:mig_7series:4.2\
xilinx.com:ip:util_ds_buf:2.2\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:axi_uartlite:2.0\
xilinx.com:ip:microblaze_riscv:1.0\
xilinx.com:ip:axi_intc:4.1\
xilinx.com:ip:xlconcat:2.1\
xilinx.com:ip:mdm_riscv:1.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:axi_timer:2.0\
xilinx.com:ip:axi_gpio:2.0\
xilinx.com:ip:axi_dma:7.1\
xilinx.com:ip:lmb_v10:3.0\
xilinx.com:ip:lmb_bram_if_cntlr:4.0\
xilinx.com:ip:blk_mem_gen:8.4\
xilinx.com:ip:axi_quad_spi:3.2\
xilinx.com:ip:axi_bram_ctrl:4.1\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
micro_sd\
gpu_wrapper\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}


##################################################################
# MIG PRJ FILE TCL PROCs
##################################################################

proc write_mig_file_design_1_mig_7series_0_0 { str_mig_prj_filepath } {

   file mkdir [ file dirname "$str_mig_prj_filepath" ]
   set mig_prj_file [open $str_mig_prj_filepath  w+]

   puts $mig_prj_file {﻿<?xml version="1.0" encoding="UTF-8" standalone="no" ?>}
   puts $mig_prj_file {<Project NoOfControllers="1">}
   puts $mig_prj_file {  }
   puts $mig_prj_file {<!-- IMPORTANT: This is an internal file that has been generated by the MIG software. Any direct editing or changes made to this file may result in unpredictable behavior or data corruption. It is strongly advised that users do not edit the contents of this file. Re-run the MIG GUI with the required settings if any of the options provided below need to be altered. -->}
   puts $mig_prj_file {  <ModuleName>design_1_mig_7series_0_0</ModuleName>}
   puts $mig_prj_file {  <dci_inouts_inputs>1</dci_inouts_inputs>}
   puts $mig_prj_file {  <dci_inputs>1</dci_inputs>}
   puts $mig_prj_file {  <Debug_En>OFF</Debug_En>}
   puts $mig_prj_file {  <DataDepth_En>1024</DataDepth_En>}
   puts $mig_prj_file {  <LowPower_En>ON</LowPower_En>}
   puts $mig_prj_file {  <XADC_En>Enabled</XADC_En>}
   puts $mig_prj_file {  <TargetFPGA>xc7a100t-csg324/-1</TargetFPGA>}
   puts $mig_prj_file {  <Version>4.2</Version>}
   puts $mig_prj_file {  <SystemClock>No Buffer</SystemClock>}
   puts $mig_prj_file {  <ReferenceClock>No Buffer</ReferenceClock>}
   puts $mig_prj_file {  <SysResetPolarity>ACTIVE LOW</SysResetPolarity>}
   puts $mig_prj_file {  <BankSelectionFlag>FALSE</BankSelectionFlag>}
   puts $mig_prj_file {  <InternalVref>1</InternalVref>}
   puts $mig_prj_file {  <dci_hr_inouts_inputs>50 Ohms</dci_hr_inouts_inputs>}
   puts $mig_prj_file {  <dci_cascade>0</dci_cascade>}
   puts $mig_prj_file {  <FPGADevice>}
   puts $mig_prj_file {    <selected>7a/xc7a50t-csg324</selected>}
   puts $mig_prj_file {  </FPGADevice>}
   puts $mig_prj_file {  <Controller number="0">}
   puts $mig_prj_file {    <MemoryDevice>DDR2_SDRAM/Components/MT47H64M16HR-25E</MemoryDevice>}
   puts $mig_prj_file {    <TimePeriod>3077</TimePeriod>}
   puts $mig_prj_file {    <VccAuxIO>1.8V</VccAuxIO>}
   puts $mig_prj_file {    <PHYRatio>4:1</PHYRatio>}
   puts $mig_prj_file {    <InputClkFreq>99.997</InputClkFreq>}
   puts $mig_prj_file {    <UIExtraClocks>0</UIExtraClocks>}
   puts $mig_prj_file {    <MMCM_VCO>1200</MMCM_VCO>}
   puts $mig_prj_file {    <MMCMClkOut0> 1.000</MMCMClkOut0>}
   puts $mig_prj_file {    <MMCMClkOut1>1</MMCMClkOut1>}
   puts $mig_prj_file {    <MMCMClkOut2>1</MMCMClkOut2>}
   puts $mig_prj_file {    <MMCMClkOut3>1</MMCMClkOut3>}
   puts $mig_prj_file {    <MMCMClkOut4>1</MMCMClkOut4>}
   puts $mig_prj_file {    <DataWidth>16</DataWidth>}
   puts $mig_prj_file {    <DeepMemory>1</DeepMemory>}
   puts $mig_prj_file {    <DataMask>1</DataMask>}
   puts $mig_prj_file {    <ECC>Disabled</ECC>}
   puts $mig_prj_file {    <Ordering>Strict</Ordering>}
   puts $mig_prj_file {    <BankMachineCnt>4</BankMachineCnt>}
   puts $mig_prj_file {    <CustomPart>FALSE</CustomPart>}
   puts $mig_prj_file {    <NewPartName/>}
   puts $mig_prj_file {    <RowAddress>13</RowAddress>}
   puts $mig_prj_file {    <ColAddress>10</ColAddress>}
   puts $mig_prj_file {    <BankAddress>3</BankAddress>}
   puts $mig_prj_file {    <C0_MEM_SIZE>134217728</C0_MEM_SIZE>}
   puts $mig_prj_file {    <UserMemoryAddressMap>BANK_ROW_COLUMN</UserMemoryAddressMap>}
   puts $mig_prj_file {    <PinSelection>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="M4" SLEW="" VCCAUX_IO="" name="ddr2_addr[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="R2" SLEW="" VCCAUX_IO="" name="ddr2_addr[10]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="K5" SLEW="" VCCAUX_IO="" name="ddr2_addr[11]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="N6" SLEW="" VCCAUX_IO="" name="ddr2_addr[12]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="P4" SLEW="" VCCAUX_IO="" name="ddr2_addr[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="M6" SLEW="" VCCAUX_IO="" name="ddr2_addr[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="T1" SLEW="" VCCAUX_IO="" name="ddr2_addr[3]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="L3" SLEW="" VCCAUX_IO="" name="ddr2_addr[4]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="P5" SLEW="" VCCAUX_IO="" name="ddr2_addr[5]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="M2" SLEW="" VCCAUX_IO="" name="ddr2_addr[6]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="N1" SLEW="" VCCAUX_IO="" name="ddr2_addr[7]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="L4" SLEW="" VCCAUX_IO="" name="ddr2_addr[8]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="N5" SLEW="" VCCAUX_IO="" name="ddr2_addr[9]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="P2" SLEW="" VCCAUX_IO="" name="ddr2_ba[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="P3" SLEW="" VCCAUX_IO="" name="ddr2_ba[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="R1" SLEW="" VCCAUX_IO="" name="ddr2_ba[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="L1" SLEW="" VCCAUX_IO="" name="ddr2_cas_n"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL18_II" PADName="L5" SLEW="" VCCAUX_IO="" name="ddr2_ck_n[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL18_II" PADName="L6" SLEW="" VCCAUX_IO="" name="ddr2_ck_p[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="M1" SLEW="" VCCAUX_IO="" name="ddr2_cke[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="K6" SLEW="" VCCAUX_IO="" name="ddr2_cs_n[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="T6" SLEW="" VCCAUX_IO="" name="ddr2_dm[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="U1" SLEW="" VCCAUX_IO="" name="ddr2_dm[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="R7" SLEW="" VCCAUX_IO="" name="ddr2_dq[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="V5" SLEW="" VCCAUX_IO="" name="ddr2_dq[10]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="U4" SLEW="" VCCAUX_IO="" name="ddr2_dq[11]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="V4" SLEW="" VCCAUX_IO="" name="ddr2_dq[12]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="T4" SLEW="" VCCAUX_IO="" name="ddr2_dq[13]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="V1" SLEW="" VCCAUX_IO="" name="ddr2_dq[14]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="T3" SLEW="" VCCAUX_IO="" name="ddr2_dq[15]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="V6" SLEW="" VCCAUX_IO="" name="ddr2_dq[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="R8" SLEW="" VCCAUX_IO="" name="ddr2_dq[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="U7" SLEW="" VCCAUX_IO="" name="ddr2_dq[3]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="V7" SLEW="" VCCAUX_IO="" name="ddr2_dq[4]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="R6" SLEW="" VCCAUX_IO="" name="ddr2_dq[5]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="U6" SLEW="" VCCAUX_IO="" name="ddr2_dq[6]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="R5" SLEW="" VCCAUX_IO="" name="ddr2_dq[7]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="T5" SLEW="" VCCAUX_IO="" name="ddr2_dq[8]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="U3" SLEW="" VCCAUX_IO="" name="ddr2_dq[9]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL18_II" PADName="V9" SLEW="" VCCAUX_IO="" name="ddr2_dqs_n[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL18_II" PADName="V2" SLEW="" VCCAUX_IO="" name="ddr2_dqs_n[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL18_II" PADName="U9" SLEW="" VCCAUX_IO="" name="ddr2_dqs_p[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL18_II" PADName="U2" SLEW="" VCCAUX_IO="" name="ddr2_dqs_p[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="M3" SLEW="" VCCAUX_IO="" name="ddr2_odt[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="N4" SLEW="" VCCAUX_IO="" name="ddr2_ras_n"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL18_II" PADName="N2" SLEW="" VCCAUX_IO="" name="ddr2_we_n"/>}
   puts $mig_prj_file {    </PinSelection>}
   puts $mig_prj_file {    <System_Control>}
   puts $mig_prj_file {      <Pin Bank="Select Bank" PADName="No connect" name="sys_rst"/>}
   puts $mig_prj_file {      <Pin Bank="Select Bank" PADName="No connect" name="init_calib_complete"/>}
   puts $mig_prj_file {      <Pin Bank="Select Bank" PADName="No connect" name="tg_compare_error"/>}
   puts $mig_prj_file {    </System_Control>}
   puts $mig_prj_file {    <TimingParameters>}
   puts $mig_prj_file {      <Parameters tfaw="45" tras="40" trcd="15" trefi="7.8" trfc="127.5" trp="12.5" trrd="10" trtp="7.5" twtr="7.5"/>}
   puts $mig_prj_file {    </TimingParameters>}
   puts $mig_prj_file {    <mrBurstLength name="Burst Length">8</mrBurstLength>}
   puts $mig_prj_file {    <mrBurstType name="Burst Type">Sequential</mrBurstType>}
   puts $mig_prj_file {    <mrCasLatency name="CAS Latency">5</mrCasLatency>}
   puts $mig_prj_file {    <mrMode name="Mode">Normal</mrMode>}
   puts $mig_prj_file {    <mrDllReset name="DLL Reset">No</mrDllReset>}
   puts $mig_prj_file {    <mrPdMode name="PD Mode">Fast exit</mrPdMode>}
   puts $mig_prj_file {    <mrWriteRecovery name="Write Recovery">5</mrWriteRecovery>}
   puts $mig_prj_file {    <emrDllEnable name="DLL Enable">Enable-Normal</emrDllEnable>}
   puts $mig_prj_file {    <emrOutputDriveStrength name="Output Drive Strength">Fullstrength</emrOutputDriveStrength>}
   puts $mig_prj_file {    <emrCSSelection name="Controller Chip Select Pin">Enable</emrCSSelection>}
   puts $mig_prj_file {    <emrCKSelection name="Memory Clock Selection">1</emrCKSelection>}
   puts $mig_prj_file {    <emrRTT name="RTT (nominal) - ODT">50ohms</emrRTT>}
   puts $mig_prj_file {    <emrPosted name="Additive Latency (AL)">0</emrPosted>}
   puts $mig_prj_file {    <emrOCD name="OCD Operation">OCD Exit</emrOCD>}
   puts $mig_prj_file {    <emrDQS name="DQS# Enable">Enable</emrDQS>}
   puts $mig_prj_file {    <emrRDQS name="RDQS Enable">Disable</emrRDQS>}
   puts $mig_prj_file {    <emrOutputs name="Outputs">Enable</emrOutputs>}
   puts $mig_prj_file {    <PortInterface>AXI</PortInterface>}
   puts $mig_prj_file {    <AXIParameters>}
   puts $mig_prj_file {      <C0_C_RD_WR_ARB_ALGORITHM>RD_PRI_REG</C0_C_RD_WR_ARB_ALGORITHM>}
   puts $mig_prj_file {      <C0_S_AXI_ADDR_WIDTH>27</C0_S_AXI_ADDR_WIDTH>}
   puts $mig_prj_file {      <C0_S_AXI_DATA_WIDTH>128</C0_S_AXI_DATA_WIDTH>}
   puts $mig_prj_file {      <C0_S_AXI_ID_WIDTH>1</C0_S_AXI_ID_WIDTH>}
   puts $mig_prj_file {      <C0_S_AXI_SUPPORTS_NARROW_BURST>0</C0_S_AXI_SUPPORTS_NARROW_BURST>}
   puts $mig_prj_file {    </AXIParameters>}
   puts $mig_prj_file {  </Controller>}
   puts $mig_prj_file {</Project>}

   close $mig_prj_file
}
# End of write_mig_file_design_1_mig_7series_0_0()



##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: axi_gpu
proc create_hier_cell_axi_gpu { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_axi_gpu() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 axis


  # Create pins
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn
  create_bd_pin -dir I -type clk gpu_clk
  create_bd_pin -dir I -type rst reset
  create_bd_pin -dir I -type clk vga_clk
  create_bd_pin -dir O VGA_HS
  create_bd_pin -dir O VGA_VS
  create_bd_pin -dir O -from 3 -to 0 VGA_R
  create_bd_pin -dir O -from 3 -to 0 VGA_G
  create_bd_pin -dir O -from 3 -to 0 VGA_B

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property CONFIG.SINGLE_PORT_BRAM {1} $axi_bram_ctrl_0


  # Create instance: gpu_wrapper_0, and set properties
  set block_name gpu_wrapper
  set block_cell_name gpu_wrapper_0
  if { [catch {set gpu_wrapper_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gpu_wrapper_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.HEAP_INIT_FILE {~/programming/fpga-gpu/data/gpu_heap_init.mem} \
    CONFIG.MEM_INIT_FILE {~/programming/fpga-gpu/build/firmware/gputest.mem} \
  ] $gpu_wrapper_0


  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins gpu_wrapper_0/axis] [get_bd_intf_pins axis]
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_periph_M05_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_bram_ctrl_0/S_AXI]

  # Create port connections
  connect_bd_net -net axi_bram_ctrl_0_bram_addr_a  [get_bd_pins axi_bram_ctrl_0/bram_addr_a] \
  [get_bd_pins gpu_wrapper_0/io_reg_port_a_addr]
  connect_bd_net -net axi_bram_ctrl_0_bram_clk_a  [get_bd_pins axi_bram_ctrl_0/bram_clk_a] \
  [get_bd_pins gpu_wrapper_0/io_reg_port_a_clk]
  connect_bd_net -net axi_bram_ctrl_0_bram_en_a  [get_bd_pins axi_bram_ctrl_0/bram_en_a] \
  [get_bd_pins gpu_wrapper_0/io_reg_port_a_rd_en]
  connect_bd_net -net axi_bram_ctrl_0_bram_rst_a  [get_bd_pins axi_bram_ctrl_0/bram_rst_a] \
  [get_bd_pins gpu_wrapper_0/io_reg_port_a_reset]
  connect_bd_net -net axi_bram_ctrl_0_bram_we_a  [get_bd_pins axi_bram_ctrl_0/bram_we_a] \
  [get_bd_pins gpu_wrapper_0/io_reg_port_a_wr_en]
  connect_bd_net -net axi_bram_ctrl_0_bram_wrdata_a  [get_bd_pins axi_bram_ctrl_0/bram_wrdata_a] \
  [get_bd_pins gpu_wrapper_0/io_reg_port_a_wr_data]
  connect_bd_net -net clk_wiz_0_gpu_clk  [get_bd_pins gpu_clk] \
  [get_bd_pins gpu_wrapper_0/gpu_clk]
  connect_bd_net -net clk_wiz_0_vga_clk  [get_bd_pins vga_clk] \
  [get_bd_pins gpu_wrapper_0/vga_clk]
  connect_bd_net -net gpu_wrapper_0_io_reg_port_a_rd_data  [get_bd_pins gpu_wrapper_0/io_reg_port_a_rd_data] \
  [get_bd_pins axi_bram_ctrl_0/bram_rddata_a]
  connect_bd_net -net gpu_wrapper_0_vga_b  [get_bd_pins gpu_wrapper_0/vga_b] \
  [get_bd_pins VGA_B]
  connect_bd_net -net gpu_wrapper_0_vga_g  [get_bd_pins gpu_wrapper_0/vga_g] \
  [get_bd_pins VGA_G]
  connect_bd_net -net gpu_wrapper_0_vga_hs  [get_bd_pins gpu_wrapper_0/vga_hs] \
  [get_bd_pins VGA_HS]
  connect_bd_net -net gpu_wrapper_0_vga_r  [get_bd_pins gpu_wrapper_0/vga_r] \
  [get_bd_pins VGA_R]
  connect_bd_net -net gpu_wrapper_0_vga_vs  [get_bd_pins gpu_wrapper_0/vga_vs] \
  [get_bd_pins VGA_VS]
  connect_bd_net -net microblaze_riscv_0_Clk  [get_bd_pins s_axi_aclk] \
  [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] \
  [get_bd_pins gpu_wrapper_0/axis_clk]
  connect_bd_net -net rst_clk_wiz_0_200M_peripheral_aresetn  [get_bd_pins s_axi_aresetn] \
  [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] \
  [get_bd_pins gpu_wrapper_0/axis_aresetn]
  connect_bd_net -net rst_clk_wiz_0_200M_peripheral_reset  [get_bd_pins reset] \
  [get_bd_pins gpu_wrapper_0/reset]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microsd
proc create_hier_cell_microsd { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_microsd() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI_LITE


  # Create pins
  create_bd_pin -dir I -type rst reset
  create_bd_pin -dir O SD_RESET
  create_bd_pin -dir O -type clk SD_SCK
  create_bd_pin -dir O SD_DAT3
  create_bd_pin -dir O SD_CMD
  create_bd_pin -dir I SD_DAT0
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn
  create_bd_pin -dir O -type intr ip2intc_irpt

  # Create instance: micro_sd_0, and set properties
  set block_name micro_sd
  set block_cell_name micro_sd_0
  if { [catch {set micro_sd_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $micro_sd_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axi_quad_spi_0, and set properties
  set axi_quad_spi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_0 ]
  set_property -dict [list \
    CONFIG.C_SCK_RATIO {8} \
    CONFIG.C_USE_STARTUP {0} \
    CONFIG.QSPI_BOARD_INTERFACE {Custom} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $axi_quad_spi_0


  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_periph_M04_AXI [get_bd_intf_pins AXI_LITE] [get_bd_intf_pins axi_quad_spi_0/AXI_LITE]

  # Create port connections
  connect_bd_net -net axi_quad_spi_0_io0_o  [get_bd_pins axi_quad_spi_0/io0_o] \
  [get_bd_pins micro_sd_0/mosi]
  connect_bd_net -net axi_quad_spi_0_ip2intc_irpt  [get_bd_pins axi_quad_spi_0/ip2intc_irpt] \
  [get_bd_pins ip2intc_irpt]
  connect_bd_net -net axi_quad_spi_0_sck_o  [get_bd_pins axi_quad_spi_0/sck_o] \
  [get_bd_pins micro_sd_0/sck]
  connect_bd_net -net axi_quad_spi_0_ss_o  [get_bd_pins axi_quad_spi_0/ss_o] \
  [get_bd_pins micro_sd_0/cs]
  connect_bd_net -net micro_sd_0_miso  [get_bd_pins micro_sd_0/miso] \
  [get_bd_pins axi_quad_spi_0/io1_i]
  connect_bd_net -net micro_sd_0_sd_clk  [get_bd_pins micro_sd_0/sd_clk] \
  [get_bd_pins SD_SCK]
  connect_bd_net -net micro_sd_0_sd_cmd  [get_bd_pins micro_sd_0/sd_cmd] \
  [get_bd_pins SD_CMD]
  connect_bd_net -net micro_sd_0_sd_dat3  [get_bd_pins micro_sd_0/sd_dat3] \
  [get_bd_pins SD_DAT3]
  connect_bd_net -net micro_sd_0_sd_vdd  [get_bd_pins micro_sd_0/sd_vdd] \
  [get_bd_pins SD_RESET]
  connect_bd_net -net microblaze_riscv_0_Clk  [get_bd_pins s_axi_aclk] \
  [get_bd_pins axi_quad_spi_0/s_axi_aclk] \
  [get_bd_pins axi_quad_spi_0/ext_spi_clk]
  connect_bd_net -net rst_clk_wiz_0_200M_peripheral_aresetn  [get_bd_pins s_axi_aresetn] \
  [get_bd_pins axi_quad_spi_0/s_axi_aresetn]
  connect_bd_net -net rst_clk_wiz_0_200M_peripheral_reset  [get_bd_pins reset] \
  [get_bd_pins micro_sd_0/reset]
  connect_bd_net -net sd_dat0_0_1  [get_bd_pins SD_DAT0] \
  [get_bd_pins micro_sd_0/sd_dat0]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microblaze_riscv_0_local_memory
proc create_hier_cell_microblaze_riscv_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_microblaze_riscv_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB

  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB


  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -type rst SYS_Rst

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property CONFIG.C_ECC {0} $dlmb_bram_if_cntlr


  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property CONFIG.C_ECC {0} $ilmb_bram_if_cntlr


  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram ]
  set_property -dict [list \
    CONFIG.Memory_Type {True_Dual_Port_RAM} \
    CONFIG.use_bram_block {BRAM_Controller} \
  ] $lmb_bram


  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_riscv_0_dlmb [get_bd_intf_pins dlmb_v10/LMB_M] [get_bd_intf_pins DLMB]
  connect_bd_intf_net -intf_net microblaze_riscv_0_dlmb_bus [get_bd_intf_pins dlmb_v10/LMB_Sl_0] [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB]
  connect_bd_intf_net -intf_net microblaze_riscv_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_riscv_0_ilmb [get_bd_intf_pins ilmb_v10/LMB_M] [get_bd_intf_pins ILMB]
  connect_bd_intf_net -intf_net microblaze_riscv_0_ilmb_bus [get_bd_intf_pins ilmb_v10/LMB_Sl_0] [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB]
  connect_bd_intf_net -intf_net microblaze_riscv_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1  [get_bd_pins SYS_Rst] \
  [get_bd_pins dlmb_v10/SYS_Rst] \
  [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] \
  [get_bd_pins ilmb_v10/SYS_Rst] \
  [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst]
  connect_bd_net -net microblaze_riscv_0_Clk  [get_bd_pins LMB_Clk] \
  [get_bd_pins dlmb_v10/LMB_Clk] \
  [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] \
  [get_bd_pins ilmb_v10/LMB_Clk] \
  [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ddr2_sdram [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 ddr2_sdram ]

  set usb_uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 usb_uart ]

  set led_16bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 led_16bits ]

  set rgb_led [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 rgb_led ]

  set dip_switches_16bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 dip_switches_16bits ]

  set push_buttons_5bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 push_buttons_5bits ]


  # Create ports
  set CLK100MHZ [ create_bd_port -dir I -type clk -freq_hz 100000000 CLK100MHZ ]
  set CPU_RESETN [ create_bd_port -dir I -type rst CPU_RESETN ]
  set SD_DAT0 [ create_bd_port -dir I SD_DAT0 ]
  set SD_CMD [ create_bd_port -dir O SD_CMD ]
  set SD_DAT3 [ create_bd_port -dir O SD_DAT3 ]
  set SD_SCK [ create_bd_port -dir O -type clk SD_SCK ]
  set SD_RESET [ create_bd_port -dir O SD_RESET ]
  set VGA_R [ create_bd_port -dir O -from 3 -to 0 VGA_R ]
  set VGA_G [ create_bd_port -dir O -from 3 -to 0 VGA_G ]
  set VGA_B [ create_bd_port -dir O -from 3 -to 0 VGA_B ]
  set VGA_HS [ create_bd_port -dir O VGA_HS ]
  set VGA_VS [ create_bd_port -dir O VGA_VS ]

  # Create instance: mig_7series_0, and set properties
  set mig_7series_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:4.2 mig_7series_0 ]

  # Generate the PRJ File for MIG
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name $mig_7series_0 ] ] ]
  set str_mig_file_name mig_a.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}
  write_mig_file_design_1_mig_7series_0_0 $str_mig_file_path

  set_property -dict [list \
    CONFIG.BOARD_MIG_PARAM {ddr2_sdram} \
    CONFIG.RESET_BOARD_INTERFACE {Custom} \
    CONFIG.XML_INPUT_FILE {mig_a.prj} \
  ] $mig_7series_0


  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf_0 ]
  set_property CONFIG.C_BUF_TYPE {BUFG} $util_ds_buf_0


  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [list \
    CONFIG.CLKOUT1_JITTER {130.958} \
    CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100} \
    CONFIG.CLKOUT2_JITTER {114.829} \
    CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200} \
    CONFIG.CLKOUT2_USED {true} \
    CONFIG.CLKOUT3_JITTER {159.371} \
    CONFIG.CLKOUT3_PHASE_ERROR {98.575} \
    CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {40} \
    CONFIG.CLKOUT3_USED {true} \
    CONFIG.CLKOUT4_JITTER {130.958} \
    CONFIG.CLKOUT4_PHASE_ERROR {98.575} \
    CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {100} \
    CONFIG.CLKOUT4_USED {true} \
    CONFIG.CLK_OUT1_PORT {cpu_clk} \
    CONFIG.CLK_OUT2_PORT {ddr_clk} \
    CONFIG.CLK_OUT3_PORT {vga_clk} \
    CONFIG.CLK_OUT4_PORT {gpu_clk} \
    CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
    CONFIG.MMCM_CLKIN1_PERIOD {10.000} \
    CONFIG.MMCM_CLKIN2_PERIOD {10.000} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {10.000} \
    CONFIG.MMCM_CLKOUT1_DIVIDE {5} \
    CONFIG.MMCM_CLKOUT2_DIVIDE {25} \
    CONFIG.MMCM_CLKOUT3_DIVIDE {10} \
    CONFIG.MMCM_DIVCLK_DIVIDE {1} \
    CONFIG.NUM_OUT_CLKS {4} \
    CONFIG.PRIM_SOURCE {No_buffer} \
    CONFIG.RESET_PORT {resetn} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
  ] $clk_wiz_0


  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [list \
    CONFIG.UARTLITE_BOARD_INTERFACE {usb_uart} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $axi_uartlite_0


  # Create instance: microblaze_riscv_0, and set properties
  set microblaze_riscv_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze_riscv:1.0 microblaze_riscv_0 ]
  set_property -dict [list \
    CONFIG.C_DEBUG_ENABLED {1} \
    CONFIG.C_D_AXI {1} \
    CONFIG.C_D_LMB {1} \
    CONFIG.C_I_LMB {1} \
    CONFIG.G_TEMPLATE_LIST {2} \
  ] $microblaze_riscv_0


  # Create instance: microblaze_riscv_0_local_memory
  create_hier_cell_microblaze_riscv_0_local_memory [current_bd_instance .] microblaze_riscv_0_local_memory

  # Create instance: microblaze_riscv_0_axi_periph, and set properties
  set microblaze_riscv_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_riscv_0_axi_periph ]
  set_property -dict [list \
    CONFIG.NUM_MI {8} \
    CONFIG.NUM_SI {4} \
  ] $microblaze_riscv_0_axi_periph


  # Create instance: microblaze_riscv_0_axi_intc, and set properties
  set microblaze_riscv_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_riscv_0_axi_intc ]
  set_property CONFIG.C_HAS_FAST {1} $microblaze_riscv_0_axi_intc


  # Create instance: microblaze_riscv_0_xlconcat, and set properties
  set microblaze_riscv_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_riscv_0_xlconcat ]
  set_property CONFIG.NUM_PORTS {3} $microblaze_riscv_0_xlconcat


  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm_riscv:1.0 mdm_1 ]

  # Create instance: rst_clk_wiz_0_200M, and set properties
  set rst_clk_wiz_0_200M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_0_200M ]

  # Create instance: ram_interconnect, and set properties
  set ram_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ram_interconnect ]
  set_property -dict [list \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_SI {2} \
  ] $ram_interconnect


  # Create instance: rst_mig_7series_0_81M, and set properties
  set rst_mig_7series_0_81M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_81M ]

  # Create instance: axi_timer_0, and set properties
  set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0 ]
  set_property -dict [list \
    CONFIG.enable_timer2 {1} \
    CONFIG.mode_64bit {0} \
  ] $axi_timer_0


  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [list \
    CONFIG.C_INTERRUPT_PRESENT {0} \
    CONFIG.GPIO2_BOARD_INTERFACE {rgb_led} \
    CONFIG.GPIO_BOARD_INTERFACE {led_16bits} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $axi_gpio_0


  # Create instance: axi_gpio_1, and set properties
  set axi_gpio_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_1 ]
  set_property -dict [list \
    CONFIG.C_INTERRUPT_PRESENT {1} \
    CONFIG.GPIO2_BOARD_INTERFACE {push_buttons_5bits} \
    CONFIG.GPIO_BOARD_INTERFACE {dip_switches_16bits} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $axi_gpio_1


  # Create instance: microsd
  create_hier_cell_microsd [current_bd_instance .] microsd

  # Create instance: axi_gpu
  create_hier_cell_axi_gpu [current_bd_instance .] axi_gpu

  # Create instance: axi_dma_0, and set properties
  set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_dma_0_M_AXIS_MM2S [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] [get_bd_intf_pins axi_gpu/axis]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_MM2S [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins microblaze_riscv_0_axi_periph/S01_AXI]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_S2MM [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins microblaze_riscv_0_axi_periph/S02_AXI]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_SG [get_bd_intf_pins axi_dma_0/M_AXI_SG] [get_bd_intf_pins microblaze_riscv_0_axi_periph/S03_AXI]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports led_16bits] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO2 [get_bd_intf_ports rgb_led] [get_bd_intf_pins axi_gpio_0/GPIO2]
  connect_bd_intf_net -intf_net axi_gpio_1_GPIO [get_bd_intf_ports dip_switches_16bits] [get_bd_intf_pins axi_gpio_1/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_1_GPIO2 [get_bd_intf_ports push_buttons_5bits] [get_bd_intf_pins axi_gpio_1/GPIO2]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports usb_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net microblaze_riscv_0_M_AXI_DC [get_bd_intf_pins microblaze_riscv_0/M_AXI_DC] [get_bd_intf_pins ram_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_riscv_0_M_AXI_IC [get_bd_intf_pins microblaze_riscv_0/M_AXI_IC] [get_bd_intf_pins ram_interconnect/S01_AXI]
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_dp [get_bd_intf_pins microblaze_riscv_0_axi_periph/S00_AXI] [get_bd_intf_pins microblaze_riscv_0/M_AXI_DP]
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_periph_M01_AXI [get_bd_intf_pins microblaze_riscv_0_axi_periph/M01_AXI] [get_bd_intf_pins axi_gpio_0/S_AXI]
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_periph_M02_AXI [get_bd_intf_pins microblaze_riscv_0_axi_periph/M02_AXI] [get_bd_intf_pins axi_uartlite_0/S_AXI]
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_periph_M03_AXI [get_bd_intf_pins microblaze_riscv_0_axi_periph/M03_AXI] [get_bd_intf_pins axi_timer_0/S_AXI]
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_periph_M04_AXI [get_bd_intf_pins microblaze_riscv_0_axi_periph/M04_AXI] [get_bd_intf_pins microsd/AXI_LITE]
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_periph_M05_AXI [get_bd_intf_pins axi_gpu/S_AXI] [get_bd_intf_pins microblaze_riscv_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_periph_M06_AXI [get_bd_intf_pins microblaze_riscv_0_axi_periph/M06_AXI] [get_bd_intf_pins axi_gpio_1/S_AXI]
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_periph_M07_AXI [get_bd_intf_pins microblaze_riscv_0_axi_periph/M07_AXI] [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
  connect_bd_intf_net -intf_net microblaze_riscv_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_riscv_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_riscv_0_dlmb_1 [get_bd_intf_pins microblaze_riscv_0/DLMB] [get_bd_intf_pins microblaze_riscv_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_riscv_0_ilmb_1 [get_bd_intf_pins microblaze_riscv_0/ILMB] [get_bd_intf_pins microblaze_riscv_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_riscv_0_intc_axi [get_bd_intf_pins microblaze_riscv_0_axi_periph/M00_AXI] [get_bd_intf_pins microblaze_riscv_0_axi_intc/s_axi]
  connect_bd_intf_net -intf_net microblaze_riscv_0_interrupt [get_bd_intf_pins microblaze_riscv_0_axi_intc/interrupt] [get_bd_intf_pins microblaze_riscv_0/INTERRUPT]
  connect_bd_intf_net -intf_net mig_7series_0_DDR2 [get_bd_intf_ports ddr2_sdram] [get_bd_intf_pins mig_7series_0/DDR2]
  connect_bd_intf_net -intf_net ram_interconnect_M00_AXI [get_bd_intf_pins ram_interconnect/M00_AXI] [get_bd_intf_pins mig_7series_0/S_AXI]

  # Create port connections
  connect_bd_net -net CLK100MHZ_1  [get_bd_ports CLK100MHZ] \
  [get_bd_pins util_ds_buf_0/BUFG_I]
  connect_bd_net -net CPU_RESETN_1  [get_bd_ports CPU_RESETN] \
  [get_bd_pins mig_7series_0/sys_rst] \
  [get_bd_pins clk_wiz_0/resetn] \
  [get_bd_pins rst_clk_wiz_0_200M/ext_reset_in]
  connect_bd_net -net axi_gpio_1_ip2intc_irpt  [get_bd_pins axi_gpio_1/ip2intc_irpt] \
  [get_bd_pins microblaze_riscv_0_xlconcat/In1]
  connect_bd_net -net axi_timer_0_interrupt  [get_bd_pins axi_timer_0/interrupt] \
  [get_bd_pins microblaze_riscv_0_xlconcat/In0]
  connect_bd_net -net clk_wiz_0_clk_out2  [get_bd_pins clk_wiz_0/ddr_clk] \
  [get_bd_pins mig_7series_0/clk_ref_i]
  connect_bd_net -net clk_wiz_0_gpu_clk  [get_bd_pins clk_wiz_0/gpu_clk] \
  [get_bd_pins axi_gpu/gpu_clk]
  connect_bd_net -net clk_wiz_0_locked  [get_bd_pins clk_wiz_0/locked] \
  [get_bd_pins rst_clk_wiz_0_200M/dcm_locked]
  connect_bd_net -net clk_wiz_0_vga_clk  [get_bd_pins clk_wiz_0/vga_clk] \
  [get_bd_pins axi_gpu/vga_clk]
  connect_bd_net -net gpu_wrapper_0_vga_b  [get_bd_pins axi_gpu/VGA_B] \
  [get_bd_ports VGA_B]
  connect_bd_net -net gpu_wrapper_0_vga_g  [get_bd_pins axi_gpu/VGA_G] \
  [get_bd_ports VGA_G]
  connect_bd_net -net gpu_wrapper_0_vga_hs  [get_bd_pins axi_gpu/VGA_HS] \
  [get_bd_ports VGA_HS]
  connect_bd_net -net gpu_wrapper_0_vga_r  [get_bd_pins axi_gpu/VGA_R] \
  [get_bd_ports VGA_R]
  connect_bd_net -net gpu_wrapper_0_vga_vs  [get_bd_pins axi_gpu/VGA_VS] \
  [get_bd_ports VGA_VS]
  connect_bd_net -net mdm_1_debug_sys_rst  [get_bd_pins mdm_1/Debug_SYS_Rst] \
  [get_bd_pins rst_clk_wiz_0_200M/mb_debug_sys_rst]
  connect_bd_net -net micro_sd_0_sd_clk  [get_bd_pins microsd/SD_SCK] \
  [get_bd_ports SD_SCK]
  connect_bd_net -net micro_sd_0_sd_cmd  [get_bd_pins microsd/SD_CMD] \
  [get_bd_ports SD_CMD]
  connect_bd_net -net micro_sd_0_sd_dat3  [get_bd_pins microsd/SD_DAT3] \
  [get_bd_ports SD_DAT3]
  connect_bd_net -net micro_sd_0_sd_vdd  [get_bd_pins microsd/SD_RESET] \
  [get_bd_ports SD_RESET]
  connect_bd_net -net microblaze_riscv_0_Clk  [get_bd_pins clk_wiz_0/cpu_clk] \
  [get_bd_pins microblaze_riscv_0/Clk] \
  [get_bd_pins microblaze_riscv_0_axi_periph/ACLK] \
  [get_bd_pins microblaze_riscv_0_axi_periph/S00_ACLK] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M00_ACLK] \
  [get_bd_pins microblaze_riscv_0_axi_intc/s_axi_aclk] \
  [get_bd_pins microblaze_riscv_0_axi_intc/processor_clk] \
  [get_bd_pins microblaze_riscv_0_local_memory/LMB_Clk] \
  [get_bd_pins rst_clk_wiz_0_200M/slowest_sync_clk] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M01_ACLK] \
  [get_bd_pins axi_uartlite_0/s_axi_aclk] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M02_ACLK] \
  [get_bd_pins ram_interconnect/ACLK] \
  [get_bd_pins ram_interconnect/S00_ACLK] \
  [get_bd_pins axi_timer_0/s_axi_aclk] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M03_ACLK] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M04_ACLK] \
  [get_bd_pins ram_interconnect/S01_ACLK] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M05_ACLK] \
  [get_bd_pins axi_gpio_0/s_axi_aclk] \
  [get_bd_pins axi_gpio_1/s_axi_aclk] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M06_ACLK] \
  [get_bd_pins microsd/s_axi_aclk] \
  [get_bd_pins axi_gpu/s_axi_aclk] \
  [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] \
  [get_bd_pins microblaze_riscv_0_axi_periph/S01_ACLK] \
  [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] \
  [get_bd_pins microblaze_riscv_0_axi_periph/S02_ACLK] \
  [get_bd_pins axi_dma_0/m_axi_sg_aclk] \
  [get_bd_pins microblaze_riscv_0_axi_periph/S03_ACLK] \
  [get_bd_pins axi_dma_0/s_axi_lite_aclk] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M07_ACLK]
  connect_bd_net -net microblaze_riscv_0_intr  [get_bd_pins microblaze_riscv_0_xlconcat/dout] \
  [get_bd_pins microblaze_riscv_0_axi_intc/intr]
  connect_bd_net -net microsd_ip2intc_irpt  [get_bd_pins microsd/ip2intc_irpt] \
  [get_bd_pins microblaze_riscv_0_xlconcat/In2]
  connect_bd_net -net mig_7series_0_mmcm_locked  [get_bd_pins mig_7series_0/mmcm_locked] \
  [get_bd_pins rst_mig_7series_0_81M/dcm_locked]
  connect_bd_net -net mig_7series_0_ui_clk  [get_bd_pins mig_7series_0/ui_clk] \
  [get_bd_pins ram_interconnect/M00_ACLK] \
  [get_bd_pins rst_mig_7series_0_81M/slowest_sync_clk]
  connect_bd_net -net mig_7series_0_ui_clk_sync_rst  [get_bd_pins mig_7series_0/ui_clk_sync_rst] \
  [get_bd_pins rst_mig_7series_0_81M/ext_reset_in]
  connect_bd_net -net rst_clk_wiz_0_200M_bus_struct_reset  [get_bd_pins rst_clk_wiz_0_200M/bus_struct_reset] \
  [get_bd_pins microblaze_riscv_0_local_memory/SYS_Rst]
  connect_bd_net -net rst_clk_wiz_0_200M_mb_reset  [get_bd_pins rst_clk_wiz_0_200M/mb_reset] \
  [get_bd_pins microblaze_riscv_0/Reset] \
  [get_bd_pins microblaze_riscv_0_axi_intc/processor_rst]
  connect_bd_net -net rst_clk_wiz_0_200M_peripheral_aresetn  [get_bd_pins rst_clk_wiz_0_200M/peripheral_aresetn] \
  [get_bd_pins microblaze_riscv_0_axi_periph/ARESETN] \
  [get_bd_pins microblaze_riscv_0_axi_periph/S00_ARESETN] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M00_ARESETN] \
  [get_bd_pins microblaze_riscv_0_axi_intc/s_axi_aresetn] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M01_ARESETN] \
  [get_bd_pins axi_uartlite_0/s_axi_aresetn] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M02_ARESETN] \
  [get_bd_pins ram_interconnect/ARESETN] \
  [get_bd_pins ram_interconnect/S00_ARESETN] \
  [get_bd_pins axi_timer_0/s_axi_aresetn] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M03_ARESETN] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M04_ARESETN] \
  [get_bd_pins ram_interconnect/S01_ARESETN] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M05_ARESETN] \
  [get_bd_pins axi_gpio_0/s_axi_aresetn] \
  [get_bd_pins axi_gpio_1/s_axi_aresetn] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M06_ARESETN] \
  [get_bd_pins microsd/s_axi_aresetn] \
  [get_bd_pins axi_gpu/s_axi_aresetn] \
  [get_bd_pins microblaze_riscv_0_axi_periph/S01_ARESETN] \
  [get_bd_pins microblaze_riscv_0_axi_periph/S02_ARESETN] \
  [get_bd_pins microblaze_riscv_0_axi_periph/S03_ARESETN] \
  [get_bd_pins axi_dma_0/axi_resetn] \
  [get_bd_pins microblaze_riscv_0_axi_periph/M07_ARESETN]
  connect_bd_net -net rst_clk_wiz_0_200M_peripheral_reset  [get_bd_pins rst_clk_wiz_0_200M/peripheral_reset] \
  [get_bd_pins microsd/reset] \
  [get_bd_pins axi_gpu/reset]
  connect_bd_net -net rst_mig_7series_0_81M_peripheral_aresetn  [get_bd_pins rst_mig_7series_0_81M/peripheral_aresetn] \
  [get_bd_pins ram_interconnect/M00_ARESETN] \
  [get_bd_pins mig_7series_0/aresetn]
  connect_bd_net -net sd_dat0_0_1  [get_bd_ports SD_DAT0] \
  [get_bd_pins microsd/SD_DAT0]
  connect_bd_net -net util_ds_buf_0_BUFG_O  [get_bd_pins util_ds_buf_0/BUFG_O] \
  [get_bd_pins mig_7series_0/sys_clk_i] \
  [get_bd_pins clk_wiz_0/clk_in1]

  # Create address segments
  assign_bd_address -offset 0xC0000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Data] [get_bd_addr_segs axi_gpu/axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x41E00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0x40000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x40010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Data] [get_bd_addr_segs axi_gpio_1/S_AXI/Reg] -force
  assign_bd_address -offset 0x44A00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Data] [get_bd_addr_segs microsd/axi_quad_spi_0/AXI_LITE/Reg] -force
  assign_bd_address -offset 0x41C00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Data] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x40600000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x00004000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Data] [get_bd_addr_segs microblaze_riscv_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] -force
  assign_bd_address -offset 0x41200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Data] [get_bd_addr_segs microblaze_riscv_0_axi_intc/S_AXI/Reg] -force
  assign_bd_address -offset 0x80000000 -range 0x08000000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Data] [get_bd_addr_segs mig_7series_0/memmap/memaddr] -force
  assign_bd_address -offset 0x00000000 -range 0x00004000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Instruction] [get_bd_addr_segs microblaze_riscv_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] -force
  assign_bd_address -offset 0x80000000 -range 0x08000000 -target_address_space [get_bd_addr_spaces microblaze_riscv_0/Instruction] [get_bd_addr_segs mig_7series_0/memmap/memaddr] -force
  assign_bd_address -offset 0xC0000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs axi_gpu/axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC0000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs axi_gpu/axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC0000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs axi_gpu/axi_bram_ctrl_0/S_AXI/Mem0] -force

  # Exclude Address Segments
  exclude_bd_addr_seg -offset 0x41E00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg]
  exclude_bd_addr_seg -offset 0x40000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x40010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs axi_gpio_1/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x44A00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs microsd/axi_quad_spi_0/AXI_LITE/Reg]
  exclude_bd_addr_seg -offset 0x41C00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs axi_timer_0/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x40600000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x41200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs microblaze_riscv_0_axi_intc/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x41E00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg]
  exclude_bd_addr_seg -offset 0x40000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x40010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs axi_gpio_1/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x44A00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs microsd/axi_quad_spi_0/AXI_LITE/Reg]
  exclude_bd_addr_seg -offset 0x41C00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs axi_timer_0/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x40600000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x41200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs microblaze_riscv_0_axi_intc/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x41E00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg]
  exclude_bd_addr_seg -offset 0x40000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x40010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs axi_gpio_1/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x44A00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs microsd/axi_quad_spi_0/AXI_LITE/Reg]
  exclude_bd_addr_seg -offset 0x41C00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs axi_timer_0/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x40600000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg]
  exclude_bd_addr_seg -offset 0x41200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs microblaze_riscv_0_axi_intc/S_AXI/Reg]


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


