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
@onready var anima_cartridges: AnimationPlayer = $cartridges/anim_cartridges

func _ready():
	anima_heath.play('anim_heath')
	up_jeck()
	check_jerk()
	
func _process(delta):
	check_pos()
	position.x += -5
	if velocity.x < 0:
		anima.play("walking")
	check_anima_cartridges()
	heath.value = Global.heath_player
	Global.pos_pers = position
	var pull = Input.is_action_just_pressed("mouse_left")
	if Global.cartrisges > 0:
		if pull and not anima.flip_h == true:
			Global.cartrisges -= 1
			$metka/Metka.position.x = -18
			$metka/Metka.rotation = 0
			if Global.cartrisges < 0:
				Global.cartrisges = 0
		elif anima.flip_h == true:
			if pull:
				Global.cartrisges -= 1
				$metka/Metka.position.x = 18
				$metka/Metka.rotation = 3.14
				animaplayer.play("new_2")
				if Global.cartrisges < 0:
					Global.cartrisges = 0
	
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if velocity.x == 0:
			anima.play("idle")
	move_and_slide()
	if Global.kill_true == true:
		count_anima.play('anima')
		Global.kill_true = false
func check_pos():
	if position.x <= -1600:
		position.x = 1225

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
func check_anima_cartridges():
	if Global.player_cartridges_get == true:
		anima_cartridges.play("anima_cartridges")
		Global.player_cartridges_get = false
