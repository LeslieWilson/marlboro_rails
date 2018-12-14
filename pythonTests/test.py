from IPython.core.debugger import set_trace
def add_some_numbers():
    print("type a  number you'd like to add ")
    array_of_numbers = []
    blahsum = 0
    borginput = 0
    while borginput != '':
        borginput = input()
        array_of_numbers.append(borginput)
        set_trace()
    for i in array_of_numbers:
        blahsum +=  i
        return blahsum

print(add_some_numbers())
