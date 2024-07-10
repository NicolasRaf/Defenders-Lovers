extends CharacterBody2D
class_name Bullet

var speed : int = 350

func _ready() -> void:
	_die()

func _process(delta) -> void:
	var colissionInfo = move_and_collide(velocity.normalized() * delta * speed)

func _die() -> void:
	await get_tree().create_timer(1).timeout
	queue_free()
