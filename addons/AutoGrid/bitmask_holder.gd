tool
extends MeshInstance

var bit_value : int = 0
var is_icon : bool = false

enum { All, AxisX, AxisY, AxisZ}
var currentAxis = All

func calculate_bit_value() -> int:
	var i = 0
	for child in get_children():
		if child.visible && child.enabled:
			bit_value |= 1 << i
		i += 1
	
	return bit_value

func set_axis(axis : int, forceActive : bool = false):
	if axis == 0:
		if currentAxis != All:
			set_child_from_bit(9223372036854775807, forceActive)
		currentAxis = All
	elif axis == 1:
		if currentAxis != AxisX:
			set_child_from_bit(35791633, forceActive)
		currentAxis = AxisX
	elif axis == 2:
		if currentAxis != AxisY:
			set_child_from_bit(130560, forceActive)
		currentAxis = AxisY
	elif axis == 3:
		if currentAxis != AxisZ:
			set_child_from_bit(42502468, forceActive)
		currentAxis = AxisZ
	else:
		print("Invalid axis.")

func set_child_from_bit(mask : int, forceActive : bool = false):
	for child in get_children():
		if mask & 1 == 1:
			if child.is_active() || forceActive:
				child.activate()
			child.visible = true
		else:
			child.deactivate()
			child.visible = false
		mask = mask >> 1

func set_for_icon():
	is_icon = true
	get_surface_material(0).albedo_color.a = 0.7

func disable_icon():
	is_icon = false
	get_surface_material(0).albedo_color.a = 0.0

func activate():
	for child in get_children():
		if child.visible:
			child.activate()

func deactivate():
	for child in get_children():
		if child.visible:
			child.deactivate()

func set_size(size : float):
	var new_size = Vector3.ONE * size
	mesh.radius = size
	mesh.height = size * 2
	for child in get_children():
		var dir = child.translation
		child.translation = dir.normalized().round() * size * 2
		child.scale = new_size
