extends Control

@onready var task = preload("res://level_scenes/tasks.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	task.tenth_task("1000","T0")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("enter_input"):
		_on_button_pressed()


func _on_button_pressed():
	if $TextEdit.get_text() != "":
		var answer = task.first_task(int($TextEdit.get_text()))
		$RichTextLabel.set_text(str(answer))
		add_info(answer, $TextEdit.get_text())
	else:
			$RichTextLabel.set_text("")


func add_info(binum, bin_len):
	var s = ""
	for i in binum: 
		s += str(i)
	var parsed = JSON.parse_string(FileAccess.get_file_as_string("res://save1.json"))
	if is_instance_valid(parsed[bin_len][s]):
		parsed[bin_len][s] += 1
		
	FileAccess.open("res://save1.json", FileAccess.WRITE).store_string(JSON.stringify(parsed))
	print(typeof(parsed))

func _on_text_edit_text_changed():
	$TextEdit.set_text($TextEdit.get_text().replace("\n", ""))
	$TextEdit.set_caret_column(1000)  #поменять на перевод в конец строки нормально
