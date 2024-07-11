extends Control

@onready var fullscreenButton : CheckButton = $Fullscreen
@onready var volSlider : HSlider = $VolSlider
@onready var back : Button = $Back

func _ready():
	volSlider.grab_focus()
	

func _process(delta):
	var _windowMode = 3 if fullscreenButton.button_pressed == true else 2
	get_window().mode = _windowMode
	
	AudioServer.set_bus_volume_db(0,linear_to_db(volSlider.value))


func _on_back_pressed():
	visible = false
