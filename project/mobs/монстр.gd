extends CharacterBody2D
@onready var anim = $AnimatedSprite2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var shase = false
var speed = 100
var alive = true

	

func _physics_process(delta):
	var player = $"../../Node2D/Player"
	var direction = (player.position - self.position).normalized()
	if alive == true:
		if shase == true:
			velocity.x = direction.x * speed
			anim.play("ходьба")
		else:
			velocity.x = 0
			anim.play("пассив")
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		velocity.y += 100
	move_and_slide()	


func _on_agro_zone_body_entered(body):
	print("I see Player")
	if body.name == "Player":
		shase = true
		


func _on_agro_zone_body_exited(body):
	print("I see Player")
	if body.name == "Player":
		shase = false

func _on_смерть_body_entered(body):
	if body.name == "Player":
		body.velocity.y -= 200
		death()
func _on_смерть2_body_entered(body):
	if body.name == "Player":
		if alive == true:
			body.health -= 10
			death()
	
func death():
	alive = false
	anim.play("смерть")
	await anim.animation_finished
	queue_free()
	



	
