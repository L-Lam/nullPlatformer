extends Area2D

@onready var player = $"../Player"
@onready var killzone_group = get_tree().get_nodes_in_group("killzone")
@export var detection_range: float = 920.0
@export var speed: float = 400.0

func _ready():
	player.player_killed.connect(player_killed)
	for killzone in killzone_group:
		killzone.player_killed.connect(player_killed)
	
func _process(delta):
	if player and player.global_position.x < 22200:
		var distance_to_player = global_position.distance_to(player.global_position)
		
		if distance_to_player <= detection_range:
			var direction = (player.global_position - global_position).normalized()
			global_position += direction * speed * delta
	else:
		global_position = Vector2(15030, -31880)

func player_killed() -> void:
	global_position = Vector2(15030, -31880)
	$CPUParticles2D.restart()
