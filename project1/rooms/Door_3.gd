extends Area2D

class_name Door_3
@export var destination_level_tag: String
@export var destination_door_tag: String
@export var spawn_direction = "up"
@onready var button = $Button
@onready var spawn = $spawn

func _ready():
	button.visible = false
	
func _on_body_entered(body):
	button.visible = true
	
func _on_body_exited(body):
	button.visible = false

func _on_button_pressed():
	G.go_to_level(destination_level_tag, destination_door_tag)

