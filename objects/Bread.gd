extends "res://Grabbable.gd"

var amount = 12
var full = false

func _ready():
    $Area.connect("body_entered", self, "_body_entered")

func fill(name):
    match name:
        "PeanutButter":
            amount -= 1
            var frame = floor((12 - amount) / 4)
            $PeanutButter.frame =  frame
            $PeanutButter.visible = true
        "Chocolate":
            amount -= .1
            var frame = floor((12 - amount) / 4)
            $Chocolate.frame =  frame
            $Chocolate.visible = true
    if amount <= 0:
        full = true
        complete = true

func _body_entered(body):
    if body.get("origin"):
        match(body.origin):
            "PeanutButter":
                body.queue_free()
                fill(body.origin)
