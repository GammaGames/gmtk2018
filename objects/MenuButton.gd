extends "res://Grabbable.gd"

func _ready():
	$Button.connect("pressed", self, "_pressed")

func _pressed():
	$"..".selected = name
	$"../Transition".play("The Gang Makes Milksteak", "in")
