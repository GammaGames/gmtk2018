extends "res://Grabbable.gd"

var amount = 100
var full = false
var hits = 10

func _process(delta):
    var frame = floor((100 - amount) / 20)
    if frame < 5:
        $Milk.frame =  frame
        $Milk.visible = amount != 100
    elif frame < 9:
        get_node("../Table/Spill" + str(fmod(frame + 1, 5))).visible = true

func fill(name):
    amount -= 0.4
    if amount <= 0 and !full:
        full = true
        $"../Goal".set_text("Tenderize Milk")

func hit(body):
    $Beat.global_rotation = deg2rad(-90)
    $Beat.restart()
    if full:
        hits -= 1
        if hits == 9:
            $"../../Hand/bandaid".visible = false
        if hits > 0:
            get_node("Bubble" + str(hits)).visible = true
        if hits == 0:
            complete = true
        else:
            complete = false
