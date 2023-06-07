enum Turn {
    /*
     * The cube has 6 outer layers which can be turned.
     */
    
    case up(TurnDegree)
    case down(TurnDegree)
    case right(TurnDegree)
    case left(TurnDegree)
    case front(TurnDegree)
    case back(TurnDegree)
}

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
