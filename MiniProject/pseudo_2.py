# Project 2

def find_prime_in_range(start, end):
    primes = []

    for num in range(start, end + 1):
        is_prime = True
        for i in range(2, num // 2 + 1):
            if num % i == 0:
                is_prime = False
                break
        if is_prime and num > 1:
            primes.append(num)
    
    return primes

print(find_prime_in_range(0,10))