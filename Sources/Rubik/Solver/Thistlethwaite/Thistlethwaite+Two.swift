extension Solver.Thistlethwaite {
    enum Two { }
}

extension Solver.Thistlethwaite.Two: ThistlethwaiteStep {
    static let name: String = "two"

    static let factor: Int = 1082565

    static let allowedTurns: [Turn] = [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.clockwise), .right(.half), .right(.counterclockwise),
        .left(.clockwise), .left(.half), .left(.counterclockwise),
        .front(.half),
        .back(.half)
    ]

    @usableFromInline
    static func encode(_ cube: Cube) -> Int {
        var cornerOrientation: Int = 0
        var equatorialSliceCombination: Int = 0

        cornerOrientation += cube.corners[0].orientation.rawValue * 4096
        cornerOrientation += cube.corners[1].orientation.rawValue * 12288
        cornerOrientation += cube.corners[2].orientation.rawValue * 36864
        cornerOrientation += cube.corners[3].orientation.rawValue * 110592
        cornerOrientation += cube.corners[4].orientation.rawValue * 331776
        cornerOrientation += cube.corners[5].orientation.rawValue * 995328
        cornerOrientation += cube.corners[6].orientation.rawValue * 2985984

        for (index, edge) in cube.edges.enumerated() {
            if edge.solvedPosition.rawValue >= 8 {
                equatorialSliceCombination |= 1 << index
            }
        }

        return cornerOrientation + equatorialSliceCombination
    }
}
