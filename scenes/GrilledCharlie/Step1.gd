extends "res://Step.gd"

func _ready():
    $Bread.connect("complete", self, "_complete")
    $Goal.set_text("Add Peanut Butter")
