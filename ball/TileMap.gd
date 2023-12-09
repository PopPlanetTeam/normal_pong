extends TileMap



func _process(delta):
	var ball = get_parent()
	
	var invert_tranform_horizontally = -1 if ball.direction.dot(transform.x) < 0 else 1
	transform.x *= invert_tranform_horizontally
