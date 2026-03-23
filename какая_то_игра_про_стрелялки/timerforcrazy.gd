extends Timer

var rnd = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rnd.randomize()
	var radnind = rnd.randi_range(Global.a_for_crazy, Global.b_for_crazy)
	wait_time = radnind
