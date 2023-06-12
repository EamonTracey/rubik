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
    }
}

extension Thistlethwaite.StepTwo {
    static var table: [[UInt8]: Algorithm] {
        var stateTable: [[UInt8]: Algorithm] = [:]
        var frontier: Deque<(cube: Cube, algorithm: Algorithm)> = [(.solvedCube, .nothing)]
        
        while stateTable.count < Thistlethwaite.StepTwo.factor, let state = frontier.popFirst() {
            print(stateTable.count)
            
            let thing = state.cube.cornerOrientation.map { $0.rawValue } + [
                UInt8(state.cube.edgePermutation.firstIndex(of: .rightFront)!),
                UInt8(state.cube.edgePermutation.firstIndex(of: .leftFront)!),
                UInt8(state.cube.edgePermutation.firstIndex(of: .rightBack)!),
                UInt8(state.cube.edgePermutation.firstIndex(of: .leftBack)!),
            ].sorted()
            
            if stateTable.keys.contains(
                thing
            ) { continue }
            
            stateTable[
                thing
            ] = state.algorithm
            
            for turn in Thistlethwaite.StepTwo.allowedTurns {
                var adjacentState = state
                adjacentState.cube.turn(turn)
                adjacentState.algorithm = adjacentState.algorithm.appending(turn)
                frontier.append(adjacentState)
            }
        }
        
        return stateTable
    }
}
