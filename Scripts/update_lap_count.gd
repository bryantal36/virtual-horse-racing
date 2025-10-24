extends Area2D

func _on_body_entered(body):
	if body.has_method("stop_moving"): #This could be cleaner by using groups, but it works for now
		body.stop_moving()
		#print(body.horse_name, " crossed the line")
		GlobalManager.generate_placements(body.horse_name)
		GlobalManager.end_race()
