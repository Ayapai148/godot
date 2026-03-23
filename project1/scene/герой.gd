class_name Player extends CharacterBody2D


@export var SPEED = 100
@onready var anima2 = $AnimationPlayer
@onready var anim = $AnimatedSprite2D
@onready var walking = $AudioStreamPlayer
@onready var light2d = $PointLight2D



func get_input():
	var input_direction = Input.get_vector("Влево", "Вправо", "Вверх", "Вниз")
	velocity = input_direction * SPEED
	if velocity.x > 0:
		anima2.play("right")
	elif velocity.x < 0:
		anima2.play("left")
	elif velocity.y > 0:
		anima2.play("down")
	elif velocity.y < 0:
		anima2.play("up")
	else:
		anima2.play("idle")
		
	
		

func _ready():
	pass

func player():
	pass  

	
func _physics_process(delta):
	

	get_input()
	move_and_slide()
