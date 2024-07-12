extends Node2D

#Carregando inimigo no cenario
var enemy0 = preload("res://scenes/enemy.tscn");
var enemy1 = preload("res://scenes/enemy2.tscn");
var enemy2 = preload("res://scenes/enemy3.tscn");
var enemy3 = preload("res://scenes/enemy4.tscn");

func spawner():
	var _keys_array : Array = Global.propriety_enemy.keys()
	var _index = randi_range(0, _keys_array.size() - 1);
	Global.speedEnemy = Global.propriety_enemy.get(_keys_array[_index]).get("speed");
	Global.damageEnem = Global.propriety_enemy.get(_keys_array[_index]).get("damage");
	var enemies: Array = [enemy0, enemy1, enemy2, enemy3];
	var _randInd = randi_range(0, len(enemies) - 1);
	var enemy = enemies[_randInd];
	var enemy_instance = enemy.instantiate();
	enemy_instance.position = Vector2(randi_range(0,10),randi_range(0,500))
	add_child(enemy_instance)
	
	# Quando o contador de segundos atingir 29:
	if Global.time.seconds == 29:
		# Spawnar uma sequencia de inimigos
		$Timer.wait_time = 0.1
		await get_tree().create_timer(2).timeout
		# Voltar ao intervalo normal
		$Timer.wait_time = 5

	if Global.time.seconds == 59:
		$Timer.wait_time -= 0.5

func _ready():
	$Timer.start()

## Ao esgotar o tempo, spawn inimigo
func _on_timer_timeout():
	spawner()
