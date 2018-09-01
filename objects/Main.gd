extends Node2D

var selected = "MilkSteak"

func _ready():
	$Transition.connect("intro", self, "_intro")
	$Transition.play("The Gang Makes Milksteak", "in")

func _intro():
	get_tree().change_scene("res://scenes/" + selected + "/Main.tscn")
