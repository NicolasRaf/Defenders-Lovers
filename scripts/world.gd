extends Node2D

@onready var options = $Options

func _ready():
	Global.startFree = false
	Global.enemiesKilled = 0
