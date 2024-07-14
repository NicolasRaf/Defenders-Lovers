extends Node2D

var bulletPath : PackedScene =  preload("res://scenes/bullet.tscn")

func rangeEntered(body):
	
	Songs.playShot()
	var _bullet = bulletPath.instantiate()
	get_parent().add_child(_bullet)
	_bullet.position = position
	_bullet.velocity = body.global_position - _bullet.position
	_bullet.speed = 350
	_bullet.get_node("Sprite2D").visible = false
	_bullet.get_node("Bullet").visible = true
	
