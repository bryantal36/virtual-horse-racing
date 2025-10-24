extends Node

var current_lap: int = 0
var top_three: Array = []

func generate_placements(horse_name: String):
	if horse_name in top_three:
		pass

#func add_lap():
	#current_lap += 1
	#print("Current Lap: ", current_lap)

func end_race():
	print("The Race is OVER!")
