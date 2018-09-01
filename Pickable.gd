extends RigidBody2D

var is_held = false
var drag_speed = 100

func _physics_process(delta):
    if is_held:
        mode = MODE_RIGID
        linear_velocity = get_global_mouse_position() - global_position
        linear_velocity *= 20

func reparent(node):
    var old_pos = global_position
    get_parent().remove_child(self)
    node.add_child(self)
    global_position = old_pos
