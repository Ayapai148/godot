extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 100
var money = 0

@onready var anim = $AnimatedSprite2D



func _physics_process(delta):
	
	
	
	Global.pers_pos = position
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("прыжок")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("бег")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("пассив")
		
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false
	
	if velocity.y > 0:
		anim.play("падение")
	
	if health <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://level_1.tscn")
	
		
	move_and_slide()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")
