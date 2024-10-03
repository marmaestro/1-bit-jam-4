extends Node3D

@onready var rigidbody = $rigidbody

func _on_collision():
	print_debug("ble")
	rigidbody.mode = 1
	get_tree().call_group("floors", "realign")
	get_tree().call_group("spawners", "create_floor")
	

func realign():
	position.y -= 0.525
	print_debug("ble")
