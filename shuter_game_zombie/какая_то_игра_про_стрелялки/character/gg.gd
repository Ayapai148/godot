extends CharacterBody2D

var speed = 5000
@onready var anima: AnimatedSprite2D = $AnimatedSprite2D
@onready var animaplayer: AnimationPlayer = $player_anim
@export var bullet: PackedScene
@onready var timer_gun: Timer = $Timer_gun
@onready var count_anima: AnimationPlayer = $count_anim
@onready var jerk: TextureProgressBar = $jerk
@onready var anim_fatigue:AnimationPlayer = $anim_fatigue
@onready var heath: TextureProgressBar = $heath
@onready var anima_heath: AnimationPlayer = $heath/anim_heath

func _ready():
	anima_heath.play('anim_heath')
	up_jeck()
	check_jerk()
func _process(delta):
	jerk.value = Global.jerk_player
	heath.value = Global.heath_player
	Global.pos_pers = position
	var pull = Input.is_action_just_pressed("mouse_left")
	if pull and not anima.flip_h == true:
		$metka/Metka.position.x = -18
		$metka/Metka.rotation = 0
		shoot()
		animaplayer.play("new")
	elif anima.flip_h == true:
		if pull:
			$metka/Metka.position.x = 18
			$metka/Metka.rotation = 3.14
			shoot()
			animaplayer.play("new_2")
			
	var direction = Input.get_axis("right", "left")
	if direction:
		velocity.x = direction*speed*delta
		if velocity.x < 0:
			anima.play("walking")
		if velocity.x > 0:
			anima.flip_h = true
			anima.play("walking")
		else:
			anima.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if velocity.x == 0:
			anima.play("idle")
	move_and_slide()
	if Global.kill_true == true:
		count_anima.play('anima')
		Global.kill_true = false

	if Input.is_action_just_pressed('the_jerk'):
		if Global.jerk_player >= 20:
			speed = 30000
			await get_tree().create_timer(0.1).timeout
			speed = 5000
		Global.jerk_player -= 40
		
		if Global.jerk_player <= 10:
			anim_fatigue.play("new_animation")
			speed = 0
			await get_tree().create_timer(2.5).timeout
			speed = 5000
			anim_fatigue.stop()
		if Global.jerk_player <= 0:
			Global.jerk_player = 5
		print(Global.jerk_player)

func shoot():
	var b = bullet.instantiate()
	add_child(b)
	b.transform = $metka/Metka.transform
func up_jeck():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
func _on_timer_timeout():
	Global.jerk_player += 10
func check_jerk():
	while true:
		await get_tree().create_timer(0.2).timeout
		if Global.jerk_player > 100:
			Global.jerk_player = 100


		
