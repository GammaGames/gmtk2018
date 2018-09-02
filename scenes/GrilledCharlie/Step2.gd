extends "res://Step.gd"

onready var cheese = preload("res://objects/Cheese.tscn")
onready var bread = preload("res://objects/BreadSlice.tscn")
onready var butter = preload("res://objects/Butter.tscn")

func _ready():
	$Bread.connect("complete", self, "_complete")
	$Bread.connect("cheese", self, "_cheese")
	$Bread.connect("bread", self, "_bread")
	$Bread.connect("butter", self, "_butter")
	$Goal.set_text("Add Chocolate")

func _cheese():
    var c = cheese.instance()
    add_child(c)
    c.global_position = Vector2(260, -70)
    $Goal.set_text("Add Cheese")

func _bread():
    var b = bread.instance()
    add_child(b)
    b.global_position = Vector2(260, -70)
    $Goal.set_text("Add Another Slice")

func _butter():
    var b = butter.instance()
    add_child(b)
    b.global_position = Vector2(260, -70)
    $Goal.set_text("Add Butter")
