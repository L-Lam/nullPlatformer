extends Area2D
signal player_killed

func _ready() -> void:
	add_to_group("killzone")
	
func _on_body_entered(_body: Node2D) -> void:
	player_killed.emit()
