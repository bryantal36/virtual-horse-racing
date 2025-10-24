extends Control

@onready var first_label = $FirstPlace
@onready var second_label = $SecondPlace
@onready var third_label = $ThirdPlace

func _ready():
	# Connect to the GameManager signal
	GlobalManager.connect("race_positions_updated", Callable(self, "_update_positions"))

func _update_positions(order: Array):
	if order.size() >= 1:
		first_label.text = "1st: " + order[0]
	if order.size() >= 2:
		second_label.text = "2nd: " + order[1]
	if order.size() >= 3:
		third_label.text = "3rd: " + order[2]
