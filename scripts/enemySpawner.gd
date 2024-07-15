extends Node2D

#Carregando inimigo no cenario
var enemy0 = preload("res://scenes/enemy.tscn");
var enemy1 = preload("res://scenes/enemy2.tscn");
var enemy2 = preload("res://scenes/enemy3.tscn");
var enemy3 = preload("res://scenes/enemy4.tscn");
var currentWaitTime : float = 5.0
var canDecress = true
var haveWave = false

func _process(delta):
	if Global.time.seconds == 58 and canDecress:
		timeDecress()
		
	$Timer.wait_time = currentWaitTime 

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

func _ready():
	$Timer.start()

## Ao esgotar o tempo, spawn inimigo
func _on_timer_timeout():
	spawner()
	
func wave() -> void:
	var wavePath = preload("res://scenes/wave.tscn")
	var wave = wavePath.instantiate()
	get_parent().get_parent().add_child(wave)
	
func timeDecress() -> void:
	canDecress = false
	currentWaitTime -= 0.5
	await get_tree().create_timer(1).timeout
	canDecress = true


func _on_wave_timer_timeout():
	if get_node(".").name == "EnemySpawner" and get_parent().get_parent().get_node("wave") == null:
		wave()
