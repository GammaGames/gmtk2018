extends RigidBody2D

var origin = "Milk"

func _ready():
	connect("body_entered", self, "_body_entered")

func _body_entered(body):
	if body.has_method("fill"):
		body.fill(origin)
		disconnect("body_entered", self, "_body_entered")
		queue_free()
