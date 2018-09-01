extends "res://Grabbable.gd"

var cooking = false
var cooked = false

func _process(delta):
    if cooking:
        pass
    else:
        pass
    if cooked and !emitted:
        emit_signal("complete")
        emitted = true

func cook(status):
    cooking = status
