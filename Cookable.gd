extends "res://Grabbable.gd"

var cooking = false
var cooked = false

func _process(delta):
    if cooking:
        pass
    else:
        pass
    if cooked:
        emit_signal("complete")

func cook(status):
    cooking = status
