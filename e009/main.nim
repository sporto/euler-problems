import math, options

proc find_triplets(c: int): seq[(int, int, int)] =
    for a in (1..c-1):
        for b in (a+1..c-1):
            if a * a + b * b == c * c:
                let triplet = (a, b, c)
                result.add(triplet)


proc find(): void =
    let max = 500
    var seed = 5
    while seed < max:
        let triplets = find_triplets(seed)
        # echo triplets
        for triplet in triplets:
            let (a,b,c) = triplet
            let sum = a + b + c
            if sum == 1000:
                echo sum
                echo triplet
                echo a * b * c
                seed = max

        seed.inc

find()