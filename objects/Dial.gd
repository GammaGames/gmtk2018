extends "res://Clickable.gd"

var enabled = false

func click():
    enabled = !enabled
    $"..".toggle()
    if enabled:
        $AnimationPlayer.play("on")
    else:
        $AnimationPlayer.play("off")
