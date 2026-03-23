extends Node2D

var money = preload("res://монета.gd")

func _on_timer_timeout():
	var moneytemp = money.instance()
	var rng = RandomNumberGenerator.new()
	var randint = randi_range(50, 500)
	moneytemp.position = Vector2 (randint,670)
	add_child(moneytemp)
	
