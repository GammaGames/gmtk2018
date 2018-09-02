extends "res://Grabbable.gd"

export var origin = "PeanutButter"

func _ready():
    global_rotation = deg2rad(randf() * 360)
