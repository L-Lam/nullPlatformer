extends CanvasLayer

signal game_start

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	$ParallaxBackground.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_play_pressed() -> void:
	$Press.play()
	$Main/FadeIn.play("fade")
	await get_tree().create_timer(3.0).timeout
	game_start.emit()
	visible = false
	$ParallaxBackground.visible = false


func _on_back_pressed() -> void:
	$Press.play()
	$Main.visible = true
	$Credits.visible = false


func _on_credits_pressed() -> void:
	$Press.play()
	$Main.visible = false
	$Credits.visible = true
