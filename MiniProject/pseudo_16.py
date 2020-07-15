def almostIncreasingSequence(arr):
    for i in range(1, len(arr)):
        if arr[i - 1] >= arr[i]:
            if i + 1 == len(arr):
                return True
            if arr[i - 1] >= arr[i + 1]:
                return False

print(almostIncreasingSequence([2,4,2,4]))