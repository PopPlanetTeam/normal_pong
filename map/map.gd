extends Node2D

func _on_top_body_entered(body):
	var game_node = get_parent()
	var ball = game_node.get_node("Ball")
	var audio = ball.get_node("Audio")
	audio.playing = true
	body.direction.y *= -1
	
func _on_bottom_body_entered(body):
	var game_node = get_parent()
	var ball = game_node.get_node("Ball")
	var audio = ball.get_node("Audio")
	audio.playing = true
	body.direction.y *= -1

func _on_left_body_entered(body):
	var game_node = get_parent()
	var ball = game_node.get_node("Ball")
	var audio = ball.get_node("Audio")
	audio.playing = true
	reset_ball()
	
	Game.player2_score += 1
	
	var player2_score_label : Label = game_node.get_node("Interface").get_node("Player2Score")
	player2_score_label.text = "%d" % Game.player2_score

func _on_right_body_entered(body):
	var game_node = get_parent()
	var ball = game_node.get_node("Ball")
	var audio = ball.get_node("Audio")
	audio.playing = true
	reset_ball()
	
	Game.player1_score += 1
	
	var player1_score_label : Label = game_node.get_node("Interface").get_node("Player1Score")
	player1_score_label.text = "%d" % Game.player1_score

	
func reset_ball():
	var game_node = get_parent()
	var ball = game_node.get_node("Ball")

	ball.global_position = get_tree().get_root().size / 2
	ball.direction.x *= -1	
	ball.speed = 300
	ball.scale = Vector2(1.0, 1.0)
	ball.modulate = Color(randf(), randf(), randf())
	
	
