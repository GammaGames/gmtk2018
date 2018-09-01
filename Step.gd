extends Node2D

signal complete

func _ready():
	add_to_group("steps")

func _complete():
	emit_signal("complete")
