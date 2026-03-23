extends Node2D

@onready var camera_anima: AnimationPlayer = $camera_anima
@onready var next_scene: Timer = $next_scene
# Called when the node enters the scene tree for the first time.
func _ready():
	camera_anima.play("animation_camera")
	next_scene.start()

func _on_next_scene_timeout():
	get_tree().change_scene_to_file("res://main_2_сложный.tscn")
