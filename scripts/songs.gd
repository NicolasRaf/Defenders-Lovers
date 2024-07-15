extends Node

@onready var hitplay = $hitplay
@onready var musicPlayer : AudioStreamPlayer2D = $BackMusic
var musicNum : int = 1 # Índice referente a cada musica da playlist

# Banco de dados das musicas(Playlist)
var musicDatabase : Dictionary = {
1: preload("res://assets/song/BackMusic 2 (256).mp3"),
2: preload("res://assets/song/BackMusic 8 Bit Universe (256).mp3"),
3: preload("res://assets/song/Just the Two of Us (8-Bit Bill Withers & Grover Washington Jr. Emulation) (256).mp3"),
4: preload("res://assets/song/I Was Made For Lovin You (2023) [8 Bit Tribute to Kiss] - 8 Bit Universe (256).mp3"),
5: preload("res://assets/song/Daddy! Daddy! Do! [8-bit; VRC6].mp3")
}

# Inicia a musica de fundo com o indice inicial
func _ready():
	musicPlayer.stream = musicDatabase.get(musicNum) # Seleciona a musica da playlist com base no índice
	playMusic()
	print(musicPlayer.stream)

# Função de controle e legibilidade para o play da musica atual
func playMusic() -> void:
	musicPlayer.stream = musicDatabase.get(musicNum)
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
	
func playShot() -> void:
	$shot.play()
