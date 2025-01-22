# 2025-01-21T21:49:26.644628
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="doom")
comp.build()

domain = platform.get_domain(name="standalone_microblaze_riscv_0")

status = domain.set_config(option = "proc", param = "proc_extra_compiler_flags", value = " -g -ffunction-sections -fdata-sections -Wall -Wextra -fno-tree-loop-distribute-patterns -pg")

status = domain.set_config(option = "proc", param = "proc_extra_compiler_flags", value = "-g -ffunction-sections -fdata-sections -Wall -Wextra -fno-tree-loop-distribute-patterns")

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp = client.get_component(name="test")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp = client.get_component(name="doom")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../xsa/oc_design_1_wrapper.xsa")

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../xsa/design_1_wrapper.xsa")

status = platform.build()

comp.build()

status = platform.build()

comp.build()

