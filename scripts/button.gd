extends Button


func _on_mouse_entered() -> void:
	self_modulate = Color(0.75, 0.75, 0.75, 1)
	

func _on_mouse_exited() -> void:
	self_modulate = Color(1, 1, 1, 1)
