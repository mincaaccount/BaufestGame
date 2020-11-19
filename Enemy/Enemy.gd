extends Area2D

export var life: int = 20
var player = null
var move = Vector2.ZERO
export var speed: int = 1

func damage(amount: int):
	life -= amount
	if life <= 0:
		queue_free()

func _physics_process(delta):
	move = Vector2.ZERO
	
	if player != null:
		move = position.direction_to(player.position) * speed
	else:
		move = Vector2.ZERO
		
	move = move.normalized()

func _on_Area2D_body_entered(body):
	if body != self:
		player = body

func _on_Area2D_body_exited(body):
	player = null



