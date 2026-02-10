extends Node

class_name SongScene

var ring = preload('res://That-One-UnderTale-Game-Thing/scenes/Projectiles/drum_ring.tscn')
enum ring_scale_speed {
	SLOW,
	MEDIUM,
	FAST,
}
func add_ring(ring_inst : Ring, speed : ring_scale_speed):
	add_child(ring_inst)
	ring_inst.position = Vector2.ZERO
	match speed:
		ring_scale_speed.SLOW:
			ring_inst.play_scale_slow()
		ring_scale_speed.MEDIUM:
			ring_inst.play_scale_normal()
		ring_scale_speed.FAST:
			ring_inst.play_scale_fast()
func add_ring_red_slow():
	var ring_inst : Ring = ring.instantiate()
	add_ring(ring_inst, ring_scale_speed.SLOW)
	ring_inst.hurt_color = Gamemanager.colors.RED

func add_ring_green_slow():
	var ring_inst : Ring = ring.instantiate()
	add_ring(ring_inst, ring_scale_speed.SLOW)
	ring_inst.hurt_color = Gamemanager.colors.GREEN

func add_ring_blue_slow():
	var ring_inst : Ring = ring.instantiate()
	add_ring(ring_inst, ring_scale_speed.SLOW)
	ring_inst.hurt_color = Gamemanager.colors.BLUE

func add_ring_red_normal():
	var ring_inst : Ring = ring.instantiate()
	add_ring(ring_inst, ring_scale_speed.MEDIUM)
	ring_inst.hurt_color = Gamemanager.colors.RED

func add_ring_green_normal():
	var ring_inst : Ring = ring.instantiate()
	add_ring(ring_inst, ring_scale_speed.MEDIUM)
	ring_inst.hurt_color = Gamemanager.colors.GREEN
	
func add_ring_blue_normal():
	var ring_inst : Ring = ring.instantiate()
	add_ring(ring_inst, ring_scale_speed.MEDIUM)
	ring_inst.hurt_color = Gamemanager.colors.BLUE

func add_ring_red_fast():
	var ring_inst : Ring = ring.instantiate()
	add_ring(ring_inst, ring_scale_speed.FAST)
	ring_inst.hurt_color = Gamemanager.colors.RED

func add_ring_green_fast():
	var ring_inst : Ring = ring.instantiate()
	add_ring(ring_inst, ring_scale_speed.FAST)
	ring_inst.hurt_color = Gamemanager.colors.GREEN
	
func add_ring_blue_fast():
	var ring_inst : Ring = ring.instantiate()
	add_ring(ring_inst, ring_scale_speed.FAST)
	ring_inst.hurt_color = Gamemanager.colors.BLUE
