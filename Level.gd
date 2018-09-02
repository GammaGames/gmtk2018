extends Node2D

var level = "MilkSteak"
var num_steps = 1
var current = 0
var steps = []
var step = null

func _ready():
    $Transition.connect("transition", self, "_next_step")
    $Transition.connect("intro", self, "quit_to_main")

func load_steps():
    for i in range(1, num_steps + 1):
        steps.push_back(load("res://scenes/" + level + "/Step" + str(i) + ".tscn"))
    go_to_step(current)

func _next_step():
    $Hand.holding = null
    if step != null:
        step.disconnect("complete", self, "_next_step")
        step.disconnect("exit", self, "_exit")
    remove_child(step)
    step.queue_free()
    current += 1
    go_to_step(current)

func go_to_step(index):
    step = steps[current].instance()
    add_child(step)
    step.connect("complete", self, "_complete")
    step.connect("exit", self, "_exit")

func _complete():
    $Transition.play_hidden("in")

func _exit():
    $Transition.play("foo", "in")

func quit_to_main():
    State.current_transition = level
    get_tree().change_scene("res://scenes/Main.tscn")
