from prettytable import PrettyTable

def while_loop(cleaned_code):
    final_code=[]
    for i in range(len(cleaned_code)):
        codeline=cleaned_code[i]
        if 'while' in codeline:
            startidx=codeline.index('(')
            endidx=codeline.index(')')
            bool_cond=''.join(codeline[startidx:endidx+1])
            final_code.append('if !{} goto{})'.format(bool_cond,None))
            while_idx=i
        elif '}'in codeline:
            final_code.append('goto{})'.format(while_idx+1))
            final_code[while_idx]=final_code[while_idx].replace(None, str(i+2))
        else:
            final_code.append(codeline)
    return final_code

with open('while.txt') as f:
    code=f.readlines()

print('The statement is : ')
print(''.join(code))

cleaned_code=[]
for i in range(len(code)):
    if code[i]!='\n':
        cleaned_code.append(code[i][:-1].strip())
    else:
        cleaned_code.append(code[i].strip())

final_code=while_loop(cleaned_code)
final_code.append("END")

x1=PrettyTable()
x1.field_names=['Index','Code']
for i in range(len(final_code)):
    x1.add_row(i+1,final_code[i])

print(x1)
