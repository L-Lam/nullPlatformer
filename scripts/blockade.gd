extends StaticBody2D

@onready var orb = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	orb.flip.connect(flip)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func flip():
	if modulate.a == 1:
		modulate.a = 0.65
		$CollisionShape2D.set_deferred("disabled", true)
	else:
		modulate.a = 1
		$CollisionShape2D.set_deferred("disabled", false)
