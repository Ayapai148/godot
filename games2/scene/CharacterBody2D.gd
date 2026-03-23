extends CharacterBody2D


const SPEED = 100.0
@onready var anima:AnimationPlayer = $AnimationPlayer

func _process(delta):
	var direction = Input.get_vector("up", "down","right","left")
	velocity = direction * SPEED
	if Input.is_action_just_pressed('down'):
		anima.play("left")
	elif Input.is_action_just_pressed('left'):
		anima.play('up')
	elif Input.is_action_just_pressed('right'):
		anima.play("down")
	elif Input.is_action_just_pressed('up'):
		anima.play("right")
	
	move_and_slide()
