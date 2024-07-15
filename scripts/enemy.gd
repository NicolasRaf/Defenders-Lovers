extends CharacterBody2D
class_name Enemy

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var start = false
var direction
var damage 
var speed 

func _ready():
	speed = Global.speedEnemy if get_parent().name != "wave" else 0.35
	damage = Global.damageEnem if get_parent().name != "wave" else 10
	
func _process(delta):
	if get_parent().name == "wave" and not start:
		start = true
		var _tween = get_tree().create_tween()
		await _tween.tween_property(self,"modulate",Color(1,0,0,1),1)
		await _tween.tween_property(self,"modulate",Color(0,1,0,1),1)
		await _tween.tween_property(self,"modulate",Color(0,0,1,1),1).finished
		start = false
	
func _physics_process(delta):
	var direction = global_position.direction_to(Global.CastleReference.global_position)
	global_position += direction * speed;
	Global.CastleReference.damageTaken = damage;
	move_and_slide()
	
