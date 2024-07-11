extends CanvasLayer;

@onready var startButton : Button = get_node("Buttons/start");
@onready var options = $Options

# Called when the node enters the scene tree for the first time.
func _ready():
	startButton.grab_focus();
	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn");
	
func _on_exit_pressed():
	get_tree().quit();

func _on_options_pressed():
	options.visible = true
	options.fullscreenButton.grab_focus()
