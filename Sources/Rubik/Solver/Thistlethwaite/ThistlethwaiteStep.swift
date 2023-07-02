import Collections
import Foundation

protocol ThistlethwaiteStep {
    static var name: String { get }
    static var factor: Int { get }
    static var allowedTurns: [Turn] { get }
    static func encode(_ cube: Cube) -> Int
}

extension ThistlethwaiteStep {
    static func generateTable() -> [Int: String] {
        var statesTable: [Int: String] = Dictionary(minimumCapacity: factor)
        var frontier: Deque<(cube: Cube, algorithm: Algorithm)> = [(.solvedCube, .nothing)]

        while statesTable.count < factor, let node = frontier.popFirst() {
            let state = encode(node.cube)

            if statesTable.keys.contains(state) {
                continue
            }

            statesTable[state] = node.algorithm.reversed.stringNotation

            for turn in allowedTurns {
                if let lastTurn = node.algorithm.turns.last,
                   turn.sameLayer(as: lastTurn) {
                    continue
                }
                var adjacentNode = node
                adjacentNode.cube.turn(turn)
                adjacentNode.algorithm.append(turn)
                frontier.append(adjacentNode)
            }
        }

        return statesTable
    }
}

extension ThistlethwaiteStep {
    static func loadTable() -> [Int: String]?{
        var table: [Int: String] = Dictionary(minimumCapacity: factor)

        // Get file URL of the stored table.
        guard let url = Bundle.module.url(
            forResource: "Tables/thistlethwaite_\(name)", withExtension: .none
        ) else { return nil }

        // Open the file in read-only mode and reassign stdout to it.
        guard let fileHandle = freopen(url.relativePath, "r", stdin) else { return nil }

        // Read the file in batches of 2 lines. The first line is the unique
        // encoding of the cube. The second line is the corresponding algorithm.
        while let code = readLine(), let algorithm = readLine() {
            // Cast the encoding to Int.
            guard let code = Int(code) else { return nil }

            // Add the (code, algorithm) pair to the table.
            table[code] = algorithm
        }

        // Close the file handle.
        fclose(fileHandle)

        return table
    }
}
