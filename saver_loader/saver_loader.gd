class_name SaverLoader
extends Node

@onready var player1 = %Player1
@onready var player2 = %Player2
@onready var ball = %Ball
@onready var interface = %Interface

func save_game() -> void:
	var saved_game := SavedGame.new()
	
	saved_game.player1_position = player1.global_position
	saved_game.player2_position = player2.global_position
	saved_game.ball_position = ball.global_position
	saved_game.ball_direction = ball.direction
	saved_game.ball_speed = ball.speed
	saved_game.player1_score = player1.score
	saved_game.player2_score = player2.score
	saved_game.background_color = RenderingServer.get_default_clear_color()
	
	ResourceSaver.save(saved_game, "user://savegame.tres")
	
func load_game() -> void:
	var saved_game : SavedGame = ResourceLoader.load("user://savegame.tres")
	
	player1.global_position = saved_game.player1_position
	player2.global_position = saved_game.player2_position
	ball.global_position = saved_game.ball_position
	ball.direction = saved_game.ball_direction 
	ball.speed = saved_game.ball_speed
	player1.score = saved_game.player1_score
	player2.score = saved_game.player2_score
	RenderingServer.set_default_clear_color(saved_game.background_color)
	
	interface.get_node("Player1Score").text = "%d" % player1.score 
	interface.get_node("Player2Score").text = "%d" % player2.score 
