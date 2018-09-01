extends Node2D

var num_steps = 3
var current = 2
var steps = []
var step = null

func _ready():
	for i in range(1, num_steps + 1):
		steps.push_back(load("res://scenes/MilkSteak/Step" + str(i) + ".tscn"))

	$Transition.connect("transition", self, "_next_step")
	$Transition.play("The Gang Makes Milksteak", "out")
	go_to_step(current)

func _next_step():
	if step != null:
		step.disconnect("complete", self, "_next_step")
	remove_child(step)
	step.queue_free()
	current += 1
	go_to_step(current)

func go_to_step(index):
	step = steps[current].instance()
	add_child(step)
	step.connect("complete", self, "_complete")

func _complete():
	$Transition.play_hidden("in")
