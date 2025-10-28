extends Control
@onready var start_button: TextureButton = $TextureButton

func _on_texture_button_pressed() -> void:
	# Can be fleshed out more later. All this does is switch the game
	# to be unpaused, then hides itself.
	visible = false
	get_tree().paused = false
