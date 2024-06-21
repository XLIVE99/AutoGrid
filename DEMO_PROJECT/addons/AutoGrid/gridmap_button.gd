@tool
extends Control

var popup : PopupMenu

var core

func _on_OptionButton_item_selected(index):
	core.bitmaskMode = index

func _on_Github_Rich_meta_clicked(meta):
	OS.shell_open(meta)

func _on_Autotile_Check_toggled(button_pressed):
	core.autotileEnabled = button_pressed

func _on_Edit_Mode_Checked_toggled(button_pressed):
	core.editMode = button_pressed
	$VBoxContainer/Buttons.visible = button_pressed

func _on_Create_Autotile_pressed():
	core.create_autotile_pressed()

func _on_Reload_Autotile_pressed():
	core.reload_autotile_info()

func _on_CheckBox_toggled(button_pressed):
	core.performanceMode = button_pressed

func _on_Auto_Axis_Opt_item_selected(index):
	core.autoAxis = index

func _on_Auto_Scan_Axis_Opt_item_selected(index):
	core.scanAxis = index
