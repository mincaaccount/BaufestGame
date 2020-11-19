extends Area2D

export var life: int = 20
var player = null
var move = Vector2.ZERO
export var speed: int = 50

func damage(amount: int):
	life -= amount
	if life <= 0:
		queue_free()

func _physics_process(delta):
	move = Vector2.ZERO
	
	if player != null:
		move = position.direction_to(player.position)
	else:
		move = Vector2.ZERO
		
	move = move.normalized()
	position.x += move.x * speed
	

func _on_Area2D_area_entered(body):
		if body != self:
			player = body

func _on_Area2D_area_exited(area):
	player = null
