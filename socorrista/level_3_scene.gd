extends Node2D

# Pegando os nós da cena
@onready var bracoQueimadura = $BracoQueimadura
@onready var bracoLimpo = $BracoEstendido
@onready var bracoAtadura = $BracoAtadura
@onready var mensagem = $MensagemLabel
@onready var errado: AudioStreamPlayer = $Errado
@onready var sucesso: AudioStreamPlayer = $Sucesso

# Carrega as imagens (ajuste os nomes conforme seus arquivos)
var braco_queimado = preload("res://sprites socorristas/braço queimadura.png")
var braco_atadura = preload("res://sprites socorristas/braço estendido bandagens.png")
var braco_limpo = preload("res://sprites socorristas/braço estendido.png")

var estado = "queimado"

func _ready():
	mensagem.text = ""  # Começa sem mensagem

func _on_button_agua_pressed() -> void:
	bracoQueimadura.texture = braco_limpo
	estado = "limpo"
	mensagem.text = "Boa! Você limpou o ferimento."
	sucesso.play()

func _on_button_alcool_pressed() -> void:
	mensagem.text = "Item errado! Álcool não deve ser usado em queimaduras."
	errado.play()

func _on_button_atadura_pressed() -> void:
	if estado == "limpo":
		bracoQueimadura.texture = braco_atadura
		mensagem.text = "Perfeito! O ferimento foi protegido com a atadura."
		estado = "tratado"
		sucesso.play()
	else:
		mensagem.text = "Item errado! Primeiro lave o ferimento com água."
		errado.play()

func _on_button_pomada_pressed() -> void:
	mensagem.text = "Item errado! O ferimento ainda não foi limpo."
	errado.play()
