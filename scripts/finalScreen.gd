extends Control

@onready var killLabel : Label = get_node("ColorRect/Kill")
@onready var timeLabel : Label= get_node("ColorRect/time")
@onready var resetButton : Button = get_node("ColorRect/Reset")
var progress : float = 0.0
var fade : PackedScene = preload("res://scenes/fadeInLayer.tscn")


func _process(delta):
	var _pause = false
	
	if Global.lifeCastle <= 0 and position.y > 16.5:
		var _sp = abs(position.y - 16) / 10;
		position.y = move_toward(position.y,-16,_sp)
		$"../Stopwatch".visible = false
		_pause = true 
	
	if _pause:
		resetButton.grab_focus()
		_pause = false
		get_tree().paused = true
		
	killLabel.text = "KILLS: " + str(Global.enemiesKilled)
	timeLabel.text = "TIME SURVIVOR: " + Global.textTime
	


func _on_reset_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
