extends CharacterBody2D


const SPEED = 50
const JUMP_VELOCITY = -400.0
@onready var anima: AnimatedSprite2D = $AnimatedSprite2D 
var alive = true 
var walking = false
@onready var hp:Label = $Label
var heath = 100
var damage = 10


func _physics_process(delta):
	death()
	var player = $"../../Node2D/player"
	var direction = (player.position - self.position).normalized()
	if alive == true:
		if walking == true:
			velocity.x = direction.x * SPEED
			anima.play('walking')
		else:
			velocity.x = 0
			anima.play("idle")
		if direction.x > 0:
			anima.flip_h = true
		else:
			anima.flip_h = false
			
		
		if Global.col >= 5 and Global.col < 10:
			damage = 15
		elif Global.col >= 10 and Global.col < 20:
			damage = 20
		elif Global.col >= 20:
			damage = 30
			
		
	move_and_slide()
	
func death():
	hp.text = str(heath)
	if heath <= 0 :
		queue_free()
		Global.col += 1
		Global.kill_true = true



func _on_agro_body_entered(body):
	if body.name == "player":
		print('I see Player!')
		walking = true
	
		
func _on_agro_body_exited(body):
	if body.name == "player":
		walking = false
		print('I dont see Player!')


func _on_mod_area_entered(area):
	if area.name == "Bullet":
		heath -= damage
		

func _on_damage_area_entered(area):
	if area.name == "player":
		print('damage')
		Global.heath_player -= 20
		print(Global.heath_player)
