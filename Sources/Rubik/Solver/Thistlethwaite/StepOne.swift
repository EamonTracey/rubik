internal let thistlethwaiteOneLimit: Int = 2048

internal let thistlethwaiteOneAllowedTurns: [Turn] = [
    .up(.clockwise), .up(.half), .up(.counterclockwise),
    .down(.clockwise), .down(.half), .down(.counterclockwise),
    .right(.clockwise), .right(.half), .right(.counterclockwise),
    .left(.clockwise), .left(.half), .left(.counterclockwise),
    .front(.clockwise), .front(.half), .front(.counterclockwise),
    .back(.clockwise), .back(.half), .back(.counterclockwise),
]

@usableFromInline
internal func encodeThistlethwaiteOne(_ cube: Cube) -> Int {
    var encodedEdgeOrientation: Int = 0
    
    encodedEdgeOrientation += cube.edges[0].orientation.rawValue
    encodedEdgeOrientation += cube.edges[1].orientation.rawValue * 2
    encodedEdgeOrientation += cube.edges[2].orientation.rawValue * 4
    encodedEdgeOrientation += cube.edges[3].orientation.rawValue * 8
    encodedEdgeOrientation += cube.edges[4].orientation.rawValue * 16
    encodedEdgeOrientation += cube.edges[5].orientation.rawValue * 32
    encodedEdgeOrientation += cube.edges[6].orientation.rawValue * 64
    encodedEdgeOrientation += cube.edges[7].orientation.rawValue * 128
    encodedEdgeOrientation += cube.edges[8].orientation.rawValue * 256
    encodedEdgeOrientation += cube.edges[9].orientation.rawValue * 512
    encodedEdgeOrientation += cube.edges[10].orientation.rawValue * 1024
    
    return encodedEdgeOrientation
}

extension Solver {
    @usableFromInline
    internal func generateThistlethwaiteOneTable() -> [Int: Algorithm] {
        return self.thistlethwaiteTraversal(
            factor: thistlethwaiteOneLimit,
            allowedTurns: thistlethwaiteOneAllowedTurns,
            stateEncoding: encodeThistlethwaiteOne
        )
    }
}
