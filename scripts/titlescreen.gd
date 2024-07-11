extends CanvasLayer;

@onready var startButton : Button = get_node("start");

# Called when the node enters the scene tree for the first time.
func _ready():
	startButton.grab_focus();
	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn");
	
func _on_exit_pressed():
	get_tree().quit();
