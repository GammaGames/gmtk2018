extends "res://Pickable.gd"

signal complete

var hits = 10

func hit(body):
    $Beat.global_rotation = deg2rad(-90)
    $Beat.restart()
    $AnimationPlayer.play("beat")
    hits -= 1
    if hits > 0:
        get_node("Wound" + str(hits)).visible = true
    elif hits == 0:
        emit_signal("complete")
