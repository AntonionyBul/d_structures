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
	
func tenth_task(v, ans):
	var s=""
	if(v[0]=="0"):
		s+="T0"
	if(v[len(v)-1]=="1"):
		s+="T1"
	var ch=1
	for i in range(0, len(v)/2):
		if(v[i]==v[len(v)-1-i]):
			ch=0
			break
	if(ch):
		s+="S"
	var is_monot=1
	var n = len(v)
	for i in range(n):
		for j in range(i+1, n):
			var is_mon=1
			for k in range(n):
				if ((i >> k) & 1) <= ((j >> k) & 1):
					is_mon = 0
					break
			if is_mon:
				if v[i] > v[j]:
					is_monot=0
	if(is_monot):
		s+="M"
	
	var arr_linear = []

	for i in range(len(v)):
		arr_linear.append([])
		for q in range(len(v) - i):
			if i == 0:
				arr_linear[i].append(int(v[q]))
			else:
				arr_linear[i].append(int(arr_linear[i - 1][q] != arr_linear[i - 1][q + 1]))

	for i in range(len(v)):
		if arr_linear[i][0] == 1 and not ((i & (i - 1)) == 0):
			break
		else:
			s+="L"
			break
	#с проверкой лучше еще пошаманить
	if(s==ans):
		print("win")
	else:
		print("loose")
