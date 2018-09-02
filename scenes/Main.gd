extends Node2D

var selected = null

func _ready():
    randomize()
    $Transition.connect("intro", self, "_intro")
    match State.current_transition:
        "MilkSteak":
            $Transition.play("The Gang Made Milksteak", "out")

    State.current_transition = null

func _intro():
    get_tree().change_scene("res://scenes/" + selected + "/Main.tscn")
