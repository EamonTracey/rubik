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
            
            for turn in allowedTurns {
//                if turn.stringNotation.first == node.algorithm.turns.last?.stringNotation.first { continue }
                var adjacentNode = node
                adjacentNode.cube.turn(turn)
                adjacentNode.algorithm.append(turn)
                frontier.append(adjacentNode)
            }
        }
        
        return statesTable
    }
}
