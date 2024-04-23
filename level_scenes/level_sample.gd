extends Control

var a= [preload("res://level_scenes/1level.tscn"),preload("res://level_scenes/2level.tscn"),
preload("res://level_scenes/3level.tscn"),preload("res://level_scenes/4level.tscn"),]
#var a5 = preload("res://level_scenes/5level.tscn")
#var a6 = preload("res://level_scenes/6level.tscn")
#var a7 = preload("res://level_scenes/7level.tscn")
#var a8 = preload("res://level_scenes/8level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():

	$".".add_child(a[2].instantiate())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
