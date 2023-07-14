import Collections
@_spi(Tables) import Cubik

func generateThistlethwaiteTable(
    factor: Int,
    allowedTurns: [Turn],
    encode: (Cube) -> (Int)
) -> [String] {
    var algorithmsTable: [String?] = Array(repeating: nil, count: factor)
    var frontier: Deque<(cube: Cube, algorithm: Algorithm)> = [(.solvedCube, .nothing)]

    while let node = frontier.popFirst() {
        let state = encode(node.cube)

        if algorithmsTable[state] != nil {
            continue
        }

        algorithmsTable[state] = node.algorithm.reversed.compressedString

        for turn in allowedTurns {
            if let lastTurn = node.algorithm.turns.last,
               turn.sameLayer(as: lastTurn) {
                continue
            }
            var adjacentNode = node
            adjacentNode.cube.turn(turn)
            adjacentNode.algorithm.turns.append(turn)
            frontier.append(adjacentNode)
        }
    }

    return algorithmsTable as! [String]
}

func write(table: [String], to path: String) throws {
    let string = table.joined(separator: "\n") + "\n"
    try string.write(toFile: path, atomically: true, encoding: .ascii)
}
