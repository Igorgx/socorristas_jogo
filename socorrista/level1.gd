extends Node2D

@export var item_correto: String = "Álcool"
@export var estado: int = 0

var selected_item: String = ""
var estado_anterior: int = -1

func _ready():
	add_to_group("level_controller")

func _process(delta):
	if estado != estado_anterior:
		estado_anterior = estado
		
		if estado == 1:
			$BraçoMachucado/Sprite2D.texture = load("res://sprites socorristas/braço quebrado x ray.png")
			$Intro1.text = "algo"
			
		elif estado == 2:
			$BraçoMachucado/Sprite2D.texture = load("res://sprites socorristas/braço quebrado x ray.png")
			$Intro1.text = "algo2"
			
		elif estado == 3:
			$BraçoMachucado/Sprite2D.texture = load("res://sprites socorristas/braço estendido bandagens.png")
			$Intro1.text = "algo3"
			

func ver_se_certo(item :String):
	var certo = ""
	if estado == 0:
		certo = "a"
	elif estado == 1:
		certo = "p"
	elif estado == 2:
		certo = "b"
		
	if item == certo:
		estado+=1
	
	
func _on_item_1_pressed() -> void:
	selected_item = "Alcool"
	ver_se_certo("a")


func _on_item_2_pressed() -> void:
	selected_item = "Bandagem"
	ver_se_certo("b")


func _on_item_3_pressed() -> void:
	selected_item = "Pomada"
	ver_se_certo("p")
