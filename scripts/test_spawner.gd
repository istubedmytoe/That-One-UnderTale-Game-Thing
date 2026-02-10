extends Node2D

@export var spawn_thing : PackedScene

#func _ready() -> void:
	#await get_tree().process_frame
	#for i in range(130):
		#var thingamabobber : Node2D = spawn_thing.instantiate()
		#add_sibling(thingamabobber)
		#thingamabobber.global_position = global_position

func _on_timer_timeout() -> void:
	
	var thingamabobber : Node2D = spawn_thing.instantiate()
	add_sibling(thingamabobber)
	thingamabobber.global_position = global_position
