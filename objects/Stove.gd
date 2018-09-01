extends RigidBody2D

var enabled = false

func _ready():
	$Heat.connect("body_shape_entered", self, "_body_shape_entered")
	$Heat.connect("body_shape_exited", self, "_body_shape_exited")

func toggle():
	enabled = !enabled
	$Fire.emitting = enabled
	$Heat/Shape.disabled = !enabled

func _body_shape_entered(body_id, body, body_shape, area_shape):
	if body.has_method("cook"):
		body.cook(true)

func _body_shape_exited(body_id, body, body_shape, area_shape):
	if body.has_method("cook"):
		body.cook(false)
