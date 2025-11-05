extends TextureButton

@export var item_name: String = ""

func _pressed():
	get_tree().call_group( "on_item_selected", item_name)
