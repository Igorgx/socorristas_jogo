extends Node2D

var area_cpr = preload("res://area_cpr.tscn")
var areas = []
var dentro = 0
var acertos = 0
var total = 0
var cd = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start(0.6)
	$pista/area_coracao/AnimatedSprite2D.play("pulsando")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("espaco") and dentro==1 and cd==1:
		cd = 0
		acertos+=1
		$Label.text = str(acertos)
		total+=1
		$pista/area_coracao/cdheart.start(0.4)
	if acertos >= 50:
		$Timer.paused = true
		$MensagemFinal.visible = true
	


func _on_timer_timeout() -> void:
	areas.append(area_cpr.instantiate())
	$pista.add_child(areas[-1])
	$Timer.start(0.6)


func _on_area_coracao_area_entered(area: Area2D) -> void:
	dentro = 1

func _on_area_coracao_area_exited(area: Area2D) -> void:
	dentro = 0
	area.queue_free()


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://level_select.tscn")


func _on_cdheart_timeout() -> void:
	cd = 1 # Replace with function body.
