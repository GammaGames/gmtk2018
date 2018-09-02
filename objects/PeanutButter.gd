extends "res://Grabbable.gd"

var cap = true
onready var blob = preload("res://objects/PeanutButterBlob.tscn")
var countdown = 0

func _physics_process(delta):
    ._physics_process(delta)
    countdown -= delta

    if !cap:
        var overturned = abs(rad2deg(global_rotation)) > 100

        if overturned and countdown <= 0:
            countdown = .5
            var b = blob.instance()
            b.origin = name
            b.global_position = $Particles.global_position
            $"..".add_child(b)
