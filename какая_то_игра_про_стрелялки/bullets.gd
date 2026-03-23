extends Node2D

var cartridges1 = preload("res://cartridges.tscn")

func _on_timer_cartridges_timeout():
	var cartridges_temp = cartridges1.instantiate()
	var rnd = RandomNumberGenerator.new()
	var randind = rnd.randi_range(-140, 140)
	cartridges_temp.position = Vector2(randind, 252)+Vector2(Global.pos_pers.x, 0)
	add_child(cartridges_temp)
