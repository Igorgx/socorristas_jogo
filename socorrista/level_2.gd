extends Node2D

# Pegando os nós da cena
@onready var bracoQuebrado = $BracoQuebrado
@onready var bracoTala = $BracoTala
@onready var mensagem = $Mensagem
@onready var errado: AudioStreamPlayer = $Errado
@onready var sucesso: AudioStreamPlayer = $Sucesso
@onready var next_level: TextureButton = $NextLevel

# Carrega as imagens (ajuste os nomes conforme seus arquivos)
var braco_queimado = preload("res://sprites socorristas/braço queimadura.png")
var braco_pouco_enfaixado = preload("res://sprites socorristas/bandagem_pouco.png")
var braco_metade_enfaixado = preload("res://sprites socorristas/bandagem2.png")
var braco_enfaixado = preload("res://sprites socorristas/bandagem_final.png")
var braco_tala = preload("res://sprites socorristas/braço_tala.png")
var estado = "quebrado"

func _on_button_pomada_pressed() -> void:
	if estado == "tratado":
		bracoQuebrado.texture = braco_tala
		estado = "fixado"
		mensagem.text = "Bom trabalho! Você fixou o braço e agora 
		o paciente está liberado."
		sucesso.play()
		next_level.visible = true;
	else:
		mensagem.text = "Coloque a bandagem antes!"
		errado.play()

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://level_select.tscn")

func _on_next_level_pressed() -> void:
	get_tree().change_scene_to_file("res://level_3.tscn")
