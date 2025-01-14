# 2025-01-10T19:57:26.975389
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="doom")
comp.build()

status = platform.build()

vitis.dispose()

