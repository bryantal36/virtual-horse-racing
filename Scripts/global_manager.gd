extends Node

var current_lap: int = 0

func add_lap():
	current_lap += 1
	print("Current Lap: ", current_lap)
	
#func _process(delta: float) -> void:
#	print("Howdy")
