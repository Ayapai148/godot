extends ProgressBar

var hp = value

func _ready():
	Event.connect("make_damage", self, "update_health")

func update_health(my_value):
	value -= my_value
	value = hp
