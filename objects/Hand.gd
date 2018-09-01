extends Area2D

var holding = null
var punching = false

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
    connect("body_entered", self, "_body_entered")

func _input(event):
    if event is InputEventMouseMotion:
        global_position = get_global_mouse_position()
    if event is InputEventMouseButton:
        if event.pressed and $AnimationPlayer.current_animation != "close":
            $AnimationPlayer.play("close")
            var bodies = get_overlapping_bodies()
            var body = null
            var areas = get_overlapping_areas()
            var area = null
            if bodies.size():
                for b in bodies:
                    if b.input_pickable:
                        body = b
                if body:
                    body.is_held = true
                    holding = body
                    if body.has_method("grab"):
                        body.grab()
            if areas.size() and body == null:
                for a in areas:
                    if a.input_pickable:
                        area = a
                if area:
                    if area.has_method("click"):
                        area.click()
            if body == null and area == null:
                punching = true
        elif !event.pressed and $AnimationPlayer.current_animation != "open":
            $AnimationPlayer.play("open")
            punching = false
            if holding:
                holding.is_held = false
                holding = null

    if Input.is_action_pressed("rotate_right"):
        if holding:
            holding.angular_velocity = -2.5
    elif Input.is_action_pressed("rotate_left"):
        if holding:
            holding.angular_velocity = 2.5

func _body_entered(body):
    if punching and body.has_method("hit"):
        body.hit(self)
