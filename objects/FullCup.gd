extends "res://Grabbable.gd"

var ice_count = 5

func _ready():
    $Area.connect("body_entered", self, "_body_entered")
    $Area.connect("body_exited", self, "_body_exited")

func _process(delta):
    pass

func _body_entered(body):
    if body.is_in_group("ice"):
        ice_count -= 1
        body.in_cup = true
        if ice_count == 0:
            complete = true

func _body_exited(body):
    if body.is_in_group("ice"):
        ice_count  += 1
        body.in_cup = false
