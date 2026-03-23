extends Area2D
var speed = -25
# Called every frame. 'delta' is the elapsed time since the previous frame

func _physics_process(delta):
	position += transform.x * speed

func _on_area_entered(area):
	if area.name == "Mod":
		queue_free()
		
func _on_area_exited(area):
	if area.name == "delete_bullet":
		queue_free()
