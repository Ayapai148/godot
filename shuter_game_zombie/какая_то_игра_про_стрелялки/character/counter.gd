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
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(col)
