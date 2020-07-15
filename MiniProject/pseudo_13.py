def check_lucky(ticket):
    ticket_size = 0
    ticket_digit = []

    while ticket > 0:
        ticket_digit.append(ticket % 10)
        ticket_size += 1
        ticket //= 10

    first_half_sum = 0
    second_half_sum = 0
    ptr1 = 0
    ptr2 = ticket_size - 1

    while ptr1 < ptr2:
        first_half_sum += ticket_digit[ptr1]
        second_half_sum += ticket_digit[ptr2]

        ptr1 += 1
        ptr2 -= 1
    
    return first_half_sum == second_half_sum

print(check_lucky(209327))
