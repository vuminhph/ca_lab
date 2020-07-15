def find_largest_consecutive_prod(arr):
    largest_prod = -999

    for i in range(1, len(arr)):
        cur_prod = arr[i] * arr[i - 1]
        if  cur_prod > largest_prod:
            largest_prod = cur_prod
            prod_elems = [arr[i - 1], arr[i]]

    print(f'The product of {prod_elems[0]} and {prod_elems[1]} ({largest_prod})')

find_largest_consecutive_prod([3,6,-2,-5,7,3])