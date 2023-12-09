extends CharacterBody2D

var SPEED = 300.0
@export var side = 'left'

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
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func get_axis(up_key, down_key):
	if Input.is_key_pressed(up_key): return -1
	elif Input.is_key_pressed(down_key): return 1
	else: return 0
	

func _on_area_2d_body_entered(body):
	body.direction.x *= -1
	body.scale *= 0.99
