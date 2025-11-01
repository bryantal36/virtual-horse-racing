extends Node

var current_lap: int = 0
var finish_order: Array = []

var horse_wins = {"Aquarium Contrarian": 0, "Carnivorous Cheese": 0, "Boomer Flash": 0, "Ceaseless Edge": 0, "Violet Haven": 0, "Delta Queen": 0}
var placement_wins = {1:0.0,2:0.0,3:0.0,4:0.0,5:0.0,6:0.0}
var first_place = {"Aquarium Contrarian": 0, "Carnivorous Cheese": 0, "Boomer Flash": 0, "Ceaseless Edge": 0, "Violet Haven": 0, "Delta Queen": 0}

signal race_positions_updated
signal end_race

# Adds the horse details to a dictionary to be passed to the betting UI

func generate_placements(horse_name: String, horse_color: Color, horse_odd_temp: int):
	for horse_data in finish_order:
		if horse_data.name == horse_name:
			return
	finish_order.append({"name": horse_name, "color": horse_color, "odds": horse_odd_temp})
	#print(horse_name, " has crossed the finish line")
		
	emit_signal("race_positions_updated", finish_order)

	if finish_order.size() >= 3:
		emit_signal("end_race")
