extends RigidBody2D

signal complete

var complete = false
var emitted = false
var is_held = false
var drag_speed = 20

func _process(delta):
    if complete and !emitted:
        emit_signal("complete")
        emitted = true

func _physics_process(delta):
    if is_held:
        mode = MODE_RIGID
        linear_velocity = get_global_mouse_position() - global_position
        linear_velocity *= drag_speed

        if angular_velocity < 0.3 and angular_velocity > -0.3:
            angular_velocity += clamp(sigmoid(linear_velocity.x), -0.1, 0.1)

func reparent(node):
    var old_pos = global_position
    get_parent().remove_child(self)
    node.add_child(self)
    global_position = old_pos

func sigmoid(val):
    return val / (1 + abs(val))
