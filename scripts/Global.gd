extends Node2D

@onready var audioStream : AudioStreamPlayer2D= get_node("AudioStreamPlayer2D")

var Player = null;
var CastleReference = null;
var time = null;
var enemiesKilled : int = 0
var lifeCastle : float = 100
var textTime : String = ""

# variável de speed do inimigo
var speedEnemy = 0.0;
# variável de danage do inimigo
var damageEnem = 0.0;

#Dicionario de propriedades de inimigos 
var propriety_enemy = {
	
	"enemy0" : {
		"damage" : 10,
		"speed" : 1.0
	},
	"enemy1" : {
		"damage" : 20,
		"speed" : 0.5
	},
	"enemy2" : {
		"damage" : 15,
		"speed" : 2.0
	},
	"enemy3" : {
		"damage" : 5,
		"speed" : 0.5
	}
}
