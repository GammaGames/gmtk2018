extends "res://Cookable.gd"

var amount = 100

func _process(delta):
	._process(delta)

	if cooking:
		amount -= 15 * delta
	if amount <= 20:
		cooked = true

	var c = amount / 100
	modulate = Color(c, c, c, 1)
