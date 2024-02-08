class_name Player
extends CharacterBody2D

enum MV_STATUS {FREE_MOVING, DOWNWARDS_ONLY, UPWARDS_ONLY}

var SPEED = 300.0
@export var side = 'left'
var movement_status : MV_STATUS = MV_STATUS.FREE_MOVING
@export var score = 0

func _physics_process(delta):
	var direction 

	if side == "left":
		direction = get_axis(KEY_W, KEY_S)
	elif side == "right":
		direction = get_axis(KEY_UP, KEY_DOWN)

	# No movement allowed in the x axis
	velocity.x = 0

	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if movement_status == MV_STATUS.UPWARDS_ONLY and velocity.y < 0 or movement_status == MV_STATUS.DOWNWARDS_ONLY and velocity.y > 0 or movement_status == MV_STATUS.FREE_MOVING:
		move_and_slide()
		movement_status = MV_STATUS.FREE_MOVING
	
	# position.y = clamp(position.y, 0, get_tree().get_root().size.y)

func get_axis(up_key, down_key):
	if Input.is_key_pressed(up_key): return -1
	elif Input.is_key_pressed(down_key): return 1
	else: return 0
	

func _on_area_2d_body_entered(body):
	body.direction.x *= -1
	body.scale *= 0.99
	var game_node = get_parent()
	var ball = game_node.get_node("Ball")
	var audio : AudioStreamPlayer2D = ball.get_node("Audio")
	audio.stop()
	audio.play()
