extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.col >= 10 and Global.col < 20:
		Global.a_for_crazy = 12
		Global.b_for_crazy = 14
	elif Global.col >= 20 and Global.col < 30:
		Global.a_for_crazy = 10
		Global.b_for_crazy = 12
	elif Global.col >= 30 and Global.col < 40:
		Global.a_for_crazy = 6
		Global.b_for_crazy = 8
	elif Global.col >= 40 and Global.col < 50:
		Global.a_for_crazy = 4
		Global.b_for_crazy = 6
	elif Global.col >= 50 and Global.col < 60:
		Global.a_for_crazy = 2
		Global.b_for_crazy = 4
	elif Global.col >= 60:
		Global.a_for_crazy = 2
		Global.b_for_crazy = 2
