extends Node2D

var first = false
var second = false
var third = false

func _process(delta: float) -> void:
	if first == false && global_position.x < 174:
		global_position.x += 15*delta
	else:
		first = true
	
	if first == true && second == false && rotation_degrees < 90:
		rotation_degrees += 15*delta
	elif first == true && second == false && rotation_degrees >= 90:
		rotation_degrees = 90
		second = true
		global_position.x = 258
	
	if second == true && third == false && global_position.y < 79:
		global_position.y += 15*delta
	elif second == true && third == false && global_position.y >= 79:
		third = true
