class_name tasks


func first_task(n):
	var m = 1<<n
	var f = ""
	for i in range(0, m):
		f+=str(randi_range(0, 1))
	return f

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
	var x=0
	var y=0
	for i in range(0,len(vec1)+len(vec2)):
		if(i%(1<<n)/(1<<(n-1))==0):
			s+=vec1[x]
			x+=1
		if(i%(1<<n)/(1<<(n-1))==1):
			s+=vec2[y]
			y+=1
	return(s)

func fourth_task(x,y):
	var gr={"0000":"тождественный ноль",
		"0001":"конъюнкция",
		"0010":"коимпликация",
		"0011":"функция-переменная",
		"0100":"обратная коимпликация",
		"0101":"функция-переменная",
		"0110":"сложение",
		"0111":"дизъюнкция",
		"1000":"стрелка Пирса",
		"1001":"эквивалентность",
		"1010":"функция-отрицания",
		"1011":"обратная импликация",
		"1100":"функция-отрицания",
		"1101":"импликация",
		"1110":"штрих Шеффера",
		"1111":"тождественная единица"}
	if(gr[y]==x):
		return 1
	return 0

func fifth_task(v, s, n):
	var ans=""
	for i in range (1,n+1):
		if second_task(v,0,i)==second_task(v,1,i):
			ans+=str(i)
	if(s==ans):
		print("win")
		return 0
	return 0
	
func eigth_task(v):
	var ans=""
	var cnt=0
	var m=len(v)
	while(m!=1):
		m=m>>1
		cnt+=1
	var matrix = []
	for i in range (0, 1<<cnt):
		matrix.append([])
		for j in range(cnt-1, -1, -1):
			matrix[i].append(i/(1<<j)%2)
	for i in len(v):
		if (v[i]=="1"):
			for j in len(matrix[i]):
				if(matrix[i][j]==1):
					ans+="x"+str(j+1)+"&"
				else:
					ans+="-x"+str(j+1)+"&"
			ans[len(ans)-1]=""
			ans+=" v "
	#вот эту штуку потехничнее сделать
	ans[len(ans)-1]=""
	ans[len(ans)-1]=""
	print(ans)
	
