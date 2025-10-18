extends CharacterBody2D

@onready var horse_sprite: AnimatedSprite2D = $"HorseSprite"

var horse_speed = 110

func _init() -> void:
	var random_y_vector = randf_range(-1, 1)
	velocity = Vector2.RIGHT
	velocity.y = random_y_vector

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta * horse_speed)
	if collision:
		var normal = collision.get_normal()
		velocity = velocity.bounce(normal)
	#if Input.is_action_pressed("Up"):
		#velocity.y -= 1
	#if Input.is_action_pressed("Down"):
		#velocity.y += 1
	#if Input.is_action_pressed("Left"):
		#velocity.x -= 1
	#if Input.is_action_pressed("Right"):
		#velocity.x += 1
	
	
	
	if velocity.length() > 0:
		if abs(velocity.y) <= velocity.x:
			horse_sprite.play("gallop_right")
		if abs(velocity.y)*-1 >= velocity.x:
			horse_sprite.play("gallop_left")
		if velocity.y > abs(velocity.x):
			horse_sprite.play("gallop_down")
		if velocity.y < abs(velocity.x)*-1:
			horse_sprite.play("gallop_up")
	else:
		horse_sprite.play("idle_right")
	
	#linear_velocity = velocity*horse_speed*delta
