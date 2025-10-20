extends Area2D

#@onready var global_manager = get_node("/root/GlobalManager")

func _on_body_entered(body):
	if body.name == "HorseBody":
		GlobalManager.end_race()
