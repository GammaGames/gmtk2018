extends Area2D

var life = 1
var origin = "Milk"

func _ready():
	connect("body_shape_entered", self, "_body_shape_entered")

func _process(delta):
	global_position.y += 80 * delta
	life -= delta

	if life < 0:
		queue_free()

func _body_shape_entered(body_id, body, body_shape, area_shape):
	if body.has_method("fill"):
		body.fill(origin)
		disconnect("body_shape_entered", self, "_body_shape_entered")
		queue_free()
