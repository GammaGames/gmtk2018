extends "res://Step.gd"

func _ready():
	$Steak.connect("complete", self, "_complete")
	$Goal/Margin/Label.text = "Tenderize Steak"
