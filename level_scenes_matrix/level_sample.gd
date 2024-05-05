extends Control

#	var levels = preload("res://level_scenes_matrix/levels_scene.tscn")
var level_names = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
var levels_scenes = [ preload("res://level_scenes_matrix/1level.tscn"),
preload("res://level_scenes_matrix/2level.tscn"), preload("res://level_scenes_matrix/3level.tscn"),
preload("res://level_scenes_matrix/4level.tscn"), preload("res://level_scenes_matrix/5level.tscn"), 
preload("res://level_scenes_matrix/6level.tscn"), preload("res://level_scenes_matrix/7level.tscn"), 
preload("res://level_scenes_matrix/8level.tscn"), preload("res://level_scenes_matrix/9level.tscn"), 
preload("res://level_scenes_matrix/10level.tscn"), preload("res://level_scenes_matrix/11level.tscn"), 
preload("res://level_scenes_matrix/12level.tscn") ]
var recent = 0
var level_advices = [
	preload("res://advices/1advice.tscn"),
	#preload("res://advices/2advice.tscn"),
	
]

func change_level(new):
	if recent != new: 
		$".".remove_child($".".get_child(-1))
	if new<0:
		new = 11
	if new>11:
		new = 0
	recent = new 
	$".".add_child(levels_scenes[recent].instantiate())
	$level_option.selected = recent

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in level_names:
		$level_option.add_item(i)
	change_level(recent)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_previous_level_pressed():
	change_level(recent-1)

func _on_next_level_pressed():
	change_level(recent+1)

func _on_level_option_item_selected(index):
	change_level(index)

var its_on = false
func _on_back_to_levels_2_pressed():
	if its_on:
		remove_child($".".get_child(-1))
		its_on = false
	else:
		its_on = true
		add_child(level_advices[recent].instantiate())