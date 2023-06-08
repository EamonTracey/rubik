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
