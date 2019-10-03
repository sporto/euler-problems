import math, sequtils

proc is_prime(n: int): bool =
    if n == 2:
        return true

    let max = sqrt(n.float).int

    for i in countup(2, max):
        if n.mod(i) == 0:
            return false
    true

proc collect_primes(below: int): seq[int] =
    for i in (2..<below):
        if is_prime(i):
            result.add(i)


echo collect_primes(2_000_000).foldl(a + b)