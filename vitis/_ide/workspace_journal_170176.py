# 2025-01-09T18:08:42.412154
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="doom")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../hardware/design_1_wrapper.xsa")

client.delete_component(name="platform")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../hardware/design_1_wrapper.xsa",os = "standalone",cpu = "microblaze_riscv_0",domain_name = "standalone_microblaze_riscv_0")

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

domain = platform.get_domain(name="standalone_microblaze_riscv_0")

status = domain.set_config(option = "proc", param = "proc_extra_compiler_flags", value = " -g -ffunction-sections -fdata-sections -Wall -Wextra -fno-tree-loop-distribute-patterns -pg")

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../hardware/design_1_wrapper.xsa")

vitis.dispose()

