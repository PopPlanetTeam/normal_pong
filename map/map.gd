extends Node2D

func _on_top_body_entered(body):
	if body.is_in_group("Player"):
		body.movement_status = Player.MV_STATUS.DOWNWARDS_ONLY
	else:
		var game_node = get_parent()
		var ball = game_node.get_node("Ball")
		var audio : AudioStreamPlayer2D = ball.get_node("Audio")
		audio.stop()
		audio.play()
		body.direction.y *= -1
	

func _on_bottom_body_entered(body):
	if body.is_in_group("Player"):
		body.movement_status = Player.MV_STATUS.UPWARDS_ONLY
	else:
		var game_node = get_parent()
		var ball = game_node.get_node("Ball")
		var audio : AudioStreamPlayer2D = ball.get_node("Audio")
		audio.stop()
		audio.play()
		body.direction.y *= -1

func _on_left_body_entered(body):
	var audio : AudioStreamPlayer2D = %Ball.get_node("Audio")
	audio.stop()
	audio.play()
	reset_ball()
	
	%Player2.score += 1
	
	var player2_score_label : Label = %Interface.get_node("Player2Score")
	player2_score_label.text = "%d" % %Player2.score
	
	RenderingServer.set_default_clear_color(Color(randf(),randf(),randf(), 0.1))

func _on_right_body_entered(body):
	var audio : AudioStreamPlayer2D = %Ball.get_node("Audio")
	audio.stop()
	audio.play()
	reset_ball()
	
	%Player1.score += 1
	
	var player1_score_label : Label = %Interface.get_node("Player1Score")
	player1_score_label.text = "%d" % %Player1.score
	
	RenderingServer.set_default_clear_color(Color(randf(),randf(),randf(), 0.1))

	
func reset_ball():
	var game_node = get_parent()
	var ball = game_node.get_node("Ball")

	ball.global_position = get_tree().get_root().size / 2
	ball.direction.x *= -1	
	ball.direction.y = [0.5, 0.25, -0.25, -0.5].pick_random()
	ball.speed = 300
	ball.scale = Vector2(1.0, 1.0)
	
	
