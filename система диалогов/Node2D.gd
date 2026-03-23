extends Node2D

var file_path = "res://dialogue.json"
@onready var Text: Label = $MarginContainer/NinePatchRect/Label
var count = 0
@onready var textbox: MarginContainer = $MarginContainer

var dialogue = []
var tween: Tween = null


func _ready():
	print(read_json_data(file_path))
	var scene = get_tree().current_scene
	dialogue = read_json_data(file_path).get(scene.name, [])
	if dialogue.size() > 0:
		animation()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter") and count < len(dialogue):
		count += 1
		animation()
	
func animation():
	if tween:
		tween.kill()
	Text.text = dialogue[count]["name"] + ": " + dialogue[count]["text"]
	Text.visible_ratio = 0
	tween = get_tree().create_tween()
	tween.tween_property(Text, "visible_ration", 1, 1)
	
func read_json_data(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ)
	var data = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	if json.parse(data) != OK:
		return {}
	return json.get_data()
	
