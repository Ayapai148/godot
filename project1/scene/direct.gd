extends PathFollow2D

var speed = 0.0050
@onready var collision = $stop
@onready var dragon = $DRagon/AnimatedSprite2D
@onready var timer = $"../../Timer"
var player = null 
	

func _process(delta):
	progress_ratio += delta * speed
	if progress_ratio > 0.1946:
		dragon.flip_h = true
	if progress_ratio > 0.3911:
		dragon.flip_h = false
	if progress_ratio > 0.5266:
		dragon.flip_h = true
	if progress_ratio > 0.6402:
		dragon.flip_h = false
	if  progress_ratio > 0.7272:
		dragon.flip_h = true
	if progress_ratio > 0.803:
		dragon.flip_h = false
	
	



func sTop():
	if progress_ratio == 0.05:
		timer.start(1)
		
		
	
		



