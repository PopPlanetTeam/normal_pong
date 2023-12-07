extends CharacterBody2D

var speed = 300.0
var direction = Vector2.ZERO

const STARTING_BALL_SPEED = 300
const MAX_BALL_VELOCITY = 800
const BALL_ACCELERATION = 50
const START_ACCELERATING_BALL_AFTER_SECONDS = 2
const MIN_BALL_SCALE = 0.5

func _ready():
	# Generate a random direction
	direction = Vector2([-1, -0.75, -0.5, 0.5, 0.75, 1].pick_random(), [-1, -0.75, -0.5, 0.5, 0.75, 1].pick_random()).normalized()

func _physics_process(delta):
	if direction:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	
	move_and_slide()
	
func increase_speed():
	speed += BALL_ACCELERATION
	speed = min(speed, MAX_BALL_VELOCITY)

	scale.x = max(MIN_BALL_SCALE, scale.x)
	scale.y = max(MIN_BALL_SCALE, scale.y)
