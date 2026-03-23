extends Node2D




func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://scene/легкий.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scene/сложный.tscn")


func _on_button_4_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")
