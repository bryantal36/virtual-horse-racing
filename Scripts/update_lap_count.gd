extends Area2D

@export var lap: int = 1
#@onready var global_manager = get_node("/root/GlobalManager")

func _on_body_entered(body):
	if body.name == "HorseBody":
		GlobalManager.add_lap(lap)
