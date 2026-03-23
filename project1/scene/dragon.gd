extends Node2D

@onready var path2dfollow: PathFollow2D = $Path2D/PathFollow2D
@onready var dragon = $Path2D/PathFollow2D/DRagon
@export var speed = 10
@onready var path2d = get_node("Path2D")
var player = null
# Called every frame. 'delta' is the elapsed time since the previous frame


	

