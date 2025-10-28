extends Node2D

# This is the betting screen
@onready var betting_screen: Control = $BettingScreen

# Could technically do this by grabbing StartingPositionMaster and just running
# through its children via a loop.
@onready var SP1: Node2D = $StartingPositionMaster/StartingPosition1
@onready var SP2: Node2D = $StartingPositionMaster/StartingPosition2
@onready var SP3: Node2D = $StartingPositionMaster/StartingPosition3
@onready var SP4: Node2D = $StartingPositionMaster/StartingPosition4
@onready var SP5: Node2D = $StartingPositionMaster/StartingPosition5
@onready var SP6: Node2D = $StartingPositionMaster/StartingPosition6

# In fact, I'll do it for the horses to illustrate
@onready var horses: Node2D = $Horses

# This is an array of all starting positions, which will be used to generate the
# race.
@onready var starting_position_master = [SP1,SP2,SP3,SP4,SP5,SP6]
var horses_master = []

func _ready() -> void:
	# This flushes the array in case there's any data left over.
	GlobalManager.finish_order = []
	
	# Now we plug all of the horses into one array, without having to reference
	# them individually.
	get_tree().paused = true
	for i in horses.get_child_count():
		horses_master.append(horses.get_child(i))
	
	# This must be called here, after the array has been populated
	set_starting_positions()
	# This is to update the betting screen. Must be called after
	# set_starting_positions() is called.
	betting_screen.update_display()

func _process(delta: float) -> void:
	# This resets the game
	if Input.is_action_just_pressed("Up"):
		get_tree().reload_current_scene()
	# This puts the horses in a random starting position. I recommend having
	# the game paused or doing this after resetting.
	if Input.is_action_just_pressed("Down"):
		set_starting_positions()
	# This pauses/unpaused the game.
	if Input.is_action_just_pressed("Right"):
		start_race()

func set_starting_positions():
	# We need to create a duplicate array as we will be removing the SPs as we
	# use them.
	var SP = starting_position_master.duplicate()
	
	# Now to loop through all of the horses.
	for i in horses_master:
		# We will randomly select which SP to use out of the remaining.
		var random_sel = randi_range(1,SP.size()) - 1
		# This will return the SP we need and remove it from the array.
		var SP_sel = SP.pop_at(random_sel)
		# Now we can adjust the horses SPs.
		i.global_position = SP_sel.global_position
		# This second var is handled by the betting screen, to factor in
		# to the horse's odds of winning.
		i.horse_starting_pos = SP_sel.horse_starting_pos

# All this function does is toggle pause state
func start_race():
	get_tree().paused = !get_tree().paused
