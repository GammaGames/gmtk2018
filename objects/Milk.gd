extends "res://Grabbable.gd"

var cap = true
onready var blob = preload("res://objects/MilkBlob.tscn")

func _physics_process(delta):
    ._physics_process(delta)

    if !cap:
        var overturned = abs(rad2deg(global_rotation)) > 100

        $Particles.emitting = overturned
        if overturned:
            var b = blob.instance()
            b.global_position = $Particles.global_position
            $"..".add_child(b)
