public extension Solver.Thistlethwaite {
    enum Two { }
}

extension Solver.Thistlethwaite.Two: ThistlethwaiteStep {
    static let name: String = "two"

    static let factor: Int = 1082565

    public static let allowedTurns: [Turn] = [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.clockwise), .right(.half), .right(.counterclockwise),
        .left(.clockwise), .left(.half), .left(.counterclockwise),
        .front(.half),
        .back(.half)
    ]

//    @usableFromInline
//    @inlinable
    public static func encode(_ cube: Cube) -> Int {
        var cornerOrientation: Int = 0
        var equatorialSliceCombination: Int = 0

        cornerOrientation += cube.corners[0].orientation.rawValue
        cornerOrientation += cube.corners[1].orientation.rawValue * 3
        cornerOrientation += cube.corners[2].orientation.rawValue * 9
        cornerOrientation += cube.corners[3].orientation.rawValue * 27
        cornerOrientation += cube.corners[4].orientation.rawValue * 81
        cornerOrientation += cube.corners[5].orientation.rawValue * 243
        cornerOrientation += cube.corners[6].orientation.rawValue * 729

        var r = 1
        for (index, edge) in cube.edges.enumerated() where edge.slice == .equatorial {
            equatorialSliceCombination += binomial(index, r)
            r += 1
        }

        return cornerOrientation +
               equatorialSliceCombination * 2187
    }
}
