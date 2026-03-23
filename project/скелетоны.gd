extends Node2D


var skeleton = preload("res://mobs/монстр.tscn")


func _on_timer_timeout():
	var skeletonTemp = skeleton.instantiate()
	var rnd = RandomNumberGenerator.new()
	var randint = randi_range(0, 1)
	if randint == 0:
		skeletonTemp.position = Vector2(-200,610)+Vector2(Global.pers_pos.x,0)
	if randint == 1:
		skeletonTemp.position = Vector2(200,610)+Vector2(Global.pers_pos.x,0)
	
	add_child(skeletonTemp)

	
