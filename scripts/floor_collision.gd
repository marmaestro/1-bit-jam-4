extends Node3D

@onready var main = $"..".get_parent()
@onready var rigidbody = $rigidbody
@onready var mesh = $rigidbody/mesh
@onready var default_collider = preload("res://models/colliders/chip_0_collider.tres")

func _on_rigidbody_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if (body is CharacterBody3D):
		print_debug(body)
		#main._on_body_entered(body)
	rigidbody.get_child(0).set_shape(default_collider)
	
	# rendering mask as static
	mesh.set_layer_mask_value(1, true)
	mesh.set_layer_mask_value(2, false)
	# collision layer as static
	rigidbody.set_collision_layer_value(2, false)
	rigidbody.set_collision_layer_value(3, true)
	# collision mask as static
	rigidbody.set_collision_mask_value(1, false)
	
	
