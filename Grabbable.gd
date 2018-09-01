extends RigidBody2D

signal complete

var complete = false
var is_held = false
var drag_speed = 20

func _process(delta):
    if complete:
        emit_signal("complete")

func _physics_process(delta):
    if is_held:
        mode = MODE_RIGID
        linear_velocity = get_global_mouse_position() - global_position
        linear_velocity *= drag_speed

func reparent(node):
    var old_pos = global_position
    get_parent().remove_child(self)
    node.add_child(self)
    global_position = old_pos
