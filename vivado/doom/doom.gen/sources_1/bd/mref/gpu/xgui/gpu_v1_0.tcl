# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BRAM_ADDR_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BRAM_DATA_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DOWNSCALE_FACTOR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_BACK_PORCH_PXL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_FRONT_PORCH_PXL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_NUM_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_SYNC_PULSE_PXL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_VIS_AREA_PXL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_BACK_PORCH_PXL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_FRONT_PORCH_PXL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_NUM_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_SYNC_PULSE_PXL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_VIS_AREA_PXL" -parent ${Page_0}


}

proc update_PARAM_VALUE.BRAM_ADDR_BITS { PARAM_VALUE.BRAM_ADDR_BITS } {
	# Procedure called to update BRAM_ADDR_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BRAM_ADDR_BITS { PARAM_VALUE.BRAM_ADDR_BITS } {
	# Procedure called to validate BRAM_ADDR_BITS
	return true
}

proc update_PARAM_VALUE.BRAM_DATA_BITS { PARAM_VALUE.BRAM_DATA_BITS } {
	# Procedure called to update BRAM_DATA_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BRAM_DATA_BITS { PARAM_VALUE.BRAM_DATA_BITS } {
	# Procedure called to validate BRAM_DATA_BITS
	return true
}

proc update_PARAM_VALUE.DOWNSCALE_FACTOR { PARAM_VALUE.DOWNSCALE_FACTOR } {
	# Procedure called to update DOWNSCALE_FACTOR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DOWNSCALE_FACTOR { PARAM_VALUE.DOWNSCALE_FACTOR } {
	# Procedure called to validate DOWNSCALE_FACTOR
	return true
}

proc update_PARAM_VALUE.H_BACK_PORCH_PXL { PARAM_VALUE.H_BACK_PORCH_PXL } {
	# Procedure called to update H_BACK_PORCH_PXL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_BACK_PORCH_PXL { PARAM_VALUE.H_BACK_PORCH_PXL } {
	# Procedure called to validate H_BACK_PORCH_PXL
	return true
}

proc update_PARAM_VALUE.H_FRONT_PORCH_PXL { PARAM_VALUE.H_FRONT_PORCH_PXL } {
	# Procedure called to update H_FRONT_PORCH_PXL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_FRONT_PORCH_PXL { PARAM_VALUE.H_FRONT_PORCH_PXL } {
	# Procedure called to validate H_FRONT_PORCH_PXL
	return true
}

proc update_PARAM_VALUE.H_NUM_BITS { PARAM_VALUE.H_NUM_BITS } {
	# Procedure called to update H_NUM_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_NUM_BITS { PARAM_VALUE.H_NUM_BITS } {
	# Procedure called to validate H_NUM_BITS
	return true
}

proc update_PARAM_VALUE.H_SYNC_PULSE_PXL { PARAM_VALUE.H_SYNC_PULSE_PXL } {
	# Procedure called to update H_SYNC_PULSE_PXL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_SYNC_PULSE_PXL { PARAM_VALUE.H_SYNC_PULSE_PXL } {
	# Procedure called to validate H_SYNC_PULSE_PXL
	return true
}

proc update_PARAM_VALUE.H_VIS_AREA_PXL { PARAM_VALUE.H_VIS_AREA_PXL } {
	# Procedure called to update H_VIS_AREA_PXL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_VIS_AREA_PXL { PARAM_VALUE.H_VIS_AREA_PXL } {
	# Procedure called to validate H_VIS_AREA_PXL
	return true
}

proc update_PARAM_VALUE.V_BACK_PORCH_PXL { PARAM_VALUE.V_BACK_PORCH_PXL } {
	# Procedure called to update V_BACK_PORCH_PXL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_BACK_PORCH_PXL { PARAM_VALUE.V_BACK_PORCH_PXL } {
	# Procedure called to validate V_BACK_PORCH_PXL
	return true
}

proc update_PARAM_VALUE.V_FRONT_PORCH_PXL { PARAM_VALUE.V_FRONT_PORCH_PXL } {
	# Procedure called to update V_FRONT_PORCH_PXL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_FRONT_PORCH_PXL { PARAM_VALUE.V_FRONT_PORCH_PXL } {
	# Procedure called to validate V_FRONT_PORCH_PXL
	return true
}

proc update_PARAM_VALUE.V_NUM_BITS { PARAM_VALUE.V_NUM_BITS } {
	# Procedure called to update V_NUM_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_NUM_BITS { PARAM_VALUE.V_NUM_BITS } {
	# Procedure called to validate V_NUM_BITS
	return true
}

