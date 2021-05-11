extends KinematicBody2D

var velocity = Vector2(0,0)
const move_speed = 100
const GRAVITY = 10
const JUMPFORCE = -200


func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		velocity.x = move_speed
	if Input.is_action_pressed("Left"):
		velocity.x = -move_speed
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.1)
	
	
