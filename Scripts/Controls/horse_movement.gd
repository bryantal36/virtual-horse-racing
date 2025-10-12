extends Node2D

@onready var horse_sprite: AnimatedSprite2D = $HorseSprite

func _init() -> void:
	print("test")

func _process(delta: float) -> void:
	var horse_speed = 200
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("Up"):
		velocity.y -= 1
	if Input.is_action_pressed("Down"):
		velocity.y += 1
	if Input.is_action_pressed("Left"):
		velocity.x -= 1
	if Input.is_action_pressed("Right"):
		velocity.x += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * horse_speed
		horse_sprite.play("gallop_right")
		position += velocity * delta
	else:
		horse_sprite.play("idle_right")
