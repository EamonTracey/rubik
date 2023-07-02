import Collections
import Foundation

protocol ThistlethwaiteStep {
    static var name: String { get }
    static var factor: Int { get }
    static var allowedTurns: [Turn] { get }
    static func encode(_ cube: Cube) -> Int
}

extension ThistlethwaiteStep {
    static func generateTable() -> [String] {
        var statesTable: [String?] = Array(repeating: nil, count: factor)
        var frontier: Deque<(cube: Cube, algorithm: Algorithm)> = [(.solvedCube, .nothing)]
var x = 0
        while let node = frontier.popFirst() {
            let state = encode(node.cube)

            if statesTable[state] != nil {
                continue
            }

            statesTable[state] = node.algorithm.reversed.stringNotation
            x += 1
//            print(x)

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

        return statesTable as! [String]
    }
}

extension ThistlethwaiteStep {
    static func loadTable() -> [String]?{
        var table = [String]()

        // Get file URL of the stored table.
        guard let url = Bundle.module.url(
            forResource: "Tables/thistlethwaite_\(name)", withExtension: .none
        ) else { return nil }

        guard let fileHandle = fopen(url.relativePath, "r") else { return nil }
        var buffer = [CChar](repeating: 0, count: 32)

        // Read the file line by line.
        while fgets(&buffer, 32, fileHandle) != nil {
            // Remove the newline character.
            buffer[strlen(buffer) - 1] = 0

            // Add the algorithm to the table.
            table.append(String(cString: buffer))
        }

        // Close the file handle.
        fclose(fileHandle)

        return table
    }
}
