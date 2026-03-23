extends Timer

var rnd = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rnd.randomize()
	var radnind = rnd.randi_range(Global.a, Global.b)
	wait_time = radnind
	
