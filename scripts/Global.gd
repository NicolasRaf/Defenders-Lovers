extends Node2D

@onready var audioStream : AudioStreamPlayer2D= get_node("AudioStreamPlayer2D")

var Player = null;
var CastleReference = null;
var time = null;
var enemiesKilled : int = 0
var lifeCastle : float = 100
var textTime : String = ""
