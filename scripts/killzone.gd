extends Area2D


func _on_body_entered(body):
	if body is Player:
		pass
		#body.queue_free()
		
	if body is Bullet:
		get_parent().queue_free()
		body.queue_free()
		Global.enemiesKilled += 1
