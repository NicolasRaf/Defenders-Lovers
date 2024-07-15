extends CharacterBody2D
class_name Player

const speed : int = 300
var friction: float = 0.2
var acceleration: float = 0.2
var health : int = 5
var bulletPath : PackedScene =  preload("res://scenes/bullet.tscn")
var canShot = true

func _ready():
	Global.Player = self;

func _physics_process(delta) -> void:
	if Global.startFree:
		$Node2D.look_at(get_global_mouse_position())
		if Input.is_action_pressed("shot") and canShot:
			_shot()
		
		_move()
		move_and_slide()
	

func _move() -> void:

	## Recebe o input do player e da um valor positivo ou negativo para direção
	var _direction : Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up","move_down")
		)
		
	if _direction != Vector2.ZERO:
		velocity.x = lerp(velocity.x, _direction.normalized().x * speed, acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * speed, acceleration)
		return
		
	
	velocity.x = lerp(velocity.x, _direction.normalized().x * speed, friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * speed, friction)
	
	velocity = _direction.normalized() * speed 
	
func _shot() -> void:
	
	Songs.playShot()
	var _bullet = bulletPath.instantiate()
	
	get_parent().add_child(_bullet)
	_bullet.position = $Node2D/Crosshair.global_position 
	_bullet.velocity = get_global_mouse_position() - _bullet.position
	canShot = false
	await get_tree().create_timer(0.5).timeout
	canShot = true

