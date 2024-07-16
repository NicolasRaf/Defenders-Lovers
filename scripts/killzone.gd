extends Area2D

@onready var animated_sprite_2d = $"../AnimatedSprite2D"

func _ready():
	Global.death = self;

func _on_body_entered(body):
	if body is Player:
		pass
		#body.queue_free()
		
	if body is Bullet:
		Songs.playHit()
		if get_parent().direction.x > 0:
			animated_sprite_2d.stop()
			animated_sprite_2d.play("death_right");
		if get_parent().direction.x < 0:
			animated_sprite_2d.stop()
			animated_sprite_2d.play("death_right");
		get_parent().speed = 0
		collision_mask = 9
		get_parent().collision_layer = 9
		body.queue_free()
		await animated_sprite_2d.animation_finished
		get_parent().queue_free()
		Global.enemiesKilled += 1
