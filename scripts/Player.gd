extends KinematicBody2D


const SPEED = 10
const G = Vector2(0, 2)

var movement = Vector2()


func _physics_process(delta):
	movement += G
	
	if Input.is_action_pressed("move_left"):
		movement.x -= SPEED
	if Input.is_action_pressed("move_right"):
		movement.x += SPEED
	
	movement = move_and_slide(movement)
