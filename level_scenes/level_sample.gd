extends Control

var levels = preload("res://level_scenes/levels_scene.tscn")
var level_names = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
var levels_scenes = [ preload("res://level_scenes/1level.tscn"),
preload("res://level_scenes/2level.tscn"), preload("res://level_scenes/3level.tscn"),
preload("res://level_scenes/4level.tscn"), preload("res://level_scenes/5level.tscn"), 
preload("res://level_scenes/6level.tscn"), preload("res://level_scenes/7level.tscn"), 
preload("res://level_scenes/8level.tscn"), preload("res://level_scenes/9level.tscn"), 
preload("res://level_scenes/10level.tscn"), preload("res://level_scenes/11level.tscn"), 
preload("res://level_scenes/12level.tscn") ]
var recent = 1


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
