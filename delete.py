def find_minterms(func_values):
    minterms = []
    for i in range(len(func_values)):
        if func_values[i] == 1:
            minterms.append(format(i, 'b').zfill(len(func_values)))
    return minterms

def combine_terms(terms):
    combined_terms = []
    for i in range(len(terms)):
        for j in range(i+1, len(terms)):
            diff_count = 0
            diff_index = 0
            for k in range(len(terms[i])):
                if terms[i][k] != terms[j][k]:
                    diff_count += 1
                    diff_index = k
            if diff_count == 1:
                new_term = list(terms[i])
                new_term[diff_index] = '-'
                combined_terms.append(''.join(new_term))
    return combined_terms

def simplify_dnf(func_values):
    minterms = find_minterms(func_values)
    combined_terms = minterms.copy()
    
    while True:
        new_combined_terms = combine_terms(combined_terms)
        if new_combined_terms == combined_terms:
            break
        combined_terms = combined_terms + new_combined_terms
    
    dnf = []
    for term in combined_terms:
        dnf_term = []
        for i in range(len(term)):
            if term[i] == '0':
                dnf_term.append('~x' + str(i+1))
            elif term[i] == '1':
                dnf_term.append('x' + str(i+1))
        dnf.append('(' + ' & '.join(dnf_term) + ')')
    
    return ' | '.join(dnf)

# Пример использования
func_values = [0, 1, 0, 1]
dnf = simplify_dnf(func_values)
print(dnf)
