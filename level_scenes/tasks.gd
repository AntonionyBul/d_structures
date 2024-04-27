class_name tasks

func Is_T0(v):
	if(v[0]=="0"):
		return true
	else:
		return false
		
func Is_T1(v):
	if(v[len(v)-1]=="1"):
		return true
	else:
		return false
		
func Is_S(v):
	for i in range(0, len(v)/2):
		if(v[i]==v[len(v)-1-i]):
			return false
	return true
	
func Is_M(v):
	var is_monot=true
	var n = len(v)
	for i in range(n):
		for j in range(i+1, n):
			var is_mon=1
			for k in range(n):
				if ((i >> k) & 1) > ((j >> k) & 1):
					is_mon = false
					break
			if is_mon:
				if v[i] > v[j]:
					is_monot=0
	return is_monot
	
func Is_L(v):
	var arr_linear = []

	for i in range(len(v)):
		arr_linear.append([])
		for q in range(len(v) - i):
			if i == 0:
				arr_linear[i].append(int(v[q]))
			else:
				arr_linear[i].append(int(arr_linear[i - 1][q] != arr_linear[i - 1][q + 1]))

	var p=true
	for i in range(len(v)):
		if arr_linear[i][0] == 1 and not ((i & (i - 1)) == 0):
			p=false
			break
	return p


# На вход — число n, на выход — булева функция от n аргументов (строка f)
func first_task(n):
	var f = ""
	for i in range(0, 1<<n):
		f+=str(randi_range(0, 1))
	return f
	
# На вход — вектор функции (v), 0 или 1 (bi), номер аргумента (n), на выход — соответствующая остаточная (строка s)
func second_task(vec, bi, n):
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
# На вход — два вектора (это нулевая и единичная остаточные функции по некоторому аргументу), номер аргумента, на выход — вектор функции.
# vec1 - это нулевая остаточная (строка), vec2 - это единичная остаточная (строка), n - это номер переменной (аргумента) (целое число), s - возвращаемый вектор функции (строка)
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
#Игра. Узнать имя функции от 2-х аргументов. Система предлагает вектор функции, пользователь выбирает «имя» (одно из 16).
# Здесь x - это имя функции ,которое выбирает пользователь (вроде строка), y - вектор функции (строка), который ему предлагает система, возврашаем 1, если правильно и 0, если не правильно.
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
# Игра. Существенные и фиктивные переменные. Система предлагает вектор функции. Пользователь выбирает существенные и фиктивные переменные
# Здесь v - это предлагаемый системой вектор (строка), s - строка с выбранными пользователем переменными по номерам (то есть что-то вроде "123", пишется без пробелов), n - число переменных функции.
# в идеале от n можно избавиться с помощью логарифмов и находить его в самой функции, но это потом решим. Также вывод следует дописать, так как выводить win в командную строку такое себе.
func fifth_task(v, s, n):
	var ans=""
	for i in range (1,n+1):
		if second_task(v,0,i)==second_task(v,1,i):
			ans+=str(i)
	
	if(s==ans):
		print("win")
<<<<<<< HEAD
	else:
		print("loose")
	
=======
		return 0
	print(ans)
	return 0
>>>>>>> 94ccf88 (add_all_level_scenes)

# сам пиши
func sixth_task(dnf_expression, v):
	var parse_DNF = func (expression):
		var dnf_list = []
		var sub_expression = {}
		var is_negative = false
		var current_var = ""

		for i in range(0, len(expression)):
			if expression[i]>='A' and expression[i]<='z' and expression[i]!='V':
				current_var += expression[i+1]
			elif expression[i] == "-":
				is_negative = true
			elif expression[i] == " ":
				if current_var:
					var var_index = int(current_var)
					sub_expression[var_index] = not is_negative
					current_var = ""
					is_negative = false
			elif expression[i] == "V":
				if sub_expression:
					dnf_list.append(sub_expression)
					sub_expression = {}
		if sub_expression:
			dnf_list.append(sub_expression)
		
		return dnf_list

	var dnf_expression1 = "X1 - X2 V X3 "
	var dnf = parse_DNF.call(dnf_expression1)

	var f = func (args: Array):
		for clause in dnf:
			var satisfied = true
			for keys in clause:
				if args[keys-1] != clause[keys]:
					satisfied = false
					break
			if satisfied:
				return true
		return false
	print(f)

#  Пользователь вводит вектор функции. Система строит СДНФ.
# v - вектор функции (строка). Возвращаем строку, которая является СДНФ
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
					ans+=" x"+str(j+1)+" &"
				else:
					ans+=" -x"+str(j+1)+" &"
			ans[len(ans)-1]=""
			ans+=" V "
	#вот эту штуку потехничнее сделать
	ans[len(ans)-1]=""
	ans[len(ans)-1]=""
	print(ans)
	
