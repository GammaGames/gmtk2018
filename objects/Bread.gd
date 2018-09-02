extends "res://Grabbable.gd"

signal cheese
signal bread
signal butter

var peanutbutter_amount = 12
var chocolate_amount = 12
var full = false
var cheese_full = false
var bread_full = false

func _ready():
    $Area.connect("body_entered", self, "_body_entered")

func fill(name):
    match name:
        "PeanutButter":
            peanutbutter_amount -= 1
            var frame = floor((12 - peanutbutter_amount) / 4)
            $PeanutButter.frame =  frame
            $PeanutButter.visible = true
        "Chocolate":
            chocolate_amount -= .1
            var frame = floor((12 - chocolate_amount) / 4)
            $Chocolate.frame =  frame
            $Chocolate.visible = true
        "Cheese":
            $Cheese.visible = true
            cheese_full = true
        "Bread":
            $Bread.visible = true
            bread_full = true
        "Butter":
            $Butter.visible = true
            complete = true

    if peanutbutter_amount <= 0:
        full = true
        complete = true
    if chocolate_amount <= 0 and !full:
        full = true
        emit_signal("cheese")
    if cheese_full:
        emit_signal("bread")
        cheese_full = false
    if bread_full:
        emit_signal("butter")
        bread_full = false

func _body_entered(body):
    if body.get("origin"):
        match(body.origin):
            "PeanutButter", "Cheese", "Bread", "Butter":
                body.queue_free()
                fill(body.origin)
