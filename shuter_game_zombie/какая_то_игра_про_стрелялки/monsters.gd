extends Node

var zombie = preload("res://monster.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var zombietemp = zombie.instantiate()
	var rnd = RandomNumberGenerator.new()
	var randind = randi_range(0, 1)
	if randind == 0:
		zombietemp.position = Vector2(-100, 100)+Vector2(Global.pos_pers.x, 0)
	if randind == 1:
		zombietemp.position = Vector2(100, 100)+Vector2(Global.pos_pers.x, 0)
	add_child(zombietemp)
	
