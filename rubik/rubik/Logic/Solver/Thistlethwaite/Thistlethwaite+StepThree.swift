import Collections

/*
 * TODO: ONLY PARTIALLY DONE SO FAR
 */

extension Thistlethwaite {
    enum StepThree {
        /*
         * TODO: Document
         */
        static let factor = 352800
        
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
            var t1: [UInt8] = []
            var t2: [UInt8] = []
            var t3: [UInt8] = []
            var t4: [UInt8] = []
            
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
                if cornerPermutation[index] == .upRightFront { t1.append(UInt8(index)) }
                else if cornerPermutation[index] == .upLeftBack { t1.append(UInt8(index)) }
                else if cornerPermutation[index] == .downLeftFront { t2.append(UInt8(index)) }
                else if cornerPermutation[index] == .downRightBack { t2.append(UInt8(index)) }
                else if cornerPermutation[index] == .upRightBack { t3.append(UInt8(index)) }
                else if cornerPermutation[index] == .upLeftFront { t3.append(UInt8(index)) }
                else if cornerPermutation[index] == .downRightFront { t4.append(UInt8(index)) }
                else if cornerPermutation[index] == .downLeftBack { t4.append(UInt8(index)) }
            }
            
//            t[Int(CornerPosition.upRightFront.rawValue)] = t1[0]
//            t[Int(CornerPosition.upLeftBack.rawValue)] = t1[1]
//            t[Int(CornerPosition.downLeftFront.rawValue)] = t1[2]
//            t[Int(CornerPosition.downRightBack.rawValue)] = t1[3]
//
//            t[Int(CornerPosition.upRightBack.rawValue)] = t2[0]
//            t[Int(CornerPosition.upLeftFront.rawValue)] = t2[1]
//            t[Int(CornerPosition.downRightFront.rawValue)] = t2[2]
//            t[Int(CornerPosition.downLeftBack.rawValue)] = t2[3]
            
            var cornerInversions: UInt8 = 0
            for a in cube.corners.indices {
                for b in cube.corners.indices {
                    if a < b && cube.corners[a].solvedPosition > cube.corners[b].solvedPosition {
                        cornerInversions += 1
                    }
                }
            }
            cornerInversions %= 2
            
            return m.sorted() + s.sorted() + t1.sorted() + t2.sorted() + t3.sorted() + t4.sorted() + [cornerInversions]
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
