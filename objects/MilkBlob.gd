extends Area2D

var life = 1
var origin = "Milk"

func _ready():
	connect("body_entered", self, "_body_entered")

func _process(delta):
	global_position.y += 80 * delta
	life -= delta

	if life < 0:
		queue_free()

func _body_entered(body):
	if body.has_method("fill"):
		body.fill(origin)
		disconnect("body_entered", self, "_body_entered")
		queue_free()
