extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var _tween = get_tree().create_tween()
	_tween.tween_property($CanvasLayer/Message,"position",Vector2(300,339),3).set_trans(Tween.TRANS_ELASTIC)
	_tween.tween_property($CanvasLayer/Message,"position",Vector2(300,741),3).set_trans(Tween.TRANS_ELASTIC)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child_count() == 1:
		queue_free()
