extends Area2D


var isLeaving = false


func _physics_process(delta):
	if isLeaving:
		position.y -= 50 * delta

func _on_Coin_body_entered(body):
	if not isLeaving:
		isLeaving = true
		
		$AnimatedSprite.speed_scale = 2
		scale *= 0.5
		
		$Timer.start()

func _on_Timer_timeout():
	queue_free()
