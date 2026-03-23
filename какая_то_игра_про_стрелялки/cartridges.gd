extends Node2D



func _on_bullet_body_entered(body):
	if body.name == "player":
		Global.player_cartridges_get = true
		print('Игрок забрал патроны')
		Global.cartrisges += 30
		queue_free()
		
