extends TextureButton

@onready var circulos_parent := get_node("../../CirculosDeAtadura")
@onready var nextLevel = $"../../NextLevel"
@onready var start_position := global_position
@onready var start_scale := scale
@onready var mensagem_final: RichTextLabel = $"../../MensagemFinal"

var circuloXQtd = 3
var dragging := false
var level3
var drag_offset := Vector2.ZERO
var circuloV = preload("res://sprites socorristas/Circulo verde.png")

func _on_ready():
	level3 = get_tree().get_root().get_node("Level3")
	circulos_parent.visible = false
	mouse_filter = Control.MOUSE_FILTER_PASS

func get_overlapping_circle():
	var overlapped_areas = $"Area2D".get_overlapping_areas()
	
	for area in overlapped_areas:
		if area.is_in_group("circulo_atadura"):
			return area
	return null

func aplicar_verde_no_circulo(circulo):
	var sprite := circulo.get_parent() as Sprite2D
	sprite.texture = circuloV
	sprite.z_index = 999
	sprite.z_as_relative = false
	
	var colisao = circulo.get_node("CollisionShape2D")
	colisao.disabled = true
	
	circuloXQtd -= 1
	level3.mensagem.text = "Continue usando a atadura!\nainda falta: "+str(circuloXQtd)+" ponto(s)"
	if circuloXQtd == 2:
		level3.bracoQueimadura.texture = level3.braco_pouco_enfaixado
	if circuloXQtd == 1:
		level3.bracoQueimadura.texture = level3.braco_metade_enfaixado
	
	if  circuloXQtd == 0:
		level3.bracoQueimadura.texture = level3.braco_enfaixado
		level3.mensagem.text = "PACIENTE TRATADO!"
		level3.estado = "tratado"
		nextLevel.visible = true
		mensagem_final.visible = true

func _on_button_down():
	if level3.estado != "limpo":
		level3.mensagem.text = "Item errado! Primeiro lave o ferimento com\nágua."
		level3.errado.play()
	else:
		dragging = true
		circulos_parent.visible = true
		self.scale = Vector2(0.2, 0.2)
		drag_offset = get_global_mouse_position() - global_position

func _on_button_up():
	circulos_parent.visible = false
	dragging = false
	
	var alvo = get_overlapping_circle()
	if alvo == null:
		scale = start_scale
		global_position = start_position
		level3.errado.play()
	else:
		aplicar_verde_no_circulo(alvo)
		scale = start_scale
		global_position = start_position
		level3.sucesso.play()

func _on_gui_input(event):
	if dragging and event is InputEventMouseMotion:
		global_position = get_global_mouse_position() - drag_offset
