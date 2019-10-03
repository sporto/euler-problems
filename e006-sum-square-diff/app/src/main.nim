# import fp/asStream
import sequtils, sugar

proc sum_of_squares(n: int): int =
    toSeq(1..n)
        .map(x => x * x)
        .foldl(a + b)

proc square_of_sum(n: int): int =
    let sum = toSeq(1..n)
        .foldl(a + b)
    sum * sum

proc diff(n: int) :int =
    square_of_sum(n) - sum_of_squares(n)

echo diff(100)