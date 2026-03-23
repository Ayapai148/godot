extends Area2D

@onready var anima = $AnimatedSprite2D
@onready var gui = $GUI
@onready var open = $sounds/open
@onready var close = $sounds/close
@onready var delay_timer = $Timer
var closing_animation_playing = false


func _ready():
	var player = $"."
	$Button.visible = false
	add_child($Button)
	$GUI.visible = false


	
	

func _on_button_pressed():
	open.play()
	anima.play("open")
	$Button.visible = false
	gui.visible = true

	

func _on_area_2d_body_entered(body):
	$Button.visible = true

func _on_area_2d_2_body_exited(body):
	close.play()
	$Button.visible = false
	gui.visible = false


	
func _on_area_2d_3_body_exited(body):
	if not closing_animation_playing:
		delay_timer.start(0.1)
		
func _on_timer_timeout():
	anima.play("closing")
	closing_animation_playing = false
	delay_timer.stop()	

func _on_animated_sprite_2d_animation_finished(animation_name: String):
	if animation_name == "closing":
		closing_animation_playing = false
		anima.stop("closing")

func _on_button_2_pressed():
	anima.play("closing")
	gui.visible = false


func _on_patrol_timer_timeout():
	pass # Replace with function body.
