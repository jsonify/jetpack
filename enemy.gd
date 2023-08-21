extends StaticBody2D
var speed

func _physics_process(delta):
	position.x -= speed * delta
	if position.x <= 0:
		queue_free()

