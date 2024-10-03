extends Node3D

@onready var falling_point = $"../falling_point"

var ff1
var ff2
var ff3
var ff4

func _init():
	ff1 = preload("res://prefabs/falling_floor_1.tscn")
	ff2 = preload("res://prefabs/falling_floor_2.tscn")
	ff3 = preload("res://prefabs/falling_floor_3.tscn")
	ff4 = preload("res://prefabs/falling_floor_4.tscn")

func _process(_delta):
	set_floor()

func set_floor():
	
	var new_floor = Node3D.new()
	new_floor.add_child(get_random_floor())
	add_child(new_floor)
	
	#if (falling_point.position == Vector3.ZERO):	
		#falling_floor.position = falling_point.position
	#
	#floor_children[floor_index].visible = true
	#last_floor.add_child(falling_floor)
	#
	#last_floor = last_floor.get_child(0)

func get_random_floor():
	
	var r = randi() % 4
	match r:
		0: return ff1.instantiate()
		1: return ff2.instantiate()
		2: return ff3.instantiate()
		3: return ff4.instantiate()
