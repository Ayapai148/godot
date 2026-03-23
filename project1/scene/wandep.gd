extends Node2D


@export var group_name : String

var postitons : Array
var temp_position : Array
var current_position : Marker2D

var direction : Vector2 = Vector2.ZERO

func _ready():
	position = get_tree().get_nodes_in_group(group_name)



