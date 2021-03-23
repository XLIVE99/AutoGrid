tool
extends StaticBody

var enabled : bool setget enabled_changed

func toggle_box():
	self.enabled = !enabled

func enabled_changed(val):
	enabled = val
	if enabled:
		$MeshInstance.get_surface_material(0).albedo_color = Color.red
	else:
		$MeshInstance.get_surface_material(0).albedo_color = Color.white

func activate():
	collision_layer = 524288
	$MeshInstance.get_surface_material(0).albedo_color.a = 1.0

func deactivate():
	collision_layer = 0
	$MeshInstance.get_surface_material(0).albedo_color.a = 0.15

func is_active() -> bool:
	return collision_layer == 524288
