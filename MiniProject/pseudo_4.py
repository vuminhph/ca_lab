def array_app():
    arr = []
    len_arr = 0

    arr.append(int(input("Input the first number of the array: ")))
    len_arr += 1
    max_elem = arr[0]

    continue_cfrm = input('Do you want to keep adding number to the array? (y/n) ')
    
    while continue_cfrm.lower() == 'y':
        new_elem = int(input('Input the next number of the array: '))
        if new_elem > max_elem:
            max_elem = new_elem
        arr.append(new_elem)
        len_arr += 1
        
        continue_cfrm = input('Do you want to keep adding number to the array? (y/n) ')
    
    m = int(input('Input the lower bound (m): '))
    M = int(input('Input the upper bound (M): '))
    in_range_count = 0

    for num in arr:
        if m <= num and num <= M:
            in_range_count += 1

    print(f'Max element in the array: {max_elem}')
    print(f'Number of elements in range {m} and {M}: {in_range_count}')
    return arr


print(array_app())