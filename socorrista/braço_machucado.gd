extends Area2D

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var level = get_tree().get_first_node_in_group("level_controller")
		if level:
			match level.selected_item:
				"Álcool":
					print("Aplicou álcool!")
				"Curativo":
					print("Colocou curativo!")
				_:
					print("Nada aconteceu.")
