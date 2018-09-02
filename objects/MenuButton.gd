extends "res://Grabbable.gd"

export(String) var text = ""

func _ready():
	$Button.connect("pressed", self, "_pressed")

func _pressed():
	$"..".selected = name
	$"../Transition".play(text, "in")
