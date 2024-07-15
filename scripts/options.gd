extends Control

@onready var optionMusic : OptionButton = $OptionMusic
@onready var fullscreenButton : CheckButton = $Fullscreen
@onready var volSlider : HSlider = $VolSlider
@onready var back : Button = $Back
var count = 0

func _ready():
	volSlider.grab_focus()
	

func _process(delta):
	AudioServer.set_bus_volume_db(0,linear_to_db(volSlider.value))
	
	if Input.is_action_just_pressed("ui_cancel") and Global.startFree:
		count += 1 
		get_node("VolSlider").grab_focus()
		visible = true
		get_tree().paused = true
		
		if get_tree().current_scene.name == "titlescreen":
			get_parent().get_node("Buttons/start").grab_focus()
		
		if visible == true and count == 2:
			count = 0
			visible = false
			get_tree().paused = false


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


func _on_option_music_item_selected(index):
	Songs.musicNum = optionMusic.get_selected_id()
	Songs.playMusic()
