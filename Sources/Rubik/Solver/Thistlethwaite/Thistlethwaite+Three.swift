extension Solver.Thistlethwaite {
    enum Three { }
}

extension Solver.Thistlethwaite.Three: ThistlethwaiteStep {
    static let name = "three"

    static let factor: Int = 999999999

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
//        var firstTetradCombination: Int = 0

        for (index, edge) in cube.edges[0...7].enumerated() where edge.slice == .middle {
                middleSliceCombination |= 256 << index
        }

//        for (index, corner) in cube.corners.enumerated() where corner.tetrad == .first {
//                firstTetradCombination |= 1 << index
//        }

        // TODO: CALCULATE TETRAD TWIST.
        // I.E. GET RID OF MORE RESTRICTIVE HULLABALOO
        // UNREADABLE IMPLIES INCOMPLETE
        var a=0;var b=0;var c=0;var d=0;var e=0;for(index,corner)in cube.corners.enumerated(){if corner.solvedPosition == .upRightFront||corner.solvedPosition == .upLeftBack{a|=65536<<index}else if corner.solvedPosition == .upRightBack||corner.solvedPosition == .upLeftFront{b|=16777216<<index}else if corner.solvedPosition == .downRightFront||corner.solvedPosition == .downLeftBack{c|=4294967296<<index}else if corner.solvedPosition == .downRightBack||corner.solvedPosition == .downLeftFront{d|=1099511627776<<index};for corb in cube.corners[(index+1)...] where corner.solvedPosition>corb.solvedPosition{e+=1}};e %= 2

        return middleSliceCombination + a+b+c+d+e // + firstTetradCombination
    }
}
