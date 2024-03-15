extends Control

#var child_position : Vector2 = Vector2(0, 0)
#var child_size : Vector2 = Vector2(0, 0)
#var color : Color = Color.INDIAN_RED
#
#var _point2 : Vector2
#var timer = Timer.new()
#func _ready():
	#child_size = $".".get_child(0).size
	#child_position = $".".get_child(0).position
	#edraw()
#
#func _process(_delta):
	#var mouse_position = get_viewport().get_mouse_position()
	##if mouse_position != _point2:
		##_point2 = mouse_position
	#
#func edraw():
	#for i in range(1,11):
		#child_position[0] += i+10
		#child_position[1] += i+10
		#queue_redraw()
		#await get_tree().create_timer(1.0).timeout
		#print(i)
#
#func _draw():
		#draw_rect(Rect2(child_position[0], child_position[0], 30.0, 30.0), Color.GREEN)
	#



var radius = 0
var maxRadius = 50
var speed = 10
var startAngle = 0
var endAngle = 0
var increment = 5

func _process(delta):
	if radius < maxRadius:
		radius += speed * delta
	else:
		radius = maxRadius

	endAngle += increment

	if endAngle >= 360:
		endAngle = 360

	queue_redraw()

func _draw():
	var rect = Rect2(Vector2(0, 0), Vector2(get_size().x, get_size().y))
	draw_arc(rect.position + rect.size / 2, radius, deg2rad(startAngle), deg2rad(endAngle), 50, Color(1, 0, 0), 1) # The last argument is the line width

func deg2rad(deg):
	return deg * PI / 180
