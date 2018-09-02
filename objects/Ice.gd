extends "res://Grabbable.gd"

var life = 5
var in_cup = false

func _ready():
    global_rotation = deg2rad(randf() * 360)
    add_to_group("ice")

func _process(delta):
    if !in_cup:
        life -= delta
        if life < 1:
            modulate = Color(1, 1, 1, life)
        if life <= 0:
            queue_free()
