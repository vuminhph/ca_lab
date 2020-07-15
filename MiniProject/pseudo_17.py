def string_stack(str):
    stack = []
    char_count = 0

    for char in str:
        stack.append(char)
        char_count += 1

    print(f'Number of characters in string: {char_count}')
    while char_count != 0:
        print(f'{stack.pop()}')
        char_count -= 1

string_stack('hello world')
