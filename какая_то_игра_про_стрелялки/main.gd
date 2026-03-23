extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.col >= 10 and Global.col < 20:
		Global.a = 6
		Global.b = 8
	elif Global.col >= 20 and Global.col < 30:
		Global.a = 4
		Global.b = 6
	elif Global.col >= 30 and Global.col < 40:
		Global.a = 2
		Global.b = 4
	elif Global.col >= 40 and Global.col < 50:
		Global.a = 2
		Global.b = 3
	elif Global.col >= 50 and Global.col < 60:
		Global.a = 2
		Global.b = 2
	elif Global.col >= 60:
		Global.a = 1
		Global.b = 1
