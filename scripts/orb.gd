extends Area2D

signal flip
@onready var player = $"../../Player"
@onready var main = $"../.."
var flipped = false

func _ready() -> void:
	main.reset_animation.connect(player_killed)
	_reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Sprite2D.rotate(0.05)
	

func _on_body_entered(_body: Node2D) -> void:
	if not flipped:
		$Sprite2D.self_modulate.a -= 0.5
		$CPUParticles2D.visible = false
		$AudioStreamPlayer2D.play()
		flipped = true
		flip.emit()
		
func _reset():
	$Sprite2D.self_modulate.a = 1
	$CPUParticles2D.visible = true
	flipped = false
	
func player_killed():
	if flipped:
		flip.emit()
		_reset()
