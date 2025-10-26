extends Control

@onready var results_window = self
@onready var first_label = $FirstLabel
@onready var second_label = $SecondLabel
@onready var third_label = $ThirdLabel
@onready var title_label = $ResultsTitle
@onready var fist_horse_sprite = $FirstPlaceHorse
@onready var second_horse_sprite = $SecondPlaceHorse
@onready var third_horse_sprite = $ThirdPlaceHorse

func _ready():
	results_window.visible = false
	GlobalManager.connect("race_positions_updated", Callable(self, "_update_positions"))

func _update_positions(order: Array):
	# Update top 3 names as horses finish
	if order.size() >= 1:
		first_label.text = order[0]
	if order.size() >= 2:
		second_label.text = order[1]
	if order.size() >= 3:
		third_label.text = order[2]
		_show_results_window()

func _show_results_window():
	if results_window.visible:
		return
	
	results_window.visible = true
	title_label.text = "🏆 Race Results 🏆"
