extends CanvasLayer;

@onready var startButton : Button = get_node("Buttons/start");
@onready var options = $Options
var fade : PackedScene = preload("res://scenes/fadeInLayer.tscn")
var canGrab : bool = true

func _ready():
	print("ready menu")
	startButton.grab_focus()

func _on_start_pressed():
	var fadeScene = fade.instantiate()
	fadeScene.destinyScene = preload("res://scenes/world.tscn")
	add_child(fadeScene)
	
func _on_exit_pressed():
	get_tree().quit();

func _on_options_pressed():
	var optionsScene = preload("res://scenes/options.tscn").instantiate()
	add_child(optionsScene)
