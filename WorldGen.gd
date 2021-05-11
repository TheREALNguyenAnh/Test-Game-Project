extends Position2D

export(PackedScene) var block

export(int) var grid_size
export(int) var max_blocks 
var current_block_number = 0

export(int) var amplitude
export(int) var roughness
export(int) var max_roughness

onready var min_block_height = -grid_size * amplitude
onready var max_block_height = grid_size * amplitude


signal instance_node(node, locations)

func _ready():
	if Global.world != null:
		connect("instance_node", Global.world, "instance_node")

func _process(delta):
	if Global.world != null:
		if !is_connected("instance_node", Global.world, "instance_node"):
			connect("instance_node", Global.world, "instance_node")
			
	if current_block_number < max_blocks:
		var action = round(rand_range(0, 20))
		
		if action > 0 and action < roughness:
			global_position.y -= grid_size
			clamp_height()
		elif action > roughness and action < roughness * 2:
			global_position.y += grid_size 
			clamp_height()
		
		global_position.y = clamp(global_position.y, 20, 150)
		
		global_position.x += grid_size
		emit_signal("instance_node", block, global_position)
		current_block_number += 1
	else:
		queue_free()
		
func clamp_height():
	global_position.y = clamp(global_position.y, min_block_height, max_block_height)
