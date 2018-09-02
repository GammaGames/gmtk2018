extends "res://Level.gd"

func _ready():
    level = "RiotJuice"
    num_steps = 2
    $Transition.play("The Gang Makes Riot Juice", "out")
    load_steps()

func _exit():
    $Transition.play("The Gang Made Riot Juice", "in")

func quit_to_main():
    State.riot_juice = true
    .quit_to_main()
