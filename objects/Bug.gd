extends "res://Grabbable.gd"

func _ready():
    var c = fmod(randf(), 0.7) + 0.3
    modulate = Color(c, c, c, 1.0)
