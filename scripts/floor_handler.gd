extends Node3D

var rng = RandomNumberGenerator.new()
@onready var timer = $"../Timer"

@onready var new_floor_scene = preload("res://prefabs/new_floor.tscn")
@onready var floor_meshes = [preload("res://models/floor_1.obj"), preload("res://models/floor_2.obj"), preload("res://models/floor_3.obj"), preload("res://models/floor_4.obj")]
@onready var floor_uvs = [preload("res://materials/floor_1_uv.png"), preload("res://materials/floor_2_uv.png"), preload("res://materials/floor_3_uv.png"), preload("res://materials/floor_4_uv.png")]

var new_floor

func _ready():
	timer.start()
	timer.timeout.connect(create_floor)
	
func create_floor():
	new_floor = new_floor_scene.instantiate()
	var floor_n = randi_range(0, 3)
	new_floor.name = str(Time.get_ticks_msec())
	
	new_floor.get_child(0).rotate_y(rng.randf_range(-180.0, 180.0))
	new_floor.get_child(0).get_child(1).mesh = floor_meshes[floor_n]
	new_floor.get_child(0).get_child(1).mesh.surface_set_material(0, floor_uvs[floor_n], )
	
	new_floor.get_child(0).get_child(0).make_convex_from_siblings()	
	add_child(new_floor)
