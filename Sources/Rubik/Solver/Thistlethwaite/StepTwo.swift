internal let thistlethwaiteTwoLimit: Int = 1082565

internal let thistlethwaiteTwoAllowedTurns: [Turn] = [
    .up(.clockwise), .up(.half), .up(.counterclockwise),
    .down(.clockwise), .down(.half), .down(.counterclockwise),
    .right(.clockwise), .right(.half), .right(.counterclockwise),
    .left(.clockwise), .left(.half), .left(.counterclockwise),
    .front(.half),
    .back(.half)
]

@inlinable
internal func encodeThistlethwaiteTwo(_ cube: Cube) -> Int {
    var encodedCornerOrientation: Int = 0
    var encodedEquatorialSliceEdgeCombination: Int = 0
    
    encodedCornerOrientation += cube.corners[0].orientation.rawValue * 4096
    encodedCornerOrientation += cube.corners[1].orientation.rawValue * 12288
    encodedCornerOrientation += cube.corners[2].orientation.rawValue * 36864
    encodedCornerOrientation += cube.corners[3].orientation.rawValue * 110592
    encodedCornerOrientation += cube.corners[4].orientation.rawValue * 331776
    encodedCornerOrientation += cube.corners[5].orientation.rawValue * 995328
    encodedCornerOrientation += cube.corners[6].orientation.rawValue * 2985984
    
    for (index, edge) in cube.edges.enumerated() {
        if edge.solvedPosition.rawValue >= 8 {
            encodedEquatorialSliceEdgeCombination |= 1 << index
        }
    }
    
    return encodedCornerOrientation + encodedEquatorialSliceEdgeCombination
}

extension Solver {
    @inlinable
    internal func generateThistlethwaiteTwoTable() -> [Int: Algorithm] {
        return self.thistlethwaiteTraversal(
            factor: thistlethwaiteTwoLimit,
            allowedTurns: thistlethwaiteTwoAllowedTurns,
            stateEncoding: encodeThistlethwaiteTwo
        )
    }
}
