extends CharacterBody2D


const SPEED = 50
const JUMP_VELOCITY = -400.0
@onready var anima: AnimatedSprite2D = $AnimatedSprite2D 
var alive = true 
var walking = false
@onready var hp:Label = $Label
var heath = 100
var damage_while = false


func _physics_process(delta):
	check_pos()
	position.x += -4
	if velocity.x < 0:
		anima.play('walking')

		
func _on_damage_area_exited(area):
	if area.name == "player":
		damage_while = false
func check_pos():
	if position.x <= -600:
		position.x = 1650
