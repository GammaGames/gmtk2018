extends CanvasLayer

var config

func _ready():
    $Button.connect("pressed", self, "_pressed")
    $HelpText/Margin/V/H/Volume.connect("value_changed", self, "value_changed")

    config = ConfigFile.new()
    var err = config.load("user://settings.cfg")
    if err == OK:
        var volume = config.get_value("audio", "volume", 0.6)
        $HelpText/Margin/V/H/Volume.value = volume
        value_changed(volume)

func _pressed():
    $HelpText.visible = !$HelpText.visible
    if $HelpText.visible:
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    else:
        Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func value_changed(val):
    if val == 0:
        AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
    else:
        AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
        AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(val))
    config.set_value("audio", "volume", val)
    config.save("user://settings.cfg")
