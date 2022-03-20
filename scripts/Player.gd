extends KinematicBody2D


const SPEED = 100


func _physics_process(delta):
	var movement = Vector2()
	
	if Input.is_action_pressed("move_left"):
		movement.x -= SPEED
	if Input.is_action_pressed("move_right"):
		movement.x += SPEED
		
	move_and_slide(movement)
