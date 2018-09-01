extends Area2D

var life = 1

func _ready():
	add_to_group("milk")

func _process(delta):
	global_position.y += 80 * delta
	life -= delta

	if life < 0:
		queue_free()
