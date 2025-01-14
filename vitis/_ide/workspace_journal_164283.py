# 2025-01-13T00:28:18.767640
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.get_component(name="platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../xsa/200mhz_microblaze_v.xsa")

status = platform.build()

comp = client.get_component(name="doom")
comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../xsa/design_1_wrapper.xsa")

status = platform.build()

comp.build()

vitis.dispose()

