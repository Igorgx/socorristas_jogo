extends Control

var selected_item: String = ""

func _ready():
	add_to_group("level_controller")

func on_item_selected(item_name: String):
	selected_item = item_name
	print("Selecionou o item:", selected_item)
