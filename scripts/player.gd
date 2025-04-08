extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -600.0 * 1.5
var DOUBLE_JUMP = 2
signal player_killed

@onready var tilemaplayer = $"../TileMapLayer"

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		var x = direction * SPEED
		velocity.x = move_toward(0, x, SPEED)
		if direction < 0:
			$AnimatedSprite2D.play("left")
		else:
			$AnimatedSprite2D.play("right")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")

	if not is_on_floor():
		velocity += get_gravity() * delta * 3
	elif velocity.y >= 0:
		DOUBLE_JUMP = 2
		modulate = Color(1, 1, 1, 1)
	
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_up"):
		if DOUBLE_JUMP > 0:
			$AudioStreamPlayer2D.play()
			velocity.y = JUMP_VELOCITY
			DOUBLE_JUMP -= 1
			if DOUBLE_JUMP:
				modulate = Color(0.75, 0.75, 0.75, 1)
			if not DOUBLE_JUMP:
				modulate = Color(0.5, 0.5, 0.5, 1)
		else:
			$AudioStreamPlayer2D2.play()

var elapse = 0
func _process(_delta: float) -> void:
	if elapse == 20:
		elapse = 0
		if $AnimatedSprite2D.scale.y == 0.625:
			$AnimatedSprite2D.scale.y = 0.6
			$AnimatedSprite2D.position.y += 1
		else:
			$AnimatedSprite2D.scale.y = 0.625
			$AnimatedSprite2D.position.y -= 1
	else:
		elapse += 1
		
	var tile_pos = tilemaplayer.local_to_map(position)
	var tile = tilemaplayer.get_cell_tile_data(tile_pos)
	if tile and tile.get_custom_data("killbox"):
		player_killed.emit()


	move_and_slide()


func _on_evil_body_entered(body: Node2D) -> void:
	player_killed.emit()
