extension Solver.Thistlethwaite {
    enum One { }
}

extension Solver.Thistlethwaite.One: ThistlethwaiteStep {
    static let name: String = "one"
    
    static let factor: Int = 2048

    static let allowedTurns: [Turn] = [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.clockwise), .right(.half), .right(.counterclockwise),
        .left(.clockwise), .left(.half), .left(.counterclockwise),
        .front(.clockwise), .front(.half), .front(.counterclockwise),
        .back(.clockwise), .back(.half), .back(.counterclockwise),
    ]

    @usableFromInline
    static func encode(_ cube: Cube) -> Int {
        var edgeOrientation: Int = 0
        
        edgeOrientation += cube.edges[0].orientation.rawValue
        edgeOrientation += cube.edges[1].orientation.rawValue * 2
        edgeOrientation += cube.edges[2].orientation.rawValue * 4
        edgeOrientation += cube.edges[3].orientation.rawValue * 8
        edgeOrientation += cube.edges[4].orientation.rawValue * 16
        edgeOrientation += cube.edges[5].orientation.rawValue * 32
        edgeOrientation += cube.edges[6].orientation.rawValue * 64
        edgeOrientation += cube.edges[7].orientation.rawValue * 128
        edgeOrientation += cube.edges[8].orientation.rawValue * 256
        edgeOrientation += cube.edges[9].orientation.rawValue * 512
        edgeOrientation += cube.edges[10].orientation.rawValue * 1024
        
        return edgeOrientation
    }
}
