set projectName gpu
set projectRoot ./build/vivado/$projectName

set bdName design_1

open_project $projectRoot/${projectName}.xpr
reset_run synth_1
launch_runs synth_1 -jobs 4
wait_on_run synth_1
puts "Synthesis done!"