extends CharacterBody2D

@onready var horse_sprite: AnimatedSprite2D = $"HorseSprite"

@export var horse_name: String = "Name Placeholder"
@export var horse_color: Color = Color(1, 1, 1)
@export var horse_speed: float = 110
var is_moving: bool = true

func _init() -> void:
	var random_y_vector = randf_range(-1, 1)
	velocity = Vector2.RIGHT
	velocity.y = random_y_vector
	horse_speed = randi_range(90, 140)
	
	# Random horse color. This just adjusts the hue and is temporary until replaced.
	#var red = randf_range(0,1)
	#var green = randf_range(0,1)
	#var blue = randf_range(0,1)
	#modulate.r = red
	#modulate.g = green
	#modulate.b = blue
	
func _ready() -> void:
	horse_sprite.modulate = horse_color

func _physics_process(delta: float) -> void:
	if is_moving:
		var collision = move_and_collide(velocity * delta * horse_speed)
		if collision:
			var normal = collision.get_normal()
			velocity = velocity.bounce(normal)
	else:
		velocity = Vector2.ZERO
	
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
	
func disable_collisions() -> void:
	for child in get_children():
		if child is CollisionShape2D:
			child.call_deferred("set_disabled", true)

func stop_moving():
	is_moving = false
	disable_collisions()
	modulate.a = 0.5 #Makes the horse transparent
