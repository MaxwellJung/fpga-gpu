# 2025-01-12T23:38:58.772358
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="doom")
comp.build()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../xsa/design_1_wrapper.xsa")

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../xsa/design_1_wrapper.xsa")

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

