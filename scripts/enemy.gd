extends CharacterBody2D
class_name Enemy

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var start = false
var direction
var damage 
var speed 

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	speed = Global.speedEnemy if get_parent().name != "wave" else 0.35
	damage = Global.damageEnem if get_parent().name != "wave" else 10
	Global.enemy = self;
	
func _process(delta):
	if get_parent().name == "wave" and not start:
		start = true
		var _tween = get_tree().create_tween()
		await _tween.tween_property(self,"modulate",Color(1,0,0,1),1)
		await _tween.tween_property(self,"modulate",Color(0,1,0,1),1)
		await _tween.tween_property(self,"modulate",Color(0,0,1,1),1).finished
		start = false
		

#Código responsável pela posição e propriedades dos enemies
func _physics_process(delta):
	#A variavel direction por pegar a localização de destino do enemies
	direction = global_position.direction_to(Global.CastleReference.global_position);
	#Opereração responsável por fazer os enemies ir até o alvo
	global_position += direction * speed;
	#É responsável por dizer a quantidade de dano que os enemies causam
	Global.CastleReference.damageTaken = damage;
	move_and_slide()
	
	#Função responsável pela direção do enemyies
	if direction.x > 0:
	#Quando o player nascer na direita
		animated_sprite_2d.flip_h = false
	else:
	#Quando o player nascer na esquerda
		animated_sprite_2d.flip_h = true
