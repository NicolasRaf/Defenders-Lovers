extends Node2D

@onready var skullLabel = $ColorRect/Skull/SkullLabel
@onready var timeLabel = $ColorRect/Time/TimeLabel
@onready var mediumHpTimer = $MediumHP
@onready var finalHpTimer = $FinalHP
@onready var healingBar = $ProgressBar

var towerLevel : int = 0
var deathsRequired : int = 0
var timeNeeded : String = ""
var canShot : bool = false
var canHealing : bool = false
var shotSpeed : int = 250
var bulletPath : PackedScene =  preload("res://scenes/bullet.tscn")

func _process(delta):
	if get_node(".").name == "Tower":
		$ColorRect/Skull.visible = true
		buildTower1()
				
	if get_node(".").name == "Tower2":
		$ColorRect/Skull.visible = true
		buildTower2()
	
	if get_node(".").name == "HpTower":
		$ColorRect/Time.visible = true
		buildHpTower1()
	
	if get_node(".").name == "HpTower2":
		$ColorRect/Time.visible = true
		buildHpTower2()
		
	
func buildTower1() -> void:
	if towerLevel == 0:
			deathsRequired = 75
			skullLabel.text = str(Global.enemiesKilled) + "/" + str(deathsRequired) 
			skullLabel.modulate = Color(255,0,0,255)
			if Global.enemiesKilled == deathsRequired:
				towerLevel = 1
				$Effects.play("smoke")
				await get_tree().create_timer(0.3169).timeout
				$brokenTower.visible = false
				$MediumTower.visible = true
				
	if towerLevel == 1:
		canShot = true
		shotSpeed = 250
		deathsRequired = 200
		skullLabel.text = str(Global.enemiesKilled) + "/" + str(deathsRequired)
		skullLabel.modulate = Color(255,0,0,255)
		if Global.enemiesKilled == deathsRequired:
			towerLevel = 2
			skullLabel.modulate = Color(0,255,0,255)
			$Effects.play("smoke")
			await get_tree().create_timer(0.3169).timeout
			$MediumTower.visible = false
			$FinalTower.visible = true
				
		if towerLevel == 2:
			shotSpeed = 450
			
func buildTower2() -> void:
	
	if towerLevel == 0:
		deathsRequired = 300
		skullLabel.text = str(Global.enemiesKilled) + "/" + str(deathsRequired) 
		skullLabel.modulate = Color(255,0,0,255)
		if Global.enemiesKilled == deathsRequired:
			towerLevel = 1
			$Effects.play("smoke")
			await get_tree().create_timer(0.3169).timeout
			$brokenTower.visible = false
			$MediumTower.visible = true
				
		if towerLevel == 1:
			canShot = true
			shotSpeed = 250
			deathsRequired = 400
			skullLabel.text = str(Global.enemiesKilled) + "/" + str(deathsRequired)
			skullLabel.modulate = Color(255,0,0,255)
			if Global.enemiesKilled == deathsRequired:
				towerLevel = 2
				skullLabel.modulate = Color(0,255,0,255)
				$Effects.play("smoke")
				await get_tree().create_timer(0.3169).timeout
				$MediumTower.visible = false
				$FinalTower.visible = true
				
		if towerLevel == 2:
			shotSpeed = 450

func buildHpTower1() -> void:
	if towerLevel == 0:
			timeNeeded = "1:30"
			timeLabel.text = timeNeeded
			timeLabel.modulate = Color(255,0,0,255)
			if Global.time.clockLabel.text == timeNeeded:
				towerLevel = 1
				healingBar.visible = true
				mediumHpTimer.start()
				$Effects.play("smoke")
				await get_tree().create_timer(0.3169).timeout
				$brokenTower.visible = false
				$HpTowerMedium.visible = true
				
	if towerLevel == 1:
		timeNeeded = "3:30"
		timeLabel.text = timeNeeded
		timeLabel.modulate = Color(255,0,0,255)
		healingBar.value = mediumHpTimer.time_left * -1
		if Global.time.clockLabel.text == timeNeeded:
			towerLevel = 2
			mediumHpTimer.stop()
			finalHpTimer.start()
			healingBar.min_value = -20
			timeLabel.modulate = Color(0,255,0,255)
			$Effects.play("smoke")
			await get_tree().create_timer(0.3169).timeout
			$HpTowerMedium.visible = false
			$HpTowerFinal.visible = true
			
	if towerLevel == 2:
		healingBar.value = finalHpTimer.time_left * -1
			
func buildHpTower2() -> void:
	if towerLevel == 0:
			timeNeeded = "4:30"
			timeLabel.text = timeNeeded
			timeLabel.modulate = Color(255,0,0,255)
			if Global.time.clockLabel.text == timeNeeded:
				towerLevel = 1
				healingBar.visible = true
				mediumHpTimer.start()
				$Effects.play("smoke")
				await get_tree().create_timer(0.3169).timeout
				$brokenTower.visible = false
				$HpTowerMedium.visible = true
				
	if towerLevel == 1:
		timeNeeded = "6:00"
		timeLabel.text = timeNeeded
		timeLabel.modulate = Color(255,0,0,255)
		healingBar.value = mediumHpTimer.time_left * -1
		if Global.time.clockLabel.text == timeNeeded:
			towerLevel = 2
			mediumHpTimer.stop()
			finalHpTimer.start()
			healingBar.min_value = -20
			timeLabel.modulate = Color(0,255,0,255)
			$Effects.play("smoke")
			await get_tree().create_timer(0.3169).timeout
			$HpTowerMedium.visible = false
			$HpTowerFinal.visible = true
				
	if towerLevel == 2:
		healingBar.value = finalHpTimer.time_left * -1

			

func rangeEntered(body):
	if canShot:
		Songs.playShot()
		var _bullet = bulletPath.instantiate()
		get_parent().add_child(_bullet)
		_bullet.position = position
		_bullet.velocity = body.global_position - _bullet.position
		_bullet.speed = shotSpeed
		_bullet.get_node("Sprite2D").visible = false
		_bullet.get_node("Bullet").visible = true
	
func onMouseEntered():
	$ColorRect.modulate = Color(1,1,1,1)


func onMouseExited():
	$ColorRect.modulate.a = 0


func mediumHpTimeout():
	Global.CastleReference.lifebar.value += 10
	$Effects.play("healing")
	mediumHpTimer.start()


func finalHpTimeout():
	Global.CastleReference.lifebar.value += 15
	$Effects.play("healing")
	finalHpTimer.start()
