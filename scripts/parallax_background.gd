extends ParallaxBackground

var SPEED = -100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"004".motion_offset.x += SPEED * delta * 1
	$"003".motion_offset.x += SPEED * delta * 0.05
	$"002".motion_offset.x += SPEED * delta * 0.1
	$"001".motion_offset.x += SPEED * delta * 1
	$"000".motion_offset.x += SPEED * delta * 0.2
