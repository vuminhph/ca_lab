def sort_by_height(arr):
    arr_size = len(arr)

    for i in range(arr_size):
        if arr[i] == -1:
            continue
        
        min_index = 0
        for j in range(i, arr_size):
            if arr[j] == -1:
                continue
            if arr[j] < arr[min_index]:
                min_index = j

        if min_index != 0:
            arr[0], arr[min_index] = arr[min_index], arr[0]

    print(arr)

sort_by_height([-1,150,160,170,-1,-1,180,190])
