extends Area2D

@onready var lifebar : TextureProgressBar = get_node("Lifebar")
var damageTaken : int = 10

func _process(delta) -> void:
	Global.lifeCastle = lifebar.value

func _ready():
	Global.CastleReference = self

func _on_body_entered(body):
	if body is Enemy:
		Songs.playHit()
		body.queue_free()
		takeDamage()

func takeDamage() -> void:
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(lifebar,"value",lifebar.value - damageTaken,0.5)
