extends CharacterBody2D

const SPEED = 1.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var direction = global_position.direction_to(Global.Player.global_position)
	global_position += direction * SPEED

	move_and_slide()
