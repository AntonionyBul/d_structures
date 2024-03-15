extends Control

@onready var task = preload("res://level_scenes/tasks.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	task.third_task("0000", "1111", 3)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("enter_input"):
		_on_button_pressed()


func _on_button_pressed():
	if $input_1.get_text() != "":
		$output_1.set_text(task.first_task(int($input_1.get_text())))
	else:
			$output_1.set_text("")



func _on_text_edit_text_changed():
	$input_1.set_text($input_1.get_text().replace("\n", ""))
	$input_1.set_caret_column(1000)  #поменять на перевод в конец строки нормально
