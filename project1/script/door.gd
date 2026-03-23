class_name SceneTrigger extends Area2D


@export var connected_scene: String #имя сцены которую хотим перейти
@onready var button = $Button
@onready var anima = $AnimationPlayer
@onready var click = $AudioStreamPlayer
@onready var timer = $Timer

func _ready():
	button.visible = false

	


func _on_body_entered(body):
	if body is Player:
		anima.play("enter")
		button.visible = true
	


func _on_body_exited(body):
	if body is Player:
		anima.play("back")
		timer.start()
		
		




func _on_button_pressed():
	click.play()
	await click.finished
	scene_manager.change_scene(get_owner(), connected_scene)


func _on_timer_timeout():
	button.visible = false
	timer.stop()
