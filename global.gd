extends Node

var world = null

func _process(delta):
	if Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()
