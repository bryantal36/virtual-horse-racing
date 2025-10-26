extends Node

var current_lap: int = 0
var finish_order: Array = []

signal race_positions_updated

func generate_placements(horse_name: String, horse_color: Color):
	for horse_data in finish_order:
		if horse_data.name == horse_name:
			return
	finish_order.append({"name": horse_name, "color": horse_color })
	print(horse_name, " has crossed the finish line")
		
	emit_signal("race_positions_updated", finish_order)

func end_race():
	print("The Race is OVER!")
