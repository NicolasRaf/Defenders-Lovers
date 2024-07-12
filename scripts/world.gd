extends Node2D

@onready var options = $Options

	

func _process(delta):
	if Global.lifeCastle <= 0:
		$Stopwatch.visible = false
	else:
		$Stopwatch.visible = true
		
	if Input.is_action_pressed("ui_cancel"):
		options.get_node("VolSlider").grab_focus()
		options.visible = true
		get_tree().paused = true
	
