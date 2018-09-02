extends "res://Step.gd"

func _ready():
    $Bread.connect("complete", self, "_complete")
    $Goal.set_text("Cook bread")

func _complete():
    emit_signal("exit")
