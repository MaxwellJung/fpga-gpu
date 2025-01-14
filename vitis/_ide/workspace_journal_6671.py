# 2025-01-13T01:10:24.403845
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="test")
comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../xsa/design_1_wrapper.xsa")

status = platform.build()

comp = client.get_component(name="doom")
comp.build()

client.delete_component(name="platform")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../xsa/design_1_wrapper.xsa",os = "standalone",cpu = "microblaze_riscv_0",domain_name = "standalone_microblaze_riscv_0")

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

vitis.dispose()

