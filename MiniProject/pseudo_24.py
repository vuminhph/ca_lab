def is_cyclone_word(word):
    ptr = 0
    last_ptr = len(word) - 1

    while ptr != last_ptr // 2:
        next_ptr = last_ptr - ptr
        if ptr > last_ptr // 2:
            next_ptr += 1
        
        if word[next_ptr].lower() < word[ptr].lower():
            return False

        ptr = next_ptr

    return True

print(is_cyclone_word('AdJourned'))