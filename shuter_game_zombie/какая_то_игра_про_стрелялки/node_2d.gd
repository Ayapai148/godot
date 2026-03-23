extends Node2D

var zombie = preload("res://monster.tscn")

func _on_timer_timeout():
	var zombietemp = zombie.instantiate()
	var rnd = RandomNumberGenerator.new()
	var randind = randi_range(0, 1)
	if randind == 0:
		zombietemp.position = Vector2(-120, 242)+Vector2(Global.pos_pers.x, 0)
	if randind == 1:
		zombietemp.position = Vector2(120, 242)+Vector2(Global.pos_pers.x, 0)
	add_child(zombietemp)
