struct Cube {
    /*
     * The state of a cube is defined by the orientation and permutation of
     * its 12 edges and the orientation and permutation of its 8 corners.
     *
     * In each array below, the index of the array corresponds to a fixed
     * position on the cube. The correspondence is defined below.
     *
     * Edges:
     *   - 0:  UR (up right)
     *   - 1:  UL (up left)
     *   - 2:  UF (up front)
     *   - 3:  UB (up back)
     *   - 4:  DR (down right)
     *   - 5:  DL (down left)
     *   - 6:  DF (down front)
     *   - 7:  DB (down back)
     *   - 8:  RF (right front)
     *   - 9:  RB (right back)
     *   - 10: LF (left front)
     *   - 11: LB (left back)
     *
     * Corners:
     *   - 0: URF (up right front)
     *   - 1: URB (up right back)
     *   - 2: ULF (up left front)
     *   - 3: ULB (up left back)
     *   - 4: DRF (down right front)
     *   - 5: DRB (down right back)
     *   - 6: DLF (down left front)
     *   - 7: DLB (down left back)
     *
     * The notation to designate positions has the hierarchy:
     *   - U > D > R > L > F > B
     *   - up > down > right > left > front > back
     */
    
    /*
     * Edge orientation is relative. Two people, using different frames of
     * reference, may disagree whether the same edge is oriented. The definition
     * of edge orientation is as follows: an edge position is oriented if and
     * only if the cubelet in that position can be turned into its solved state
     * using only U, D, R, and L turns. This means that F and B toggle the orientation
     * of the edges on the respective layer (note that F2 and B2 preserve edge
     * orientation).
     */
    var edgeOrientation: [UInt8]
    
    /*
     * Edge permutation refers to edge cubelets' positions on the cube.
     */
    var edgePermutation: [UInt8]
    
    /*
     * Similar to edge orientation, corner orientation is relative. The definition
     * of corner orientation is as follows: a corner position is oriented if and only
     * if the cubelet in that position can be turned into its solved state using only
     * U, D, R2, and L2 moves. This means that R, L, F, and B change the orientation
     * of the corners on the respective layer (Note that R2, L2, F2, and B2 preserve
     * corner orientation).
     */
    var cornerOrientation: [UInt8]
    
    /*
     * Corner permutation refers to corner cubelets' positions on the cube.
     */
    var cornerPermutation: [UInt8]
}

extension Cube {
    // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    static let solvedEdgeOrientation = Array(repeating: 0, count: 12) as [UInt8]
    
    // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    static let solvedEdgePermutation = Array(0...11) as [UInt8]
    
    // [0, 0, 0, 0, 0, 0, 0, 0]
    static let solvedCornerOrientation = Array(repeating: 0, count: 8) as [UInt8]
    
    // [0, 1, 2, 3, 4, 5, 6, 7]
    static let solvedCornerPermutation = Array(0...7) as [UInt8]

    static let solvedCube = Cube(
        edgeOrientation: solvedEdgeOrientation,
        edgePermutation: solvedEdgePermutation,
        cornerOrientation: solvedCornerOrientation,
        cornerPermutation: solvedCornerPermutation
    )
}
