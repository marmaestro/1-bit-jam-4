extends WorldEnvironment

@onready var character = $cam_gimball/character
@onready var floor_mesh = $floor
@onready var floor_spawn_point = $floor_spawn_point

@onready var timer = $loop_timer

@onready var game_start_screen = $HUD/game_start_screen
@onready var game_over_screen = $HUD/game_over_screen

@onready var game_over_title = $HUD/game_over_screen/game_over
@onready var game_over_message = $HUD/game_over_screen/message

func _ready():
	get_tree().paused = true

func _on_play_pressed():
	start_game()
	
func _on_play_again_pressed():
	restart_game()

func _on_exit_pressed():
	get_tree().quit()
	
func _on_body_entered(_body: Node3D):
	end_game()
	
func _on_game_timer_timeout():
	end_game()
	
func start_game():
	Engine.set_time_scale(1)
	timer.set_meta("running", true)
	game_start_screen.visible = false
	character.visible = true
	floor_mesh.visible = true
	if (get_tree() != null): get_tree().paused = false

func restart_game():
	get_tree().reload_current_scene()
	game_start_screen.visible = false
	character.visible = true
	start_game()

func end_game(died: bool = false):
	Engine.set_time_scale(0.5)
	character.visible = false
	game_over_screen.visible = true
	timer.set_meta("running", false)
	var points = floor_spawn_point.survived_floors
	if points <= 0: points = 0
	game_over_message.text = "[center]You survived\n%s floors" %points
	if (!died):
		game_over_title.text = "[center]CONGRATS!!"
		
