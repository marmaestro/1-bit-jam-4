extends Node3D

var survived_floors = -1
var rng = RandomNumberGenerator.new()
@onready var timer = $"../Timer"

@onready var new_floor_scene = preload("res://scenes/new_floor.tscn")
@onready var floor_meshes = [preload("res://models/chip_1.obj"), preload("res://models/chip_2.obj"), preload("res://models/chip_3.obj"), preload("res://models/chip_4.obj"), preload("res://models/chip_5.obj")]
@onready var floor_uvs = [preload("res://materials/chip_1.tres"), preload("res://materials/chip_2.tres"), preload("res://materials/chip_3.tres"), preload("res://materials/chip_4.tres"), preload("res://materials/chip_5.tres")]

var new_floor

func _ready():
	timer.start()
	
func _on_timeout():
	if(timer.get_meta("running")): survived_floors += 1
	create_floor()
	
func create_floor():
	if (survived_floors == 0): $SpotLight3D.visible = true
	new_floor = new_floor_scene.instantiate()
	var floor_n = randi_range(0, 4)
	new_floor.name = str(Time.get_ticks_msec())
	
	new_floor.get_child(0).rotate_y(rng.randf_range(-180.0, 180.0))
	new_floor.get_child(0).get_child(1).mesh = floor_meshes[floor_n]
	new_floor.get_child(0).get_child(1).set_material_override(floor_uvs[floor_n])
	
	new_floor.get_child(0).get_child(0).make_convex_from_siblings()	
	add_child(new_floor)
	
