extends Node3D

@onready var rigidbody = $rigidbody

func _on_rigidbody_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	rigidbody.call_deferred("set_contact_monitor", false)
