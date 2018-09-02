extends "res://Grabbable.gd"

signal vodka

var energy_amount = 60
var energy_full = false
var vodka_amount = 60
var vodka_full = false

func _process(delta):
    if !energy_full:
        var frame = floor((60 - energy_amount) / 20)
        $Liquid.frame =  frame
        $Liquid.visible = energy_amount != 60
    elif !vodka_full:
        var frame = floor((60 - vodka_amount) / 20) + 2
        $Liquid.frame =  frame


func fill(name):
    match name:
        "EnergyDrink":
            energy_amount -= .4
            if energy_amount <= 0 and !energy_full:
                energy_full = true
                $"../Goal".set_text("Add Spririts")
                emit_signal("vodka")
        "Vodka":
            vodka_amount -= .4
            if vodka_amount <= 0 and !vodka_full:
                vodka_full = true
                $"../Goal".set_text("Add Ice")
                $Liquid.frame =  5
                complete = true
