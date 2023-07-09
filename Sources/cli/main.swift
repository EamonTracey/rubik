import Rubik

func generate_table_idfs(size: Int, allowed_moves: [Turn], encode: (Cube) -> (Int)) {
    var maxdepth = 0

    var database: [Int] = Array(repeating: 100, count: size)

    var count = 0

    while count < size {
        var visited = Array(repeating: false, count: size)


        if iterative_deepening(cube: .solvedCube, size: size, allowed_moves: allowed_moves, encode: encode, database: &database, count: &count, depth: 0, maxDepth: maxdepth, visited: &visited, lastTurn: nil) {
            //break
        }

        print("Depth \(maxdepth): \(count)")

        maxdepth += 1
    }

}

func iterative_deepening(cube: Cube, size: Int, allowed_moves: [Turn], encode: (Cube) -> (Int), database: inout [Int], count: inout Int, depth: Int, maxDepth: Int, visited: inout [Bool], lastTurn: Turn?) -> Bool {

    let state = encode(cube)

    if visited[state] || depth > database[state] { return false }

    visited[state] = true

    if depth == maxDepth {
        database[state] = depth
        count += 1
        return count == size
    }

    for turn in allowed_moves {
        if let lastTurn = lastTurn { if turn == lastTurn { continue } }
        var adjacent = cube
        adjacent.turn(turn)
        if iterative_deepening(cube: adjacent, size: size, allowed_moves: allowed_moves, encode: encode, database: &database, count: &count, depth: depth + 1, maxDepth: maxDepth, visited: &visited, lastTurn: turn) {
            return true
        }
    }

    return false

}

generate_table_idfs(size: 29400, allowed_moves: Solver.Thistlethwaite.Three.allowedTurns, encode: Solver.Thistlethwaite.Three.encode(_:))
