extends CharacterBody2D
const speed : int = 300
var friction: float = 0.2
var acceleration: float = 0.2
var health : int = 5


func _physics_process(delta) -> void:
	_move()
	move_and_slide()
	

func _move():

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
	
	
