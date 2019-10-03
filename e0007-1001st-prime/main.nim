import math

proc is_prime(n: int): bool =
    if n == 2:
        return true

    let max = sqrt(n.float).int

    for i in countup(2, max):
        if n.mod(i) == 0:
            return false
    true

proc find_prime(target: int): int =
    var primes_found = 0
    var n = 0

    while primes_found <= target:
        n.inc
        if is_prime(n):
            primes_found.inc

    n


echo find_prime(10001)