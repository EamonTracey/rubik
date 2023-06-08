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
