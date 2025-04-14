extends Node

signal reset_animation
signal player_reset

@onready var player = $Player
@onready var lantern_group = get_tree().get_nodes_in_group("lantern")
@onready var killzone_group = get_tree().get_nodes_in_group("killzone")
@onready var orb_group = get_tree().get_nodes_in_group("orb")
@onready var evil = $Evil
@onready var menu = $Menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TileMapLayer.visible = false
	for killzone in killzone_group:
		killzone.player_killed.connect(player_killed)
		
	player.player_killed.connect(player_killed)
	player_reset.connect(player_killed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_end"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("reset"):
		player_reset.emit()
		
func player_killed():
	if player:
		for lantern in lantern_group:
			if lantern.ACTIVE:
				player.global_position = lantern.global_position
				break
		reset_animation.emit()
		

		


func _on_menu_game_start() -> void:
	$TileMapLayer.visible = true
