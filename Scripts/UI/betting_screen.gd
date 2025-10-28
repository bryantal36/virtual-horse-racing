extends Control

@onready var main = get_parent()

var horse_value_master = []
var horse_placement = []

# Retrieve the node group with all the horse names
@onready var horse_names: Node2D = $HorseNames
var horse_names_master = []

# Now to do the same for the horse faces
@onready var horses: Node2D = $Horses
var horse_faces_master = []

# And once more for the horse odds
@onready var horse_odds: Node2D = $HorseOdds
var horse_odds_master = []

# We need to call this function after the MainScene loads, so the call for this
# function is found in _ready in the admin script.
func update_display():
	# Populate the horse name array
	for i in horse_names.get_child_count():
		horse_names_master.append(horse_names.get_child(i))
	
	# Populate the horse face array
	for i in horses.get_child_count():
		horse_faces_master.append(horses.get_child(i))
	
	# Populate the horse odds array
	for i in horse_odds.get_child_count():
		horse_odds_master.append(horse_odds.get_child(i))
	
	var slot = 0
	for i in horse_names_master:
		# i in this context is the physical node, and isn't an integer. Thus
		# we use var slot to accomplish the goal we need.
		i.text = main.horses_master[slot].horse_name
		slot += 1
	
	var slot1 = 0
	for i in horse_faces_master:
		i.modulate = main.horses_master[slot1].horse_color
		slot1 += 1
	
	# Everything below is used for calculating the odds of a horse.
	
	# We need to retrieve the SP and speed for each horse.
	for i in main.horses_master:
		var horse_value = 0
		horse_value += i.horse_speed
		if i.horse_starting_pos <= 2:
			horse_value += 50
		elif i.horse_starting_pos <= 4:
			horse_value += 25
		else:
			horse_value -= 50
		horse_value_master.append(horse_value)
	
	for i in horse_value_master:
		var temp = 0
		var placement = 0
		for x in horse_value_master:
			if i > x:
				placement += 1
		horse_placement.append(placement)
		temp += 1
		print(horse_placement)
