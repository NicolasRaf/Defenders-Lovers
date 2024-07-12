extends Node2D

#Carregando inimigo no cenario
var enemy0 = preload("res://scenes/enemy.tscn");
var enemy1 = preload("res://scenes/enemy2.tscn");
var enemy2 = preload("res://scenes/enemy3.tscn");
var enemy3 = preload("res://scenes/enemy4.tscn");
var currentWaitTime : float = 5.0
var canDecress = true

func _process(delta):
	# Quando o contador de segundos atingir 29:
	if Global.time.seconds == 29:
		# Spawnar uma sequencia de inimigos
		wave()

	if Global.time.seconds == 58 and canDecress:
		timeDecress()
		
	$Timer.wait_time = currentWaitTime 

func spawner():
	var enemies: Array = [enemy0, enemy1, enemy2, enemy3];
	var _randInd = randi_range(0, len(enemies) - 1);
	var enemy = enemies[_randInd];
	var enemy_instance = enemy.instantiate();
	enemy_instance.position = Vector2(randi_range(0,10),randi_range(0,500))
	add_child(enemy_instance)

func _ready():
	$Timer.start()

## Ao esgotar o tempo, spawn inimigo
func _on_timer_timeout():
	spawner()
	
func wave() -> void:
	$Timer.wait_time = 0.1
	await get_tree().create_timer(5).timeout
	# Voltar ao intervalo normal
	$Timer.wait_time = currentWaitTime
	
func timeDecress() -> void:
	canDecress = false
	currentWaitTime -= 0.5
	await get_tree().create_timer(1).timeout
	canDecress = true
