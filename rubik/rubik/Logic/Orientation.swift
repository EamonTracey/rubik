enum EdgeOrientation: UInt8 {
    /*
     * Edge orientation is relative. Two people, using different frames of
     * reference, may disagree whether the same edge is oriented. The definition
     * of edge orientation is as follows: an edge position is oriented if and
     * only if the cubelet in that position can be turned into its solved state
     * using only U, D, R, and L turns. This means that F and B toggle the orientation
     * of the edges on the respective layer (note that F2 and B2 preserve edge
     * orientation).
     */
    
    /*
     * Edges may be flipped in 1 of 2 ways: correct and flipped.
     */
    case correct = 0
    case flipped = 1
}

enum CornerOrientation: UInt8 {
    /*
     * Similar to edge orientation, corner orientation is relative. The definition
     * of corner orientation is as follows: a corner position is oriented if and only
     * if the cubelet in that position can be turned into its solved state using only
     * U, D, R2, and L2 turns. This means that R, L, F, and B change the orientation
     * of the corners on the respective layer (Note that R2, L2, F2, and B2 preserve
     * corner orientation).
     */
    
     /*
     * Corners may be twisted in 1 of 3 ways: correct, clockwise,
     * and counterclockwise.
     */
    case correct = 0
    case clockwise = 1
    case counterClockwise = 2
}
