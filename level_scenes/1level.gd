extends Control

@onready var task = preload("res://level_scenes/tasks.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	print("you're gay")
	task.dnf_from_truth_vector("00001111")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("enter_input"):
		_on_button_pressed()


func _on_button_pressed():
	if $Panel/TextEdit.get_text() != "":
		var answer = task.first_task(int($Panel/TextEdit.get_text()))
		$Panel/RichTextLabel.set_text(str(answer))
	else:
		$Panel/RichTextLabel.set_text("")


func _on_text_edit_text_changed():
	$Panel/TextEdit.set_text($Panel/TextEdit.get_text().replace("\n", ""))
	$Panel/TextEdit.set_caret_column(1000)  #поменять на перевод в конец строки нормально
