extends AnimatableBody2D

@onready var Main = $/root/Main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("moving_platforms")
	Main.reset_animation.connect(_on_reset_animation)


func _on_reset_animation():
	$AnimationPlayer.stop()
	$AnimationPlayer.play("move")
