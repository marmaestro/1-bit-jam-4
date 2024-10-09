extends WorldEnvironment

@onready var character = $cam_gimball/character
@onready var floor = $floor
@onready var floor_spawn_point = $floor_spawn_point

@onready var game_start_screen = $HUD/game_start_screen
@onready var game_over_screen = $HUD/game_over_screen
@onready var message = $HUD/game_over_screen/message

func _init():
	Engine.set_time_scale(0.5)
	
func _ready():
	get_tree().paused = true

func start_game():
	Engine.set_time_scale(1)
	game_start_screen.visible = false
	character.visible = true
	floor.visible = true
	if (get_tree() != null): get_tree().paused = false

func restart_game():
	get_tree().reload_current_scene()
	game_start_screen.visible = false
	start_game()

func end_game():
	Engine.set_time_scale(0.5)
	game_over_screen.visible = true
	var points = floor_spawn_point.survived_floors
	if points <= 0: points = 0
	message.text = "[center] You survived\n%s floors" %	points

func _on_body_entered(_body: Node3D):
	end_game()

func _on_play_again_pressed():
	restart_game()

func _on_exit_pressed():
	get_tree().quit()

func _on_play_pressed():
	start_game()
