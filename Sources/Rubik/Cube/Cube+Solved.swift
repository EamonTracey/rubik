extension Cube {
    /// The array of edges that corresponds to a solved cube.
    ///
    /// The array is sorted ascendingly by the `solvedPosition` of each ``Edge``.
    public static let solvedEdges: [Edge] = Edge.Position.allCases.map { position in
        Edge(orientation: .correct, solvedPosition: position)
    }
    
    /// The array of corners that corresponds to a solved cube.
    ///
    /// The array is sorted ascendingly by the `solvedPosition` of each ``Corner``.
    public static let solvedCorners: [Corner] = Corner.Position.allCases.map { position in
        Corner(orientation: .correct, solvedPosition: position)
    }
    
    /// The cube in the solved state.
    public static let solvedCube: Cube = Cube(edges: Cube.solvedEdges, corners: Cube.solvedCorners)
}
