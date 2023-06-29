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
                if let lastTurn = node.algorithm.turns.last, turn.sameLayer(as: lastTurn) {
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
    static func loadTable() -> [Int: String]? {
        if let url = Bundle.module.url(forResource: "Tables/thistlethwaite_\(name)", withExtension: "json"),
          let data = try? Data(contentsOf: url), let dict = try? JSONDecoder().decode([Int: String].self, from: data) {
            return dict
        }
        return nil
    }
}
