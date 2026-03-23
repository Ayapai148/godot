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
var random = RandomNumberGenerator.new()

func _ready():
	dialog.visible = false
	random.randomize()
	timercar.start()
	attenuation.play("attenuation")
	time.start()
	$time.visible = false
	$Timerdialog.start()



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
	dialog.visible = true
	

	
