extends Control

@onready var results_window = self
@onready var first_label = $FirstLabel
@onready var second_label = $SecondLabel
@onready var third_label = $ThirdLabel
@onready var title_label = $ResultsTitle
@onready var first_horse_face_sprite = $FirstPlaceHorse
@onready var second_horse_face_sprite = $SecondPlaceHorse
@onready var third_horse_face_sprite = $ThirdPlaceHorse

func _ready():
	results_window.visible = false
	GlobalManager.connect("race_positions_updated", Callable(self, "_update_positions"))

func _update_positions(order: Array):
	# Update top 3 names as horses finish
	if order.size() >= 1:
		first_label.text = order[0].name
		first_horse_face_sprite.modulate = order[0].color
	if order.size() >= 2:
		second_label.text = order[1].name
		second_horse_face_sprite.modulate = order[1].color
	if order.size() >= 3:
		third_label.text = order[2].name
		third_horse_face_sprite.modulate = order[2].color
		_show_results_window(order)

func _show_results_window(order):
	if results_window.visible:
		return
	### TEMPORARY FOR STAT TRACKING
	GlobalManager.horse_wins[order[0].name] += 3
	GlobalManager.horse_wins[order[1].name] += 2
	GlobalManager.horse_wins[order[2].name] += 1
	GlobalManager.first_place[order[0].name] += 1
	GlobalManager.placement_wins[order[0].odds] += 1
	### END TEMP
	results_window.visible = true
	title_label.text = "🏆 Race Results 🏆"
	### MORE TEMP
	print("Total: " + str(GlobalManager.horse_wins))
	print("First Place: " + str(GlobalManager.first_place))
	print("Odds Ranking: " + str(GlobalManager.placement_wins))
	get_tree().reload_current_scene()
