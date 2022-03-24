extends KinematicBody2D


export var SPEED = 10
const JUMP = Vector2(0, -100)

const G = Vector2(0, 2)
const UP = Vector2(0, -1)

var movement = Vector2()


func _physics_process(delta):
	movement += G
	
	if Input.is_action_pressed("move_left"):
		movement.x -= SPEED
	if Input.is_action_pressed("move_right"):
		movement.x += SPEED
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		movement += JUMP
	
	if not is_on_floor():
		if movement.y > 0:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("fall")
	else:
		if abs(movement.x) > 0.1:
			$AnimatedSprite.play("walk")
		else:
			$AnimatedSprite.play("stand")
			
	$AnimatedSprite.flip_h = movement.x < 0
	
	movement = move_and_slide(movement, UP)
