extends "res://Step.gd"

func _ready():
    # $Bread.connect("complete", self, "_complete")
    $Goal/Margin/Label.text = "Add peanut butter to bread"
