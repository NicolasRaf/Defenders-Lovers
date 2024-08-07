extends CanvasLayer

@onready var timer : Timer = get_node("Timer");
@onready var clockLabel : Label = get_node("Clock")

var minutes : int = 0
var seconds : int = 0

func _ready():
	Global.time = self;

func _process(delta):
	if seconds > 59:
		updateClock()
	
	updateMessage()

func _on_timer_timeout():
	seconds += 1;


func updateClock() -> void:
		if seconds > 59:
			seconds = 0;
			minutes += 1;
			
func updateMessage() -> void:
	clockLabel.text = str(minutes) + ":" + str(seconds) if seconds > 9 else str(minutes) + ":0" + str(seconds)
	
func start() -> void:
	timer.start()
