def arrayChange(arr):
    change_count = 0
    
    for i in range(1, len(arr)):
        while arr[i] <= arr[i - 1]:
            arr[i] += 1
            change_count += 1

    return change_count

print(arrayChange([1,1,1]))