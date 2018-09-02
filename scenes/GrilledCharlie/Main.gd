extends "res://Level.gd"

func _ready():
    level = "GrilledCharlie"
    num_steps = 3
    $Transition.play("The Gang Makes Grilled Charlie", "out")
    load_steps()

func _exit():
    $Transition.play("The Gang Made Grilled Charlie", "in")

func quit_to_main():
    State.grilled_charlie = true
    .quit_to_main()
