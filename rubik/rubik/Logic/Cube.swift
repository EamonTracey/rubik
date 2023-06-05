struct Cube {
    /*
     * The state of a cube is defined by the orientation and permutation of
     * its 12 edges and the orientation and permutation of its 8 corners.
     *
     * In the arrays below, the index of each cubelet corresponds to its
     * position in the cube. Therefore, the order of the arrays defines
     * the cube's permutation. A cube with the correct permutation
     * will have the edges and corners arrays sorted by each cubelet's
     * solved position (the indices match the solved positions).
     */
    
    var edges: [Edge]
    var corners: [Corner]
}

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


extension Cube {
    var areEdgesOrientable: Bool {
        /*
         * Edge orientation changes by 4 edges at a time. A quarter turn of the F or B
         * layer toggles the orientation of the 4 edges on the F or B layer, respectively.
         * Note that it is possible for exactly 2 edges to be flipped (consider flipping
         * 4 edges and then flipping 3 of the same 4 edges plus an unflipped edge). Therefore,
         * in order for edges to be orientable, there must be an even number of flipped edges.
         */
        
        return self.edges.map { $0.orientation.rawValue }.reduce(0, ^) == 0
    }
    
    var areCornersOrientable: Bool {
        /*
         * Corner orientation changes by 4 corners at a time. A quarter turn of the
         * R, L, F, or B layer twists 2 corners clockwise and 2 corners counterclockwise
         * on the R, L, F, or B layer, respectively. Note that it is possible for exactly
         * 2 corners to be flipped with the sum of their orientations equaling 3 (consider
         * twisting 2 corners clockwise and 2 corners counterclockwise and then twist the
         * first 2 corners counterclockwise, 1 of the other corners clockwise, and an
         * untwisted corner clockwise). Therefore, in order for corners to be orientable,
         * the sum of the orientations of corners must be divisible by 3.
         */
        
        return self.corners.map { $0.orientation.rawValue }.reduce(0, +) % 3 == 0
    }
    
    // TODO: Implement
    var isPermutable: Bool {
        return true
    }
}
