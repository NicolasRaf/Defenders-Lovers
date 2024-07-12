extends Control

@onready var killLabel : Label = get_node("ColorRect/Kill")
@onready var timeLabel : Label= get_node("ColorRect/time")
@onready var resetButton : Button = get_node("ColorRect/Reset")
var progress : float = 0.0


func _process(delta):
	var _pause = false
	
	if Global.lifeCastle <= 0 and position.y > -16:
		position.y = move_toward(position.y,-16,8)
		resetButton.grab_focus()
		_pause = true
		
	if _pause and position.y <= -16 :
		get_tree().paused = true
		
	killLabel.text = "KILLS: " + str(Global.enemiesKilled)
	timeLabel.text = "TIME SURVIVOR: " + Global.textTime

func _on_reset_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
