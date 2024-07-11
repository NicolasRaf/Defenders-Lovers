extends Node2D

#Carregando inimigo no cenario
var enemy = preload("res://scenes/enemy.tscn")

func spawner():
	var enemy_instance = enemy.instantiate();
	enemy_instance.position = Vector2(randi_range(0,10),randi_range(0,500))
	add_child(enemy_instance)

func _ready():
	$Timer.start()

func _on_timer_timeout():
	spawner()
