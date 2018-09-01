extends "res://Step.gd"

func _ready():
	$Goal.set_text("Fill frisbee")
	$Frisbee.connect("complete", self, "_complete")
