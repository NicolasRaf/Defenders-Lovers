extends Node2D

@onready var options = $Options

func _ready():
	Global.enemiesKilled = 0

func _process(delta):
	if Input.is_action_pressed("ui_cancel") and get_node("TimeStart") == null:
		options.get_node("VolSlider").grab_focus()
		options.visible = true
		get_tree().paused = true
	
