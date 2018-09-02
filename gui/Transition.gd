extends CanvasLayer

signal intro_finish
signal intro
signal transition_finish
signal transition

func _ready():
    $AnimationPlayer.connect("animation_started", self, "_animation_started")
    $AnimationPlayer.connect("animation_finished", self, "_animation_finished")

func play(text, step):
    $RigidBody2D/Label.text = '"' + text + '"'
    $AnimationPlayer.play(step)

func play_disabled(step):
        $AnimationPlayer.play(step + "_disabled")

func play_hidden(step):
    $AnimationPlayer.play(step + "_hidden")

func _animation_started(animation):
    $RigidBody2D.visible = true

func _animation_finished(animation):
    if animation == "in":
        $AnimationPlayer.play("out")
        emit_signal("intro")
    elif animation == "in_hidden":
        $AnimationPlayer.play("out_hidden")
        emit_signal("transition")
    elif animation == "in_disabled":
        $AnimationPlayer.play("out_disabled")
        emit_signal("intro")
