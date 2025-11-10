extends Node2D

var area_cpr = preload("res://area_cpr.tscn")
var areas = []
var dentro = 0
var acertos = 0
var total = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start(0.6)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("espaco") and dentro==1:
		acertos+=1
		$Label.text = str(acertos)
		total+=1
	elif Input.is_action_pressed("espaco") and dentro == 0:
		pass


func _on_timer_timeout() -> void:
	areas.append(area_cpr.instantiate())
	$pista.add_child(areas[-1])
	$Timer.start(0.6)


func _on_area_coracao_area_entered(area: Area2D) -> void:
	dentro = 1

func _on_area_coracao_area_exited(area: Area2D) -> void:
	dentro = 0
	area.queue_free()
