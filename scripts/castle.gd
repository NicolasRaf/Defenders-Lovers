extends Area2D

@onready var PosDaamge = get_node("PosDaamge")
@onready var lifebar : TextureProgressBar = get_node("Lifebar")
var damageTaken : int = 10


func _ready():
	Global.CastleReference = self

func _on_body_entered(body):
	if body is Enemy:
		body.queue_free()
		takeDamage()

func takeDamage() -> void:
	var tween : Tween = get_tree().create_tween()
	tween.tween_property(lifebar,"value",lifebar.value - damageTaken,0.5)
	tween.tween_property(PosDaamge,"size",Vector2(PosDaamge.size.x - 23, 14), 0.2)
	
