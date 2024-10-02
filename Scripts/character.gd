extends CharacterBody3D

var target_velocity = Vector3.ZERO
@export var speed = 1

func _physics_process(_delta):
	
	var direction = Vector3.ZERO
	if Input.is_action_pressed("move_back"):
		direction.z -= 1
	if Input.is_action_pressed("move_forward"):
		direction.z += 1
	
	translate_object_local(direction)
	
	
