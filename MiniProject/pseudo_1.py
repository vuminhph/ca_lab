# Project 1

def if_palindrome(word):
    head_ptr = 0
    end_ptr = len(word) - 1
    
    while head_ptr < end_ptr:
        if word[head_ptr] != word[end_ptr]:
            return False
        head_ptr += 1
        end_ptr -= 1

    return True

print(if_palindrome('abc121cba'))