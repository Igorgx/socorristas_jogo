extends Node2D

@export var item_correto: String = ""
@export var estado: int = 0

var selected_item: String = ""
var estado_anterior: int = -1
var erro_timer := 0.0
var erro_visivel := false


func _process(delta):
	if estado != estado_anterior:
		estado_anterior = estado

		match estado:
			
			1:
				$BraçoMachucado/Sprite2D.texture = load("res://sprites socorristas/Braco corte sem sangue.png")
				$Intro.text = "Otimo, agora vamos passar a\npomada no ferimento..."
			2:
				$BraçoMachucado/Sprite2D.texture = load("res://sprites socorristas/Braco com pomada.png")
				$Intro.text = "Excelente! Agora vamos enfaixar o\nbraço para concluir..."
			3:
				$BraçoMachucado/Sprite2D.texture = load("res://sprites socorristas/braço estendido bandagens.png")
				$Intro.text = "Ótimo trabalho, paciente liberado!"

	# Se a mensagem de erro estiver visível, conta o tempo e some depois de 2 segundos
	if erro_visivel:
		erro_timer -= delta
		if erro_timer <= 0:
			erro_visivel = false
			$MsgErro.visible = false


func ver_se_certo(item: String):
	var item_certo_por_estado = {
		0: "Alcool",
		1: "Pomada",
		2: "Bandagem"
	}

	if item_certo_por_estado.has(estado):
		if item == item_certo_por_estado[estado]:
			estado += 1
			$MsgErro.visible = false
			erro_visivel = false
		else:
			mostrar_erro("  Item incorreto!\nTente novamente.")


func mostrar_erro(msg: String):
	var label = $MsgErro
	label.text = msg
	label.visible = true
	erro_timer = 2.0
	erro_visivel = true


func _on_item_1_pressed() -> void:
	selected_item = "Alcool"
	ver_se_certo(selected_item)

func _on_item_2_pressed() -> void:
	selected_item = "Bandagem"
	ver_se_certo(selected_item)

func _on_item_3_pressed() -> void:
	selected_item = "Pomada"
	ver_se_certo(selected_item)

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_select.tscn")