# Пользователь вводит вектор функции. Система строит СКНФ.
# v - вектор функции (строка). Возвращаем строку, которая является СКНФ
func ninth_task(v):
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
	ans+="("
	for i in len(v):
		if (v[i]=="0"):
			for j in len(matrix[i]):
				if(matrix[i][j]==0):
					ans+=" x"+str(j+1)+" V"
				else:
					ans+=" -x"+str(j+1)+" V"
			ans[len(ans)-1]=""
			
			ans+=") & ("
	#вот эту штуку потехничнее сделать
	ans[len(ans)-1]=""
	ans[len(ans)-1]=""
	ans[len(ans)-1]=""
	print(ans)
	
#Игра. Предполные классы б.ф. Система предлагает вектор функции. Пользователь должен выбрать предполные классы, которым эта функция принадлежит. Система определяет правильно выбраны классы или нет.
# v - вектор функции (строка), ans - ответ пользователя, это строка, где без пробелов записаны классы, которые выбрал пользователь в порядке T0T1SML и ни в каком другом.

func tenth_task(v, ans):
	var s=""
	if(Is_T0(v)):
		s+="T0"
	
	if(Is_T1(v)):
		s+="T1"
	
	if(Is_S(v)):
		s+="S"
	
	if(Is_M(v)):
		s+="M"
	
	if(Is_L(v)):
		s+="L"
			
	#с проверкой лучше еще пошаманить
	#print(s)
	if(s==ans):
		print("win")
	else:
		print("loose")
	
#Игра. Полные системы б.ф. Система предлагает набор векторов функций. Пользователь определяет полным или нет является набор функций. Если система б.ф. неполна, то пользователь должен указать замкнутый класс, которому набор функций принадлежит.
# system - это система векторов (массив строк), inp - ответ пользователя в таком же формате, как в 10: строка с классами в следующем порядке T0T1SML, 
func eleventh_task(system, inp):
	var ans=""
	var cnt=0
	for v in system:
		if(not Is_T0(v)):
			break
		cnt+=1
	if(cnt==len(system)):
		ans+="T0"
	cnt=0
	
	for v in system:
		if(not Is_T1(v)):
			break
		cnt+=1
	if(cnt==len(system)):
		ans+="T1"
	cnt=0
	
	for v in system:
		if(not Is_S(v)):
			break
		cnt+=1
	if(cnt==len(system)):
		ans+="S"
	cnt=0
	
	for v in system:
		if(not Is_M(v)):
			break
		cnt+=1
	if(cnt==len(system)):
		ans+="M"
	cnt=0
	
	for v in system:
		if(not Is_L(v)):
			break
		cnt+=1
	if(cnt==len(system)):
		ans+="L"
	
	if(inp==ans):
		print("win")
	else:
		print("loose")
		
func generate_term(index, num_vars):
	var term=[]
	for i in range (num_vars):
		var p=num_vars - i
		if index & (1 << i):
			term.append("x"+str(p))
		else:
			term.append("¬x"+str(p))
	return term

func can_combine(term1, term2):
	var differences=0
	for i in range (min(len(term1), len(term2))):
		if(term1[i]!=term2[i]):
			differences+=1
			if (differences>1):
				return false
	return differences == 1
	

func minimize_terms(terms):
	
	while true:
		var changed = false
		var new_terms = []
		var used = []
		used.resize(terms.size())
		for i in range(terms.size()):
			if used[i]:
				continue
			for j in range(i + 1, terms.size()):
				if used[j]:
					continue
				if can_combine(terms[i], terms[j]):
					var new_term = []
					for k in range(terms[i].size()):
						if terms[i][k] == terms[j][k]:
							new_term.append(terms[i][k])
						else:
							new_term.append("-")
					if not new_terms.has(new_term) and not terms.has(new_term):
						new_terms.append(new_term)
						used[i] = true
						used[j] = true
						changed = true
						break
			if not used[i]:
				new_terms.append(terms[i])
		if not changed:
			break
		terms = new_terms
	var result = []
	for term in terms:
		var dop=[]
		for x in term:
			if x!="-":
				dop.append(x)
		result.append(" ∧ ".join(dop))
		#result.append(" ∧ ".join([x for x in term if x != "-"]))
	return result

func dnf_from_truth_vector(truth_vector):
	var num_vars = log(len(truth_vector))/log(2)
	var terms = []
	
	for i in range(1<<int(num_vars)):
		if truth_vector[i] == '1':
			terms.append(generate_term(i, num_vars))
	
	var minimized_terms = minimize_terms(terms)
	return " ∨ ".join(minimized_terms)
#по сути функция twelveth_task(s) и не нужна, так как она в консоль выводит результат, который возвращает dnf_from_truth_vector(truth_vector)
func twelveth_task(s):
	print(dnf_from_truth_vector(s))

