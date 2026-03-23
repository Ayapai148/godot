extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.col >= 1:
		play('anima')
