extends Control

@onready var task = preload("res://level_scenes/tasks.gd").new()

var names = ["тождественный ноль", "тождественная единица", "конъюнкция", "дизъюнкция", "сложение", 
			"штрих Шеффера", "стрелка Пирса", "импликация", "эквивалентность", "коимпликация",
			"обратная импликация", "обратная коимпликация", "функция-переменная", "функция-отрицания"]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/output_1.set_text(task.first_task(2))
	for i in names:
		$Panel/choose_name.add_item(i)
		$Panel/choose_name.selected = -1
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_button_pressed():
	if $Panel/choose_name.selected != -1:
		print($Panel/output_1.get_text(), $Panel/choose_name.get_text())
		$Panel/output_1.set_text(task.fourth_task($Panel/choose_name.get_text(), $Panel/output_1.get_text()))
		
	else:
		$Panel/output_1.set_text("write right wtite")



func _on_again_pressed():
	get_tree().change_scene_to_file("res://level_scenes/4level.tscn")