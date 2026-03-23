extends ParallaxBackground

var speed = 1


func _process(delta):
	scroll_offset.x -=speed + delta
