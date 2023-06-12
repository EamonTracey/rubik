import Collections

/*
 * TODO: ONLY PARTIALLY DONE SO FAR
 */

extension Thistlethwaite {
    enum StepThree {
        /*
         * TODO: Document
         */
        static let factor = 4900
        
        /*
         * TODO: Document
         */
        static let allowedTurns: [Turn] = [
            .up(.clockwise), .up(.half), .up(.counterclockwise),
            .down(.clockwise), .down(.half), .down(.counterclockwise),
            .right(.half),
            .left(.half),
            .front(.half),
            .back(.half)
        ]
        
        static func encodedState(of cube: Cube) -> [UInt8] {
            /*
             * TODO: Document
             */
                        
            var m: [UInt8] = Array(repeating: 0, count: 4)
            var s: [UInt8] = Array(repeating: 0, count: 4)
            var u: [UInt8] = Array(repeating: 0, count: 4)
            var d: [UInt8] = Array(repeating: 0, count: 4)
            
            let edgePermutation = cube.edgePermutation
            for index in edgePermutation.indices {
                if edgePermutation[index] == .upFront { m[0] = UInt8(index) }
                else if edgePermutation[index] == .upBack { m[1] = UInt8(index) }
                else if edgePermutation[index] == .downFront { m[2] = UInt8(index) }
                else if edgePermutation[index] == .downBack { m[3] = UInt8(index) }
                else if edgePermutation[index] == .upRight { s[0] = UInt8(index) }
                else if edgePermutation[index] == .upLeft { s[1] = UInt8(index) }
                else if edgePermutation[index] == .downRight { s[2] = UInt8(index) }
                else if edgePermutation[index] == .downLeft { s[3] = UInt8(index) }
            }
            
            let cornerPermutation = cube.cornerPermutation
            for index in cornerPermutation.indices {
                if cornerPermutation[index] == .upRightFront { u[0] = UInt8(index) }
                else if cornerPermutation[index] == .upRightBack { u[1] = UInt8(index) }
                else if cornerPermutation[index] == .upLeftFront { u[2] = UInt8(index) }
                else if cornerPermutation[index] == .upLeftBack { u[3] = UInt8(index) }
                else if cornerPermutation[index] == .downRightFront { d[0] = UInt8(index) }
                else if cornerPermutation[index] == .downRightBack { d[1] = UInt8(index) }
                else if cornerPermutation[index] == .downLeftFront { d[2] = UInt8(index) }
                else if cornerPermutation[index] == .downLeftBack { d[3] = UInt8(index) }
            }
            
            return m.sorted() + s.sorted() + u.sorted() + d.sorted()
        }
    }
}

extension Thistlethwaite.StepThree {
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
