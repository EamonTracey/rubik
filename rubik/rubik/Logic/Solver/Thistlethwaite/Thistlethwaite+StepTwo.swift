import Collections

extension Thistlethwaite {
    enum StepTwo {
        /*
         * Step two orients the 8 corners and places the middle layer edges into
         * their slice, implying a factor:
         *   - 3^7 * 12C4 = 3^7 * 12!/8!/4! = 1082565
         */
        static let factor = 1082565
        
        /*
         * Since the edges are oriented in step one, quarter turns of the F and
         * B layers are unnecessary for the proceeding steps. Step two allows
         * the remaining 14 turns.
         */
        static let allowedTurns: [Turn] = [
            .up(.clockwise), .up(.half), .up(.counterclockwise),
            .down(.clockwise), .down(.half), .down(.counterclockwise),
            .right(.clockwise), .right(.half), .right(.counterclockwise),
            .left(.clockwise), .left(.half), .left(.counterclockwise),
            .front(.half),
            .back(.half)
        ]
        
        static func encodedState(of cube: Cube) -> [UInt8] {
            /*
             * TODO: Document
             */
            
            let state: [UInt8] = cube.cornerOrientation.map { $0.rawValue }
            var middleLayerEdgePositions: [UInt8] = Array(repeating: 0, count: 4)
            
            let edgePermutation = cube.edgePermutation
            for index in edgePermutation.indices {
                if edgePermutation[index] == .rightFront { middleLayerEdgePositions[0] = UInt8(index) }
                else if edgePermutation[index] == .rightBack { middleLayerEdgePositions[1] = UInt8(index) }
                else if edgePermutation[index] == .leftFront { middleLayerEdgePositions[2] = UInt8(index) }
                else if edgePermutation[index] == .leftBack { middleLayerEdgePositions[3] = UInt8(index) }
            }
            
            return state + middleLayerEdgePositions.sorted()
        }
    }
}

extension Thistlethwaite.StepTwo {
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
