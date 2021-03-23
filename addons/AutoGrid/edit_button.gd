tool
extends Control

var popup : PopupMenu
var core

var auto_bitmask : PackedScene

var bitmask_size : float

func _enter_tree():
	#Assign controls
	popup = $MenuButton.get_popup()
	
	#Set popup
	popup.set_item_accelerator(0, KEY_T | KEY_MASK_SHIFT)
	popup.set_item_accelerator(1, KEY_Q | KEY_MASK_SHIFT)
	popup.set_item_accelerator(2, KEY_1 | KEY_MASK_SHIFT)
	popup.set_item_accelerator(3, KEY_2 | KEY_MASK_SHIFT)
	if !popup.is_connected("id_pressed", self, "popup_pressed"):
		popup.connect("id_pressed", self, "popup_pressed")
	
	auto_bitmask = preload("res://addons/AutoGrid/AutoGrid_Bitmask.tscn")

func popup_pressed(id):
	if id == 0:
		create_bitmask()
	if id == 1:
		remove_bitmask()
	if id == 2:
		increase_size()
	if id == 3:
		decrease_size()
	if id > 4 && id < 9:
		core.editAxis = id - 5
	if id == 10:
		set_icon()

func create_bitmask():
	var selected = core.get_selection()
	if selected == null:
		print("Please select MeshInstance.")
		return
	if selected.has_node("AutoGrid_Bitmask"):
		print("Selected node already has a bitmask.")
	else:
		var bitmask = auto_bitmask.instance()
		selected.add_child(bitmask)
		core.set_bitmask(bitmask)
		bitmask.global_transform.basis = Basis()

func remove_bitmask():
	var selected = core.get_selection()
	if selected == null:
		print("Please select MeshInstance.")
		return
	if selected.has_node("AutoGrid_Bitmask"):
		var bitmask = selected.get_node("AutoGrid_Bitmask")
		selected.remove_child(bitmask)
		bitmask.queue_free()

func increase_size():
	core.increase_bitmasks_size()

func decrease_size():
	core.decrease_bitmasks_size()

func set_icon():
	var selected = core.get_selection()
	if selected == null:
		print("Please select MeshInstance.")
		return
	if selected.has_node("AutoGrid_Bitmask"):
		core.change_icon(selected)
