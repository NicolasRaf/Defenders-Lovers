extends CanvasLayer

var progress: float = 1.0
@onready var colorRect: ColorRect = get_node("ColorRect") 
@onready var startButton = $"../Buttons/start"

func  _ready():
	visible = true # Garantia para que o fadeOut ocorra

func _process(delta):
	progress = move_toward(progress, 0.0, 0.025)
	colorRect.color.a = progress # Faz o efeito de fade com a alteração do valor alpha
	
	if progress <= 0.0: #Verifica se terminou o fadeOut
		queue_free() # Elimina a cena de FadeOut

