extends Projectile

class_name Ring

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ring: Sprite2D = $Ring

func _ready() -> void:
	if hurt_color == Gamemanager.colors.RED:
		ring.modulate = Color(1.0, 0.0, 0.0, 1.0)
	if hurt_color == Gamemanager.colors.GREEN:
		ring.modulate = Color(0.0, 1.0, 0.0, 1.0)
	if hurt_color == Gamemanager.colors.BLUE:
		ring.modulate = Color(0.0, 0.0, 1.0, 1.0)
func play_scale_slow():
	animation_player.play('scale slow')
func play_scale_normal():
	animation_player.play('scale')
func play_scale_fast():
	animation_player.play('scale fast')
