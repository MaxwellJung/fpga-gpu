# 2025-01-13T14:59:13.360118
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

client.delete_component(name="platform")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../xsa/200mhz_microblaze_v.xsa",os = "standalone",cpu = "microblaze_riscv_0",domain_name = "standalone_microblaze_riscv_0")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="doom")
comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../xsa/100mhz_microblaze_v.xsa")

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

