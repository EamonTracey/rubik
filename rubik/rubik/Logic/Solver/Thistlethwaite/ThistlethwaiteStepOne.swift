import Collections

extension Thistlethwaite {
    enum StepOne {
        /*
         * Step one orients the 12 edges of the cube, implying a factor of 2^11 = 2048.
         */
        static let factor = 2048
        
        /*
         * All turns are used in step one.
         */
        static let allowedTurns: [Turn] = [
            .up(.clockwise), .up(.half), .up(.counterclockwise),
            .down(.clockwise), .down(.half), .down(.counterclockwise),
            .right(.clockwise), .right(.half), .right(.counterclockwise),
            .left(.clockwise), .left(.half), .left(.counterclockwise),
            .front(.clockwise), .front(.half), .front(.counterclockwise),
            .back(.clockwise), .back(.half), .back(.counterclockwise)
        ]
    }
}

extension Thistlethwaite.StepOne {
    /*
     * The first step of Thistlethwaite's method is to orient the edges. There are
     * 2^11 = 2048 distinct states of the cube that relate to edge orientation. This
     * step requires at most 7 turns.
     *
     * The set of turns used in step one is all 18. Remember that quarter turns of the F
     * and B layers cause edges to flip orientations.
     */
    
    static var table: [[EdgeOrientation]: Algorithm] {
        var stateTable: [[EdgeOrientation]: Algorithm] = [:]
        var frontier: Deque<(Cube, Algorithm)> = [(.solvedCube, .nothing)]
        
        while stateTable.count < Thistlethwaite.StepOne.factor, let state = frontier.popFirst() {
            // If we have already visited this state, skip it.
            if stateTable.keys.contains(state.0.edgeOrientation) {
                continue
            }
            
            // Add the state and its corresponding algorithm to the table.
            stateTable[state.0.edgeOrientation] = state.1
            
            // Add all adjacent states to the queue to be visited.
            for turn in Thistlethwaite.StepOne.allowedTurns {
                var adjacentState = state
                adjacentState.0.turn(turn)
                adjacentState.1 = adjacentState.1.appending(turn)
                frontier.append(adjacentState)
            }
        }
        
        return stateTable
    }
}
