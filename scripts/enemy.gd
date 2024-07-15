extends CharacterBody2D
class_name Enemy

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction
var damage 
var speed 

func _ready():
	speed = Global.speedEnemy;
	damage = Global.damageEnem;
	
func _physics_process(delta):
	var direction = global_position.direction_to(Global.CastleReference.global_position)
	global_position += direction * speed;
	Global.CastleReference.damageTaken = damage;
	move_and_slide()
