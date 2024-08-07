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
		Global.startFree = false
		resetButton.grab_focus()
		_pause = false
		get_tree().paused = true
	
	
	timeLabel.add_theme_color_override("font_color",Color(0,0,255,1))
	killLabel.add_theme_color_override("font_color",Color(255,0,0,1))
	killLabel.text = "KILLS: " + str(Global.enemiesKilled)
	timeLabel.text = "TIME SURVIVOR: " + str(Global.time.clockLabel.text)
	


func _on_reset_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
