extension Cube {
    /// The array of edges that corresponds to a solved cube.
    ///
    /// The array is sorted ascendingly by the `solvedPosition` of each ``Edge``. Further, the
    /// orientation of each edge is correct.
    public static let solvedEdges: [Edge] = Edge.Position.allCases.map { position in
        Edge(orientation: .correct, solvedPosition: position)
    }

    /// The array of corners that corresponds to a solved cube.
    ///
    /// The array is sorted ascendingly by the `solvedPosition` of each ``Corner``. Further, the
    /// orientation of each corner is correct.
    public static let solvedCorners: [Corner] = Corner.Position.allCases.map { position in
        Corner(orientation: .correct, solvedPosition: position)
    }


    /// The facelets the corresponds to a solved cube.
    ///
    /// The array contains 54 facelets in sequential batches of 9 equivalent facelets in the order up, down,
    /// right, left, front, back.
    public static let solvedFacelets: [Facelet] = Facelet.allCases.flatMap { facelet in
        Array(repeating: facelet, count: 9)
    }

    /// The cube in the solved state.
    public static let solvedCube: Cube = Cube(edges: Cube.solvedEdges, corners: Cube.solvedCorners)
}

extension Cube {
    public var areEdgesOriented: Bool {
        return edges.map { $0.orientation } == Cube.solvedEdges.map({ $0.orientation })
    }

    public var areEdgesPermuted: Bool {
        return edges.map { $0.solvedPosition } == Cube.solvedEdges.map({ $0.solvedPosition })
    }

    public var areEdgesSolved: Bool {
        return edges == Cube.solvedEdges
    }

    public var areCornersOriented: Bool {
        return corners.map { $0.orientation } == Cube.solvedCorners.map({ $0.orientation })
    }

    public var areCornersPermuted: Bool {
        return corners.map { $0.solvedPosition } == Cube.solvedCorners.map({ $0.solvedPosition })
    }

    public var areCornersSolved: Bool {
        return corners == Cube.solvedCorners
    }
}
