extends Node2D
@onready var ambulancia: AudioStreamPlayer = $ambulancia
var area_cpr = preload("res://area_cpr.tscn")
var areas = []
var dentro = 0
var acertos = 0
var total = 0
var cd = 1
var area_dentro = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start(0.6)
	$pista/area_coracao/AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("espaco") and dentro==1 :
		var area = area_dentro.pop_front()
		area.queue_free()
		acertos+=1
		$Label.text = str(acertos)
		total+=1
	if acertos == 10:
		$Label2.text = "Você está indo bem"
	elif acertos == 20:
		$Label2.text = "Já já a ambulância chega"
	elif acertos == 30:
		$Label2.text = "Só mais um pouco"
	elif acertos == 40:
		$Label2.text = "Já consigo ouvir a sirene"
		$ambulancia.play()
		
	if acertos >= 50:
		$Label2.text = "Ufa. Se não fosse por você\nNão sei o que teria acontecido"
		$Timer.paused = true
		$MensagemFinal.visible = true
	


func _on_timer_timeout() -> void:
	areas.append(area_cpr.instantiate())
	$pista.add_child(areas[-1])
	$Timer.start(0.6)


func _on_area_coracao_area_entered(area: Area2D) -> void:
	dentro = 1
	area_dentro.append(area)

func _on_area_coracao_area_exited(area: Area2D) -> void:
	dentro = 0
	area_dentro.pop_front()
	area.queue_free()


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://level_select.tscn")
