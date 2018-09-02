extends "res://Level.gd"

func _ready():
    level = "MilkSteak"
    num_steps = 3
    $Transition.play("The Gang Makes Milk Steak", "out")
    load_steps()

func _exit():
    $Transition.play("The Gang Made Milk Steak", "in")

func quit_to_main():
    State.milk_steak = true
    .quit_to_main()
