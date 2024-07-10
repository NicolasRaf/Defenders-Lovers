extends Area2D


func _on_body_entered(body):
	print("oi")
	if body is Player:
		pass
		#body.queue_free()
		
	if body is Bullet:
		get_parent().queue_free()
