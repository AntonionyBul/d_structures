extends Control

@onready var task = preload("res://level_scenes/tasks.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	task.third_task("0110", "0100", 1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if Input.is_action_just_pressed("enter_input"):
		#_on_button_pressed()
	

func _on_button_pressed():
	if $Panel/input_1.get_text()!= "" && $Panel/input_2.get_text()!= "" && $Panel/input_3.get_text() != "":
		$Panel/output_1.set_text(task.third_task($Panel/input_1.get_text(), $Panel/input_2.get_text(), int($Panel/input_3.get_text())))
	else:
		$Panel/output_1.set_text("write right wtite")


#func _on_input_1_text_changed():
	#$".".set_text($".".get_text().replace("\n", ""))
	#$".".set_caret_column(1000)  #поменять на перевод в конец строки нормально
