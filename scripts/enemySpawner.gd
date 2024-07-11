extends Node2D

#Carregando inimigo no cenario
var enemy0 = preload("res://scenes/enemy.tscn")
var enemy1 = preload("res://scenes/enemy2.tscn")

func spawner():
	
	var enemys: Array = [enemy0,enemy1]
	var enemy = enemys[randi_range(0,1)]
	var enemy_instance = enemy.instantiate();
	enemy_instance.position = Vector2(randi_range(0,10),randi_range(0,500))
	add_child(enemy_instance)
	
	print("",Global.time.seconds)
	if Global.time.seconds == 29:
		$Timer.wait_time = 0.1
		await get_tree().create_timer(2).timeout
		$Timer.wait_time = 5

func _ready():
	$Timer.start()

func _on_timer_timeout():
	spawner()
