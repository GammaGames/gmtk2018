extends "res://Step.gd"

onready var vodka = preload("res://objects/Vodka.tscn")

func _ready():
    $Cup.connect("complete", self, "_complete")
    $Cup.connect("vodka", self, "_vodka")
    $Cup.connect("ice", self, "_ice")
    $Goal/Margin/Label.text = "Add Energy Drink"

func _vodka():
    var v = vodka.instance()
    add_child(v)
    v.global_position = Vector2(90, -80)
