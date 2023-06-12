import Collections

extension Thistlethwaite {
    enum StepOne {
        /*
         * Step one orients the 12 edges, implying a factor of:
         *   - 2^11 = 2048.
         */
        static let factor = 2048
        
        /*
         * Step one allows all turns.
         */
        static let allowedTurns: [Turn] = [
            .up(.clockwise), .up(.half), .up(.counterclockwise),
            .down(.clockwise), .down(.half), .down(.counterclockwise),
            .right(.clockwise), .right(.half), .right(.counterclockwise),
            .left(.clockwise), .left(.half), .left(.counterclockwise),
            .front(.clockwise), .front(.half), .front(.counterclockwise),
            .back(.clockwise), .back(.half), .back(.counterclockwise)
        ]
        
        static func encodedState(of cube: Cube) -> [UInt8] {
            /*
             * TODO: Document
             */
            
            return cube.edgeOrientation.map { $0.rawValue }
        }
    }
}

extension Thistlethwaite.StepOne {
    static var table: [[UInt8]: Algorithm] = {
        /*
         * TODO: Document
         */
        
        // Since we know the final size of the state table, we can reserve that
        // capacity and thus avoid memory reallocations/copying.
        var stateTable: [[UInt8]: Algorithm] = Dictionary(minimumCapacity: factor)
        
        // The frontier is the pending queue of nodes to be visited in the traversal.
        var frontier: Deque<(cube: Cube, algorithm: Algorithm)> = [(.solvedCube, .nothing)]
        
        while stateTable.count < factor, let node = frontier.popFirst() {
            let state = encodedState(of: node.cube)
            
            // If we have already visited this node, skip it.
            if stateTable.keys.contains(state) {
                continue
            }
            
            // Add the state and its corresponding algorithm to the table.
            stateTable[state] = node.algorithm
            
            // Add all adjacent nodes to the frontier.
            for turn in allowedTurns {
                var adjacentNode = node
                adjacentNode.cube.turn(turn)
                adjacentNode.algorithm = adjacentNode.algorithm.appending(turn)
                frontier.append(adjacentNode)
            }
        }
        
        return stateTable
    }()
}
