import strutils, sequtils, sugar, unicode
import neo

proc line_to_seq(line: string): seq[int] =
    line.toRunes.map(x => x.toUTF8.parseInt)

proc read_file(): seq[seq[int]] =
    let filename = "input.txt"
    let file = readFile(filename)
    file.splitLines().map(line_to_seq)

proc sum(): seq[int] =
    let input = read_file()
    let m = matrix(input)
    var carry = 0
    var reversed: seq[int] = @[]

    for col_ix in countdown(m.row(0).len - 1, 0):
        let col = m.column(col_ix)
        let sum = col.foldl(a + b)
        echo ("sum " & $sum)
        let sum_with_carry = sum + carry
        echo ("sum_with_carry " & $sum_with_carry)
        let v = sum_with_carry.mod(10)
        carry = sum_with_carry.div 10
        echo v
        echo carry
        reversed.add(v)

    reversed.add(carry)

    for i in countdown(reversed.len - 1 , 0):
        result.add(reversed[i])

let all = sum()
echo all.join()[0..9]