class_name tasks


func first_task(n):
	var m = 1<<n
	var f = []
	for i in range(0, m):
		f.append(randi_range(0, 1))
	return str(f)

func second_task(vec, bi, n):
	#пример
	var cnt=0
	var m=len(vec)
	while(m!=1):
		m=m>>1
		cnt+=1
	n=cnt-n+1
	var s=""
	for i in range(0, len(vec)):
		if(i%(1<<n)/(1<<(n-1))==bi):
			s+=(vec[i])
	return(s)

func third_task(vec1, vec2, n):
	#сократить код
	var cnt=0
	var m=len(vec1)+len(vec2)
	while(m!=1):
		m=m>>1
		cnt+=1
	n=cnt-n+1
	var s=""
<<<<<<< HEAD:tasks.gd
	var x=0
	var y=0
	for i in range(0,len(vec1)+len(vec2)):
		if(i%(1<<n)/(1<<(n-1))==0):
			s+=vec1[x]
			x+=1
		if(i%(1<<n)/(1<<(n-1))==1):
			s+=vec2[y]
			y+=1
	print(s)
=======
#	for i in range(0,len(vec1)+len(vec2)):
#		if(i%(1<<n)/(1<<(n-1))==0):
#			s+=v1.pop_front()
#		if(i%(1<<n)/(1<<(n-1))==1):
#			s+=v2.pop_front()
#	print(s)
>>>>>>> d6ed0b6 (2_3_levels_ux):level_scenes/tasks.gd