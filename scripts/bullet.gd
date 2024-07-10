extends CharacterBody2D
var speed : int = 30

func _process(delta) -> void:
	var colissionInfo = move_and_collide(velocity.normalized() * delta * speed)
