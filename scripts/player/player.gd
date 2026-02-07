extends CharacterBody2D

class_name Player

var colors := Gamemanager.colors
var current_color : colors = colors.RED

var max_speed = 400
var acc = 100
var friction = 100


func _ready() -> void:
	Gamemanager.player = self
func _physics_process(_delta: float) -> void:
	playermovement()
	shift_color()

func shift_color():
	if Input.is_action_just_pressed('red'):
		current_color = colors.RED
	if Input.is_action_just_pressed('green'):
		current_color = colors.GREEN
	if Input.is_action_just_pressed('blue'):
		current_color = colors.BLUE
		match current_color:
			colors.RED:
				pass
func playermovement():
	var input := Input.get_vector('left', 'right', 'up', 'down').normalized()
	
	if input==Vector2.ZERO:
		if velocity.length() > (friction):
			velocity -= velocity.normalized() * (friction)
		else:
			velocity=Vector2.ZERO
	else:
		velocity += (input * acc)
		velocity = velocity.limit_length(max_speed)
	move_and_slide()


func _on_hit_detection_body_entered(body: Node2D) -> void:
	if body is Projectile:
		var proj : Projectile = body
		if proj.color == current_color:
			print('hi')
