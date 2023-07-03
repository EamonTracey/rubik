extension Solver.Thistlethwaite {
    enum Three { }
}
func mod(_ a: Int, _ n: Int) -> Int {
    precondition(n > 0, "modulus must be positive")
    let r = a % n
    return r >= 0 ? r : r + n
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

        var r = 1
        for (index, edge) in cube.edges[0...7].enumerated() where edge.slice == .middle {
            middleSliceCombination += binomial(index, r)
            r += 1
        }

        r = 1
        for (index, corner) in cube.corners.enumerated() where corner.tetrad == .first {
            firstTetradCombination += binomial(index, r)
            r += 1
        }
        firstTetradCombination *= 70

        // tetrad twist + PARITY :o
        var firsts = [Cube.Corner.Position]()
        var seconds = [Cube.Corner.Position]()
        for corner in cube.corners {
            if corner.tetrad == .first { firsts.append(corner.solvedPosition) } else { seconds.append(corner.solvedPosition) }
        }
        var pfirst = 0
        for (index, cornerA) in firsts.enumerated() {
            pfirst *= 4 - index
            for cornerB in firsts where cornerA > cornerB {
                pfirst += 1
            }
        }
        var psecond = 0
        for (index, cornerA) in seconds.enumerated() {
            psecond *= 4 - index
            for cornerB in seconds where cornerA > cornerB {
                psecond += 1
            }
        }
        var tp = mod((pfirst)-(psecond), 6)
        print("\(pfirst) \(psecond) \(tp)")
        tp *= 4900

        

        // TODO: CALCULATE TETRAD TWIST.
        // I.E. GET RID OF MORE RESTRICTIVE HULLABALOO
        // UNREADABLE IMPLIES INCOMPLETE
//        var a=0;var b=0;var c=0;var d=0;var e=0;for(f,g)in cube.corners.enumerated(){if g.solvedPosition == .upRightFront||g.solvedPosition == .upLeftBack{a|=65536<<f}else if g.solvedPosition == .upRightBack||g.solvedPosition == .upLeftFront{b|=16777216<<f}else if g.solvedPosition == .downRightFront||g.solvedPosition == .downLeftBack{c|=4294967296<<f}else if g.solvedPosition == .downRightBack||g.solvedPosition == .downLeftFront{d|=1099511627776<<f};for corb in cube.corners[(f+1)...] where g.solvedPosition>corb.solvedPosition{e+=1}};e%=2

        return middleSliceCombination + firstTetradCombination + tp//+ a+b+c+d+e //
    }
}
