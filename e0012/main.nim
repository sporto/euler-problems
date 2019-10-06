import math, sequtils, sugar

const primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157]

proc find_smallest_factors(n: int): seq[int] =
    for prime in primes:
        let factor = n.div prime
        if factor * prime == n:
            if factor == 1:
                return @[prime]
            return @[prime].concat(find_smallest_factors(factor))

proc find_factors(n: int): seq[int] =
    let factors = find_smallest_factors(n)
    for i in factors:
        let additional = result.map(x => x * i)
        result = result.concat(additional)
        result.add(i)
    return result.deduplicate()


proc main() =
    var acc = 0
    for i in (1..50000):
        acc += i
        if acc.mod(2) != 0:
            continue
        let count = find_factors(acc).len
        echo ($i & " -> " & $acc & " => " & $count)
        if count > 500:
            echo acc
            break

main()
