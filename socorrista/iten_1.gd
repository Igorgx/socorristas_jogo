# item.gd
extends TextureButton

@export var item_name: String = ""

func _pressed():
	print("Item clicado:", item_name)
	get_tree().call_group("level_controller", "on_item_selected", item_name)
