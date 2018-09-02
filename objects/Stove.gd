extends RigidBody2D

var enabled = false

func _ready():
	$Heat.connect("body_entered", self, "_body_entered")
	$Heat.connect("body_exited", self, "_body_exited")

func toggle():
	enabled = !enabled
	$Fire.emitting = enabled
	$Heat/Shape.disabled = !enabled

func _body_entered(body):
	if body.has_method("cook"):
		body.cook(true)

func _body_exited(body):
	if body.has_method("cook"):
		body.cook(false)
