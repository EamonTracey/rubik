enum TurnDegree: UInt8 {
    /*
     * Each layer can be turned in one of three ways: clockwise,
     * half, or counterclockwise. Note that a clockwise half turn
     * is equivalent to a counterclockwise half turn.
     */
    
    case clockwise = 1
    case half = 2
    case counterclockwise = 3
}
