extends "res://Grabbable.gd"

var origin = "PeanutButter"

func _ready():
    global_rotation = deg2rad(randf() * 360)
    connect("body_entered", self, "_body_entered")
