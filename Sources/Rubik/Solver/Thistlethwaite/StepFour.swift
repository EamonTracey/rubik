extension Solver.Thistlethwaite {
    internal enum Four {
        internal static let factor: Int = 663552

        internal static let allowedTurns: [Turn] = [
            .up(.half),
            .down(.half),
            .right(.half),
            .left(.half),
            .front(.half),
            .back(.half)
        ]

        @usableFromInline
        internal static func encode(_ cube: Cube) -> Int {
            var encodedStandingSliceEdgePermutation: Int = 0
            var encodedMiddleSliceEdgePermutation: Int = 0
            var encodedEquatorialSliceEdgePermutation: Int = 0
            var encodedFirstTetradCornerPermutation: Int = 0
            var encodedSecondTetradCornerPermutation: Int = 0
            
            encodedStandingSliceEdgePermutation += cube.edges[0].solvedPosition.rawValue * 67108864
            encodedStandingSliceEdgePermutation += cube.edges[1].solvedPosition.rawValue * 268435456
            encodedStandingSliceEdgePermutation += cube.edges[2].solvedPosition.rawValue * 1073741824
            
            encodedMiddleSliceEdgePermutation += cube.edges[4].solvedPosition.rawValue * 131072
            encodedMiddleSliceEdgePermutation += cube.edges[5].solvedPosition.rawValue * 1048576
            encodedMiddleSliceEdgePermutation += cube.edges[6].solvedPosition.rawValue * 8388608
            
            encodedEquatorialSliceEdgePermutation += cube.edges[8].solvedPosition.rawValue * 512
            encodedEquatorialSliceEdgePermutation += cube.edges[9].solvedPosition.rawValue * 8192
            
            encodedFirstTetradCornerPermutation += cube.corners[0].solvedPosition.rawValue * 8
            encodedFirstTetradCornerPermutation += cube.corners[1].solvedPosition.rawValue * 32
            encodedFirstTetradCornerPermutation += cube.corners[2].solvedPosition.rawValue * 128
            
            encodedSecondTetradCornerPermutation += cube.corners[4].solvedPosition.rawValue
            
            return encodedStandingSliceEdgePermutation + encodedMiddleSliceEdgePermutation +
              encodedEquatorialSliceEdgePermutation + encodedFirstTetradCornerPermutation +
              encodedSecondTetradCornerPermutation
        }

        @usableFromInline
        internal static func generateTable() -> [Int: Algorithm] {
            return traversal(
                factor: factor,
                allowedTurns: allowedTurns,
                stateEncoding: encode
            )
        }
    }
}
