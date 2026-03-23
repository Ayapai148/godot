extends CanvasLayer

@onready var background = $background
@onready var text = $text
@onready var Pointlihgt: PointLight2D = $PointLight2D
@onready var sound:AudioStreamPlayer = $AudioStreamPlayer
@onready var sound_typing: AudioStreamPlayer = $AudioStreamPlayer2
@onready var time_text: Timer = $Timer
@onready var time_2scene = $Timer3
@onready var timer_3scene = $Timer4
var tween: Tween


var text_dialog = [
	"Игрок: 
	-Как же хочется кушать...",
	"Игрок: 
	-Поскорее бы окунуться в кровать",
	"Игрок:
	-Надо бы купить дом поближе к 
	работе",
	"Игрок:
	-Хотя...",
	"Игрок:
	-С нынешней зарплатой",
	"Игрок:
	-Это вряд-ли получится...",
	"Игрок:
	-Я даже машину купил с большим 
	трудом",
	"Игрок:
	-А нынешняя квартира у меня 
	съёмная...",
]
var text_dialog_2 = [
	"Игрок:
	-Внезапно гроза пошла",
	"Игрок:
	-Грозы же не было, когда я выходил
	на улицу",
	"Игрок:
	-хмм...",
	"Игрок:
	-Странно..."
]
var text_dialog_3 = [
	"Игрок:
	-Что за....!",
	"Игрока:
	-Похоже от утомление, у меня уже
	 галлюцинации",
	"Игрок:
	-.........................................."
]

var current_index = 0
var current_index_2 = 0
var current_index_3 = 0
var smena = false
var smena_2 = false


func _ready():
	print_text()
	text.text = "Игрок:
		-Как же я устал..."
	sound_typing.playing = true
	time_text.start()

func _text():
	
	if smena == false:
		if current_index < text_dialog.size():
			print(current_index)
			text.text = text_dialog[current_index]
			current_index += 1
		else:
			print("stop")
			background.visible = false
			text.visible = false
			Pointlihgt.visible = false
			sound.playing = false
			sound_typing.volume_db = -80
			time_text.stop()
			time_2scene.start()
			time_2scene.one_shot = true
			smena = true
			
		if current_index == 4:
			sound_typing.pitch_scale = 0.5
		elif current_index == 5:
			sound_typing.pitch_scale = 0.7
	if smena == true:
		if current_index_2 < text_dialog_2.size():
			print(current_index_2)
			text.text = text_dialog_2[current_index_2]
			current_index_2 += 1
		else:
			background.visible = false
			text.visible = false
			Pointlihgt.visible = false
			sound.playing = false
			sound_typing.volume_db = -80
			time_text.stop()
			smena_2 = true
			if current_index_3 == 3:
				smena_2 = false
				return
				
			timer_3scene.start()
			timer_3scene.one_shot = true
			
		
			
		if current_index_2 == 3:
			sound_typing.pitch_scale = 0.5
		elif current_index_2 == 4:
			sound_typing.pitch_scale = 0.7
			G.dialog_close = true
			
		if smena_2 == true:
			if current_index_3 < text_dialog_3.size():
				print(current_index_3)
				text.text = text_dialog_3[current_index_3]
				current_index_3 += 1
			else:
				background.visible = false
				text.visible = false
				Pointlihgt.visible = false
				sound.playing = false
				sound_typing.volume_db = -80
				time_text.stop()
				
func _input(event):
	if text.visible_ratio == 1:
		if background.visible == true:
			if event.is_action_pressed("enter"):
				sound.playing = true
				text.visible_ratio = 0
				print_text()
				_text()
				sound_typing.playing = true
				time_text.start()
				
func print_text():
	tween = create_tween()
	tween.tween_property(text, "visible_ratio", 1, 2)
	
func _on_timer_timeout():
	sound_typing.playing = false


func _on_timer_3_timeout():
	sound_typing.playing = false
	print('start')
	text.visible_ratio = 0
	print_text()
	sound_typing.volume_db = 11.119
	sound_typing.playing = true
	background.visible = true
	text.visible = true
	Pointlihgt.visible = true
	time_text.start()

func _on_timer_4_timeout():
	print('start')
	text.visible_ratio = 0
	print_text()
	sound_typing.volume_db = 11.119
	sound_typing.playing = true
	background.visible = true
	text.visible = true
	Pointlihgt.visible = true
	time_text.start()
	
