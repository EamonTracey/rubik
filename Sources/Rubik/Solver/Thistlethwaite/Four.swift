extension Solver.Thistlethwaite {
    enum Four {
        static let factor: Int = 663552

        static let allowedTurns: [Turn] = [
            .up(.half),
            .down(.half),
            .right(.half),
            .left(.half),
            .front(.half),
            .back(.half)
        ]

        @usableFromInline
        static func encode(_ cube: Cube) -> Int {
            var standingSlicePermutation: Int = 0
            var middleSlicePermutation: Int = 0
            var equatorialSlicePermutation: Int = 0
            var firstTetradPermutation: Int = 0
            var secondTetradPermutation: Int = 0
            
            standingSlicePermutation += cube.edges[0].solvedPosition.rawValue * 67108864
            standingSlicePermutation += cube.edges[1].solvedPosition.rawValue * 268435456
            standingSlicePermutation += cube.edges[2].solvedPosition.rawValue * 1073741824
            
            middleSlicePermutation += cube.edges[4].solvedPosition.rawValue * 131072
            middleSlicePermutation += cube.edges[5].solvedPosition.rawValue * 1048576
            middleSlicePermutation += cube.edges[6].solvedPosition.rawValue * 8388608
            
            equatorialSlicePermutation += cube.edges[8].solvedPosition.rawValue * 512
            equatorialSlicePermutation += cube.edges[9].solvedPosition.rawValue * 8192
            
            firstTetradPermutation += cube.corners[0].solvedPosition.rawValue * 8
            firstTetradPermutation += cube.corners[1].solvedPosition.rawValue * 32
            firstTetradPermutation += cube.corners[2].solvedPosition.rawValue * 128
            
            secondTetradPermutation += cube.corners[4].solvedPosition.rawValue
            
            return standingSlicePermutation + middleSlicePermutation +
              equatorialSlicePermutation + firstTetradPermutation +
              secondTetradPermutation
        }

        @usableFromInline
        static func generateTable() -> [Int: String] {
            return traversal(
                factor: factor,
                allowedTurns: allowedTurns,
                stateEncoding: encode
            )
        }
    }
}
