extends "res://Grabbable.gd"

func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "_screen_exited")

func _screen_exited():
	if !has_method("check_exit"):
		queue_free()
	elif check_exit():
		queue_free()