proc update_PARAM_VALUE.V_SYNC_PULSE_PXL { PARAM_VALUE.V_SYNC_PULSE_PXL } {
	# Procedure called to update V_SYNC_PULSE_PXL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_SYNC_PULSE_PXL { PARAM_VALUE.V_SYNC_PULSE_PXL } {
	# Procedure called to validate V_SYNC_PULSE_PXL
	return true
}

proc update_PARAM_VALUE.V_VIS_AREA_PXL { PARAM_VALUE.V_VIS_AREA_PXL } {
	# Procedure called to update V_VIS_AREA_PXL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_VIS_AREA_PXL { PARAM_VALUE.V_VIS_AREA_PXL } {
	# Procedure called to validate V_VIS_AREA_PXL
	return true
}


proc update_MODELPARAM_VALUE.H_VIS_AREA_PXL { MODELPARAM_VALUE.H_VIS_AREA_PXL PARAM_VALUE.H_VIS_AREA_PXL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_VIS_AREA_PXL}] ${MODELPARAM_VALUE.H_VIS_AREA_PXL}
}

proc update_MODELPARAM_VALUE.H_FRONT_PORCH_PXL { MODELPARAM_VALUE.H_FRONT_PORCH_PXL PARAM_VALUE.H_FRONT_PORCH_PXL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_FRONT_PORCH_PXL}] ${MODELPARAM_VALUE.H_FRONT_PORCH_PXL}
}

proc update_MODELPARAM_VALUE.H_SYNC_PULSE_PXL { MODELPARAM_VALUE.H_SYNC_PULSE_PXL PARAM_VALUE.H_SYNC_PULSE_PXL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_SYNC_PULSE_PXL}] ${MODELPARAM_VALUE.H_SYNC_PULSE_PXL}
}

proc update_MODELPARAM_VALUE.H_BACK_PORCH_PXL { MODELPARAM_VALUE.H_BACK_PORCH_PXL PARAM_VALUE.H_BACK_PORCH_PXL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_BACK_PORCH_PXL}] ${MODELPARAM_VALUE.H_BACK_PORCH_PXL}
}

proc update_MODELPARAM_VALUE.H_NUM_BITS { MODELPARAM_VALUE.H_NUM_BITS PARAM_VALUE.H_NUM_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_NUM_BITS}] ${MODELPARAM_VALUE.H_NUM_BITS}
}

proc update_MODELPARAM_VALUE.V_VIS_AREA_PXL { MODELPARAM_VALUE.V_VIS_AREA_PXL PARAM_VALUE.V_VIS_AREA_PXL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_VIS_AREA_PXL}] ${MODELPARAM_VALUE.V_VIS_AREA_PXL}
}

proc update_MODELPARAM_VALUE.V_FRONT_PORCH_PXL { MODELPARAM_VALUE.V_FRONT_PORCH_PXL PARAM_VALUE.V_FRONT_PORCH_PXL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_FRONT_PORCH_PXL}] ${MODELPARAM_VALUE.V_FRONT_PORCH_PXL}
}

proc update_MODELPARAM_VALUE.V_SYNC_PULSE_PXL { MODELPARAM_VALUE.V_SYNC_PULSE_PXL PARAM_VALUE.V_SYNC_PULSE_PXL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_SYNC_PULSE_PXL}] ${MODELPARAM_VALUE.V_SYNC_PULSE_PXL}
}

proc update_MODELPARAM_VALUE.V_BACK_PORCH_PXL { MODELPARAM_VALUE.V_BACK_PORCH_PXL PARAM_VALUE.V_BACK_PORCH_PXL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_BACK_PORCH_PXL}] ${MODELPARAM_VALUE.V_BACK_PORCH_PXL}
}

proc update_MODELPARAM_VALUE.V_NUM_BITS { MODELPARAM_VALUE.V_NUM_BITS PARAM_VALUE.V_NUM_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_NUM_BITS}] ${MODELPARAM_VALUE.V_NUM_BITS}
}

proc update_MODELPARAM_VALUE.DOWNSCALE_FACTOR { MODELPARAM_VALUE.DOWNSCALE_FACTOR PARAM_VALUE.DOWNSCALE_FACTOR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DOWNSCALE_FACTOR}] ${MODELPARAM_VALUE.DOWNSCALE_FACTOR}
}

proc update_MODELPARAM_VALUE.BRAM_ADDR_BITS { MODELPARAM_VALUE.BRAM_ADDR_BITS PARAM_VALUE.BRAM_ADDR_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BRAM_ADDR_BITS}] ${MODELPARAM_VALUE.BRAM_ADDR_BITS}
}

proc update_MODELPARAM_VALUE.BRAM_DATA_BITS { MODELPARAM_VALUE.BRAM_DATA_BITS PARAM_VALUE.BRAM_DATA_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BRAM_DATA_BITS}] ${MODELPARAM_VALUE.BRAM_DATA_BITS}
}

