extends "res://Step.gd"

var to_complete = 2

func _ready():
	$Goal.set_text("Cook Steak")
	$Frisbee.connect("complete", self, "_complete")
	$Frisbee/Steak.connect("complete", self, "_complete")

func _complete():
	to_complete -= 1
	if to_complete == 0:
		emit_signal("exit")
