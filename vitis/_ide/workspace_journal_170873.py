# 2025-01-13T01:01:56.566552
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

comp = client.get_component(name="doom")
status = comp.clean()

platform = client.get_component(name="platform")
status = platform.build()

comp.build()

vitis.dispose()

