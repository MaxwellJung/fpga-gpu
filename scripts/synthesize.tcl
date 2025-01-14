set projectName doom
set projectRoot ./vivado/$projectName

set bdName design_1

open_project $projectRoot/${projectName}.xpr
reset_run synth_1
launch_runs synth_1 -jobs 12 -verbose
wait_on_run synth_1
puts "Synthesis done!"