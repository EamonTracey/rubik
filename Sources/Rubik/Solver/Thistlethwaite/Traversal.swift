import Collections

extension Solver.Thistlethwaite {
    @usableFromInline
    static func traversal(
        factor: Int, allowedTurns: [Turn],
        stateEncoding: (Cube) -> (Int)
    ) -> [Int: Algorithm] {
        var statesTable: [Int: Algorithm] = Dictionary(minimumCapacity: factor)
        var frontier: Deque<(cube: Cube, algorithm: Algorithm)> = [(.solvedCube, .nothing)]
        
        while statesTable.count < factor, let node = frontier.popFirst() {
            let state = stateEncoding(node.cube)
            
            if statesTable.keys.contains(state) {
                continue
            }
            
            statesTable[state] = node.algorithm.reversed
            
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
