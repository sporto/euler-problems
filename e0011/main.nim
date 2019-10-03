import strutils, sequtils, sugar

proc line_to_seq(line: string): seq[int] =
    line.splitWhitespace.map(x => x.parseInt)

proc read_file(): seq[seq[int]] =
    let filename = "grid.txt"
    let file = readFile(filename)
    file.splitLines().map(line_to_seq)

proc main() =
    echo read_file()


when isMainModule:
    main()