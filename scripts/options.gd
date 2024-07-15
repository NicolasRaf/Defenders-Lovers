extends Control

@onready var fullscreenButton : CheckButton = $Fullscreen
@onready var volSlider : HSlider = $VolSlider
@onready var back : Button = $Back

func _ready():
	volSlider.grab_focus()
	

func _process(delta):
	AudioServer.set_bus_volume_db(0,linear_to_db(volSlider.value))


func _on_back_pressed():
	if get_tree().current_scene.name == "titlescreen":
		get_tree().paused = false
		visible = false
		get_parent().get_node("Buttons/start").grab_focus()
		
	if get_tree().current_scene.name == "World":
		get_tree().paused = false
		visible = false
	
	
func _on_fullscreen_pressed():
	var _windowMode = 3 if fullscreenButton.button_pressed == true else 0
	get_window().mode = _windowMode
