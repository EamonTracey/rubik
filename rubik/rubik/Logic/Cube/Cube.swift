struct Cube: Equatable {
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
    
    var edgeOrientation: [EdgeOrientation] {
        return self.edges.map { $0.orientation }
    }
    
    var cornerOrientation: [CornerOrientation] {
        return self.corners.map { $0.orientation }
    }
    
    var edgePermutation: [EdgePosition] {
        return self.edges.map { $0.solvedPosition }
    }
    
    var cornerPermutation: [CornerPosition] {
        return self.corners.map { $0.solvedPosition }
    }
}
