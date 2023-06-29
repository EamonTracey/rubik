extension Solver.Thistlethwaite {
    enum Three {
        static let factor: Int = 29400

        static let allowedTurns: [Turn] = [
            .up(.clockwise), .up(.half), .up(.counterclockwise),
            .down(.clockwise), .down(.half), .down(.counterclockwise),
            .right(.half),
            .left(.half),
            .front(.half),
            .back(.half)
        ]

        @usableFromInline
        static func encode(_ cube: Cube) -> Int {
            var encodedMiddleSliceEdgeCombination: Int = 0
            var encodedFirstTetradCornerCombination: Int = 0
            
            for (index, edge) in cube.edges[0...7].enumerated() {
                if edge.solvedPosition.rawValue - 4 >= 0 {
                    encodedMiddleSliceEdgeCombination |= 256 << index
                }
            }
            
            for (index, corner) in cube.corners.enumerated() {
                if corner.solvedPosition.rawValue - 4 >= 0 {
                    encodedFirstTetradCornerCombination |= 1 << index
                }
            }
            
            return encodedMiddleSliceEdgeCombination + encodedFirstTetradCornerCombination
        }

        @usableFromInline
        static func generateTable() -> [Int: Algorithm] {
            return traversal(
                factor: factor,
                allowedTurns: allowedTurns,
                stateEncoding: encode
            )
        }

    }
}
