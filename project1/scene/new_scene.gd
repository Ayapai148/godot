extends Node2D
@onready var timercar = $car/Timercar
@onready var timerfon = $Timerfon
@onready var timer = $Timergroza
@onready var anima = $car/AnimationPlayer
@onready var animacar = $AnimationPlayer2
@onready var attenuation = $Attenuation
@onready var number = $number
@onready var time = $Timertime
@onready var dialog = $dialog
@onready var timerdialog_scene2: Timer = $timerDialoges/Timerdialog_scene2
var random = RandomNumberGenerator.new()
@onready var dialog_1 = $Camera2D/dialogues
@onready var timer_girl: Timer = $animation_girl/timer_girl
@onready var anima_girl: AnimationPlayer = $animation_girl/anima_girl
@onready var girl: AnimatedSprite2D = $animation_girl/ghost_girl
@onready var timer_anima_girl: Timer = $animation_girl/timer_anima
@onready var anima_car: AnimatedSprite2D = $car/Node2D/AnimatedSprite2D



func _ready():
	random.randomize()
	timercar.start()
	attenuation.play("attenuation")
	time.start()
	$time.visible = false
	$timerDialoges/Timerdialog_scene1.start()
	$time/PointLight2D.visible = false
	$"Sprite-0001".visible = false
	girl.visible = false
	
	
	

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	anima.play("molnia")
	timer.wait_time = random.randi_range(10, 25)
	
func _on_timercar_timeout():
	animacar.play("new_animation")
	
func _on_timerfon_timeout():
	animacar.play("goy")

func _on_timertime_timeout():
	$time.modulate = 0
	$time.visible = true
	number.play("time")
	
func _on_timerdialog_timeout():
	var dialog2 = preload("res://dialogue/dialogues.tscn")
	var node = dialog2.instantiate()
	add_child(node)

	
		
func check_anima_girl():
	pass

func _on_timerdialog_scene_2_timeout():
	pass


func _on_timer_girl_timeout():
	timerdialog_scene2.start()
	girl.visible = true
	anima_girl.play("new_animation")
	check_anima_girl()
	

func _on_timer_anima_timeout():
	if G.dialog_close == true:
		timer_girl.start()
		timer_girl.one_shot = true
		timer_anima_girl.stop()
		timerfon.one_shot = true
		
		

func _on_timer_sss_timeout():
	pass
	anima_car.play("car_stop")
	animacar.pause()
	

	
