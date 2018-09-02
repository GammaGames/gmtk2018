extends "res://Step.gd"

func _ready():
	$Steak.connect("complete", self, "_complete")
	$Goal.set_text("Tenderize Steak")
