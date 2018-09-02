extends "res://Step.gd"

onready var ice = preload("res://objects/Ice.tscn")

func _ready():
    $Cup.connect("complete", self, "_complete")
    $IceTimer.connect("timeout", self, "_timeout")
    $Goal.set_text("Catch Ice")

func _timeout():
    var i = ice.instance()
    add_child(i)
    $IcePath/Location.set_offset(randi())
    i.global_position = $IcePath/Location.global_position

func _complete():
    emit_signal("exit")
