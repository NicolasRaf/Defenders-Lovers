extends CanvasLayer

@onready var message = get_node("Message")
var seconds : int = 1

func _ready():
	visible = true

func _on_timer_timeout():
	seconds += 1
	
	if seconds >= 5 :
		message.text = "[wave][center]GO"
		await get_tree().create_timer(1).timeout
		Global.time.start()
		queue_free()
		Global.startFree = true
