extends KinematicBody2D


export var jump_power = 100
export var SPEED = 10

const G = Vector2(0, 3)
const UP = Vector2(0, -1)

var movement = Vector2()


func _physics_process(delta):
	movement.x *= (1 - delta / 0.1)
	movement += G
	
	if Input.is_action_pressed("move_left"):
		movement.x -= SPEED
	if Input.is_action_pressed("move_right"):
		movement.x += SPEED
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		movement += Vector2(0, -jump_power)
	
	if not is_on_floor():
		if movement.y > - 1:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("fall")
	else:
		if abs(movement.x) > 0.3:
			$AnimatedSprite.play("walk")
		else:
			$AnimatedSprite.play("stand")
			
	$AnimatedSprite.flip_h = movement.x < 0
	
	movement = move_and_slide(movement, UP)
