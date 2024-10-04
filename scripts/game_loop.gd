extends Node3D

@onready var game_over_screen = $HUD/game_over_screen
@onready var message = $HUD/game_over_screen/message
@onready var floor_spawn_point = $floor_spawn_point

func start_game():
	Engine.set_time_scale(1)
	get_tree().reload_current_scene()

func end_game():
	Engine.set_time_scale(0.5)
	game_over_screen.visible = true
	var points = floor_spawn_point.survived_floors
	if points <= 0: points = 0
	message.text = "[center] You survived\n%s floors" %	points

func _on_body_entered(_body: Node3D):
	end_game()

func _on_play_again_pressed():
	start_game()

func _on_exit_pressed():
	get_tree().quit()
