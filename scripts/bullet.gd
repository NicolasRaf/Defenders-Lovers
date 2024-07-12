extends CharacterBody2D
class_name Bullet

var speed : int = 350

func _ready() -> void:
	_die()

func _process(delta) -> void:
	var colissionInfo = move_and_collide(velocity.normalized() * delta * speed)

func _die() -> void:
	var _tween = get_tree().create_tween()
	
	await _tween.tween_property(self,"modulate",Color(0,0,0,0),1).set_trans(Tween.TRANS_BOUNCE).finished
	queue_free()
