extension Solver.Thistlethwaite {
    enum Three { }
}

extension Solver.Thistlethwaite.Three: ThistlethwaiteStep {
    static let name = "three"

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
        var middleSliceCombination: Int = 0
        var firstTetradCombination: Int = 0

        for (index, edge) in cube.edges[0...7].enumerated() where edge.slice == .middle {
                middleSliceCombination |= 256 << index
        }

        for (index, corner) in cube.corners.enumerated() where corner.tetrad == .first {
                firstTetradCombination |= 1 << index
        }

        return middleSliceCombination + firstTetradCombination
    }
}
