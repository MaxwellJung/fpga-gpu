set projectName gpu
set projectRoot ./build/vivado/$projectName

set bdName design_1
set bdDir ./src/block_design

open_project $projectRoot/${projectName}.xpr

open_bd_design $projectRoot/${projectName}.srcs/sources_1/bd/$bdName/${bdName}.bd
write_bd_tcl -bd_name $bdName -force $bdDir/${bdName}.tcl
# close_bd_design [get_bd_designs $bdName]
puts "Exported block design recipe to tcl file!"
