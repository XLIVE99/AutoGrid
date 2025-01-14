@tool
extends StaticBody3D

var enabled : bool: set = enabled_changed

func toggle_box():
	self.enabled = !enabled

func enabled_changed(val):
	enabled = val
	if enabled:
		$MeshInstance3D.get_surface_override_material(0).albedo_color = Color.RED
	else:
		$MeshInstance3D.get_surface_override_material(0).albedo_color = Color.WHITE

func activate():
	collision_layer = 524288
	$MeshInstance3D.get_surface_override_material(0).albedo_color.a = 1.0

func deactivate():
	collision_layer = 0
	$MeshInstance3D.get_surface_override_material(0).albedo_color.a = 0.15

func is_active() -> bool:
	return collision_layer == 524288
