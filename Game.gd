extends Node

@onready var _saver:SaverLoader = %SaverLoader

func _ready():
	set_process_input(true)

func _input(event):
	if _saver == null: return
	if Input.is_key_pressed(KEY_1):
		_saver.save_game()
	elif Input.is_key_pressed(KEY_2):
		_saver.load_game()
