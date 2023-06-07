extension Cube {
    // [(0, 0), (1, 0), (2, 0), (3, 0), (4, 0), (5, 0), (6, 0), (7, 0), (8, 0), (9, 0), (10, 0), (11 0)]
    static let solvedEdges = EdgePosition.allCases.map { Edge(solvedPosition: $0, orientation: .correct) }
    
    // [(0, 0), (1, 0), (2, 0), (3, 0), (4, 0), (5, 0), (6, 0), (7, 0)]
    static let solvedCorners = CornerPosition.allCases.map { Corner(solvedPosition: $0, orientation: .correct) }

    static let solvedCube = Cube(
        edges: solvedEdges,
        corners: solvedCorners
    )
}
