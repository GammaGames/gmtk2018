extends "res://Step.gd"

func _ready():
	$Goal.set_text("Fill Frisbee")
	$Frisbee.connect("complete", self, "_complete")
