extends Node3D

@onready var main = $"..".get_parent()
@onready var rigidbody = $rigidbody
@onready var mesh = $rigidbody/mesh

func _on_rigidbody_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if (body is CharacterBody3D):
		main._on_body_entered(body)
	
	rigidbody.call_deferred("set_contact_monitor", false)
	mesh.set_layer_mask_value(1, true)
	mesh.set_layer_mask_value(2, false)
