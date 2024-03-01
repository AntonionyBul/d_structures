class_name tasks


func first_task(n):
	var m = 1<<n
	var f = []
	for i in range(0, m):
		f.append(randi_range(0, 1))
	return str(f)
