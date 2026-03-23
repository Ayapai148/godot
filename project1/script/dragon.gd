class_name Enemy extends CharacterBody2D


#анимация
@onready var anima2 = $AnimationPlayer
@onready var anima = $AnimatedSprite2D
#текущий скорость
@export var patrolSpeed = 50
@export var chaseSpeed = 90
#sounds
@onready var breath = $sounds/breath
#time
@onready var time_breath = $sounds/Timer
#состоянии
enum states{
	patrol,
	chase,
	hunting,
	waiting
}


var CurrentStates: states
var navigationagent: NavigationAgent2D
#точки направление 
@export var waypoints: Array
var waypointsIndex : int
var TimerPatrol : Timer
var PlayerInEarShotFar : bool
var PlayerInEarHotClose : bool
var PlayerInSightFar : bool
var PlayerInSightClose : bool
var player = null


func _ready():
	waypoints = get_tree().get_nodes_in_group("waypoint")
	#текущее состояние 
	CurrentStates = states.patrol
	TimerPatrol = $PatrolTimer
	navigationagent = $NavigationAgent2D
	navigationagent.set_target_position(waypoints[0].global_position)
	player = get_tree().get_nodes_in_group("Player")[0]





	
func get_player_reference():
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() > 0:
		player = players[0]
	else:
		player = null


	
func _physics_process(delta):
	if player == null:
		get_player_reference()
		return
	match CurrentStates:
		states.patrol:
			anima.play("walking")
			if (navigationagent.is_navigation_finished()):
				CurrentStates = states.waiting
				TimerPatrol.start()
				return
			move_tawords_player(delta, patrolSpeed)
			move_and_slide()
		states.chase:
			if (navigationagent.is_navigation_finished()):
				TimerPatrol.start()
				CurrentStates = states.waiting
			navigationagent.set_target_position(player.global_position)
			move_tawords_player(delta, chaseSpeed)
			pass
		states.hunting:
			if (navigationagent.is_navigation_finished()):
				TimerPatrol.start()
				CurrentStates = states.waiting
			navigationagent.set_target_position(player.global_position)
			move_tawords_player(delta, chaseSpeed)
			pass
		states.waiting:
			anima.play("default")
			pass
			

func check_for_player():
	if player != null:
		var space_state = get_world_2d().direct_space_state
		var result = space_state.intersect_ray(PhysicsRayQueryParameters2D.create($telo.global_position, player.global_position, 1, [self]))
		if result.size() > 0:
			if(result['collider'].is_in_group("Player")):
				if (PlayerInEarHotClose):
					CurrentStates = states.chase
				if (PlayerInEarShotFar):
					CurrentStates = states.hunting
					navigationagent.set_target_position(player.global_position)
				if (PlayerInSightClose):
					CurrentStates = states.chase
				if (PlayerInSightFar):
					CurrentStates = states.hunting
					navigationagent.set_target_position(player.global_position)		

						
			
		
func move_tawords_player(_delta, Speed):
	var TargetPos = navigationagent.get_next_path_position()
	var direction = global_position.direction_to(TargetPos)
	velocity = direction * Speed
	if direction.x < 0:
		anima.flip_h = false
	else:
		anima.flip_h = true
	move_and_slide()
	if (PlayerInEarHotClose):
		check_for_player()

func _on_patrol_timer_timeout():
	CurrentStates = states.patrol
	waypointsIndex += 1
	if waypointsIndex > waypoints.size() - 1:
		waypointsIndex = 0
	navigationagent.set_target_position(waypoints[waypointsIndex].global_position)
	pass


func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		PlayerInEarHotClose = true
		


func _on_detection_body_exited(body):
	if body.is_in_group("Player"):
		PlayerInEarHotClose = false
		


func _on_hearinglimits_body_entered(body):
	if body.is_in_group("Player"):
		PlayerInEarShotFar = true


func _on_hearinglimits_body_exited(body):
	if body.is_in_group("Player"):
		PlayerInEarShotFar = false
		


func _on_eyes_body_entered(body):
	if body.is_in_group("Player"):
		PlayerInSightFar = true
		


func _on_eyes_body_exited(body):
	if body.is_in_group("Player"):
		PlayerInSightFar = false
	


func _on_eyes_2_body_entered(body):
	if body.is_in_group("Player"):
		PlayerInSightClose = true


func _on_eyes_2_body_exited(body):
	if body.is_in_group("Player"):
		PlayerInSightClose = false
		
		


func _on_timer_timeout():
	breath.play()
