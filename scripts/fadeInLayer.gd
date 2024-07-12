extends CanvasLayer

## PackedScene destino da transição
var destinyScene: PackedScene 
var nextSceneString : String = ""
var progress: float = 0.0
@onready var colorRect : ColorRect = $ColorRect

func _process(delta):
	progress = move_toward(progress, 1.0, 0.025) 
	colorRect.color.a = progress # Faz o efeito de fade com a alteração do alpha
	
	if progress >= 1.0: # Verifica se o fadeIn ja terminou
		if destinyScene != null: # Varificação para caso de erros no caminho destino
			print("Mudando para a cena: ", destinyScene)
			get_tree().change_scene_to_packed(destinyScene) # Troca de cena com base na cena destino definida pela global
		else:
			print("Erro: destinyScene está null")
		queue_free()
