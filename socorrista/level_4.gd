extends Node2D

var qtde
var displayx = DisplayServer.window_get_size().x
var displayy = DisplayServer.window_get_size().y


func _ready():
	qtde = 1
	
func play_final():
	$Base.visible = false
	$engasgo/Sprite2D.texture = load("res://sprites socorristas/heimlich_fim.png")
	$NivelFinalizado.position.x = displayx/2
	$NivelFinalizado.position.y = displayy/2
	
func play_and_restart():
	
	$Base/Fill.size.x = 0
	$engasgo/Sprite2D.texture = load("res://sprites socorristas/heimlich_meio.png")
	qtde+=1
	$Timer.start(0.3)
	$Timer.paused = false
	
func _process(delta):
	
	
	if $Base.visible:
		$Base/Fill.size.x -=delta*10
		if $Base/Fill.size.x > $Base.size.x and qtde <3:
			play_and_restart()
			print("loop")
		elif $Base/Fill.size.x >= $Base.size.x:
			play_final()
			print("final")
	if Input.is_action_just_pressed("espaco"):
		$Base/Fill.size.x +=15
	
	
	


func _on_timer_timeout() -> void:
	$Timer.paused = true
	$engasgo/Sprite2D.texture = load("res://sprites socorristas/heimlich_comeco.png") # Replace with function body.
