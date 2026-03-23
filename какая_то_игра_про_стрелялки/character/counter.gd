extends Label

var col = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
func _on_timer_timeout():
	col += 1
	if Global.col >= 5 and Global.col < 10:
		Global.count_bullets = 13
	elif Global.col >= 10 and Global.col < 15:
		Global.count_bullets = 11
	elif Global.col >= 15 and Global.col < 20:
		Global.count_bullets = 10
	elif Global.col >= 20:
		Global.count_bullets = 9
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(col)
		
