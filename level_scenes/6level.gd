extends Control

@onready var task = preload("res://level_scenes/tasks.gd").new()

var v = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_button_pressed():
	if v != "":
		if (task.sixth_task($input_2.get_text(), v)):
			$output_1.set_text("Congrats!")
		else:
			$output_1.set_text("Wrong answer")
	else:
		$output_1.set_text("write right wtite")

func _on_button_3_pressed():
	v = task.first_task(int($input_1.get_text()))
	$output_2.set_text(str(v))

func _on_button_2_pressed():
	$input_1.set_text("")
	$input_2.set_text("")
	$output_1.set_text("")
	$output_2.set_text("")
