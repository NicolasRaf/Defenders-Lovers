extends Node

@onready var hitplay = $hitplay
@onready var musicPlayer : AudioStreamPlayer2D = $AudioStreamPlayer2D
var musicNum : int = 1 # Índice referente a cada musica da playlist

# Banco de dados das musicas(Playlist)
var musicDatabase : Dictionary = {
1: preload("res://assets/song/BackMusic 2 (256).mp3"),
2:preload("res://assets/song/BackMusic 8 Bit Universe (256).mp3")
}

# Inicia a musica de fundo com o indice inicial
func _ready():
	musicPlayer.stream = musicDatabase.get(musicNum) # Seleciona a musica da playlist com base no índice
	playMusic()
	print(musicPlayer.stream)

# Função de controle e legibilidade para o play da musica atual
func playMusic() -> void:
	musicPlayer.play()
	

func _on_audio_stream_player_2d_finished() -> void:
		# Verifica se há proxima musica e itera o índice, caso não volta ao indice inicial
	if musicNum >= musicDatabase.size():
		musicNum = 1
	else:
		musicNum += 1
	
	# Atribuição do indice atual e inicio da musica selecionada
	musicPlayer.stream = musicDatabase.get(musicNum)
	playMusic()
	print(musicNum >= musicDatabase.size())
	
func playHit():
	hitplay.play()
