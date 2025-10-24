extends Area2D

func _on_body_entered(body):
	print(body.name, " crossed the line")
	if body.has_method("stop_moving"): #This could be cleaner by using groups, but it works for now
		body.stop_moving()
		GlobalManager.end_race()
