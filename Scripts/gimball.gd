extends Node3D

var cam_speed = 2 # in rad/s
@onready var character = $character

func _process(delta):
	
	if Input.is_action_pressed("move_right"):
		rotation.y += 1 * delta * cam_speed
	if Input.is_action_pressed("move_left"):
		rotation.y -= 1 * delta * cam_speed
		
	character.move_and_slide()
