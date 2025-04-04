extends Area2D

var ACTIVE = false
var PASSED = false

func _ready() -> void:
	add_to_group("lantern")


func _on_body_entered(_body: Node2D) -> void:
	if not ACTIVE and not PASSED:
		$AnimatedSprite2D.play("glow")
		ACTIVE = true
		PASSED = true
		$CPUParticles2D.restart()
		$CPUParticles2D.visible = true
		
		get_tree().call_group("lantern", "turn_light_off", self)


func turn_light_off(lantern_caller) -> void:
	if ACTIVE and PASSED and lantern_caller != self:
		$AnimatedSprite2D.play_backwards("glow")
		ACTIVE = false
