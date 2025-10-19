extends Node

var current_lap: int = 0

func add_lap(lap: int):
	lap += lap
	print("Current Lap: ", current_lap)
	
func _process(delta: float) -> void:
	print("Howdy")
