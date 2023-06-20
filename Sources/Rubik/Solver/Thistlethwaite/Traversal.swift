import Collections

public extension Solver {
    @inlinable
    func thistlethwaiteTraversal<State: Hashable>(
        factor: Int,
        allowedTurns: [Turn],
        stateEncoding: (Cube) -> (State)
    ) -> [State: Algorithm] {
        var statesTable: [State: Algorithm] = Dictionary(minimumCapacity: factor)
        var frontier: Deque<(cube: Cube, algorithm: Algorithm)> = [(.solvedCube, .nothing)]
        
        while statesTable.count < factor, let node = frontier.popFirst() {
            let state = stateEncoding(node.cube)
            
            if statesTable.keys.contains(state) {
                continue
            }
            
            statesTable[state] = node.algorithm
            print(statesTable.count)
            
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
