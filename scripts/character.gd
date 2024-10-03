extends CharacterBody3D

var speed = 0.25
var gravity = 500

	
func _physics_process(delta):	
	var target_velocity = Vector3.ZERO
	target_velocity.y += -gravity * delta
	velocity = target_velocity
	if (is_on_floor()): move_local_y()
	
func move_local_y():
	var direction = Vector3.ZERO
	if Input.is_action_pressed("move_back"):
		direction.z -= speed
	if Input.is_action_pressed("move_forward"):
		direction.z += speed
	translate_object_local(direction)
