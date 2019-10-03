# https://projecteuler.net/problem=11

import strutils, sequtils, sugar
import neo

proc line_to_seq(line: string): seq[int] =
    line.splitWhitespace.map(x => x.parseInt)

proc read_file(): seq[seq[int]] =
    let filename = "grid.txt"
    let file = readFile(filename)
    file.splitLines().map(line_to_seq)

proc process_mini_matrix(m: Matrix[int]): seq[int] =
    echo m
    let h = m.row(0).foldl(a * b)
    let v = m.column(0).foldl(a * b)
    let d1 = m[0,0] * m[1,1] * m[2,2] * m[3,3]
    let d2 = m[0,3] * m[1,2] * m[2,1] * m[3,0]
    result.add(h)
    result.add(v)
    result.add(d1)
    result.add(d2)

proc main() =
    let size = 4
    let input = read_file()
    let m = matrix(input)
    var results: seq[int] = @[]

    for coor, val in m:
        let (x, y) = coor
        try:
            let mini = m[x..<x+size, y..<y+size]
            let res = mini.process_mini_matrix()
            results = results.concat(res)
        except OutOfBoundsError:
            discard

    echo results.max()



when isMainModule:
    main()