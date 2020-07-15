def count_unique_chars(str):
    char_record = []
    unique_chars = 0

    for char in str:
        if char not in char_record:
            char_record.append(char)
            unique_chars += 1
    
    return unique_chars

print(count_unique_chars('cabca'))