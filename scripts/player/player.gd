extends CharacterBody2D

class_name Player

var current_color : Gamemanager.colors = Gamemanager.colors.RED

var max_speed = 200
var acc = 100
var friction = 100

@onready var animated_sprite: AnimatedSprite2D = $'Derpy Guy'
@onready var hit_anim_timer: Timer = $hitAnimTimer

func _ready() -> void:
	Gamemanager.player = self
func _physics_process(_delta: float) -> void:
	playermovement()
	shift_color()
	animation_handler()
func animation_handler():
	if velocity == Vector2.ZERO:
		animated_sprite.play('idle')
	else:
		animated_sprite.play('walk')
	if velocity.x > 0: animated_sprite.flip_h = true
	else: animated_sprite.flip_h = false
	if !hit_anim_timer.is_stopped():
		animated_sprite.play('hurt') #no work
func shift_color():
	if Input.is_action_just_pressed('red'):
		animated_sprite.material.set('shader_parameter/color', Vector4(1, 0, 0, 0))
		current_color = Gamemanager.colors.RED
	if Input.is_action_just_pressed('green'):
		animated_sprite.material.set('shader_parameter/color', Vector4(0, 1, 0, 0))
		current_color = Gamemanager.colors.GREEN
	if Input.is_action_just_pressed('blue'):
		animated_sprite.material.set('shader_parameter/color', Vector4(0, 0, 1, 0))
		current_color = Gamemanager.colors.BLUE
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
		if proj.hurt_color != current_color:
			print('hurt')
			hit_anim_timer.start()
