extends Camera2D

@onready var player = $".."
@onready var text = $"../../Text/RichTextLabel35"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(true)
	position_smoothing_speed = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(float) -> void:
	if player.global_position.x >= 22200:
		global_position = Vector2(23460, -32000)
		anchor_mode = 1
		position_smoothing_speed = false
		text.visible = true
	else:
		global_position.x = player.global_position.x - 960
		global_position.y = player.global_position.y- 540
		text.visible = false
		position_smoothing_enabled = true
		anchor_mode = 0
		

func _on_menu_game_start() -> void:
	await get_tree().create_timer(1.9).timeout
	position_smoothing_speed = 1
