extends Projectile

@export var initial_velocity : Vector2
const speed_scale = 30
@export var scatter_range : float
func _ready() -> void:
	velocity = Vector2(initial_velocity.x + (randf_range(-scatter_range, scatter_range) / 2), initial_velocity.y + (randf_range(-scatter_range, scatter_range) / 2)).normalized() * speed_scale
func  _process(_delta: float) -> void:
	move_and_slide()
