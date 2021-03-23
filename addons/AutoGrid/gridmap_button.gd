tool
extends Control

var popup : PopupMenu

var core

func _on_OptionButton_item_selected(index):
	core.bitmaskMode = index

func _on_Github_Rich_meta_clicked(meta):
	OS.shell_open(meta)
