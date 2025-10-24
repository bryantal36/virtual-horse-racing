extends Node

var current_lap: int = 0
var finish_order: Array = []

signal race_positions_updated

func generate_placements(horse_name: String):
	if horse_name in finish_order:
		return
	finish_order.append(horse_name)
	print(horse_name, " has crossed the finish line")
	
	emit_signal("race_positions_updated", finish_order)

func end_race():
	print("The Race is OVER!")
