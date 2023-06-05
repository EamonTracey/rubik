enum EdgePosition: UInt8, CaseIterable {
    /*
     * There are 12 edge positions.
     */
    
    case upRight = 0
    case upLeft = 1
    case upFront = 2
    case upBack = 3
    case downRight = 4
    case downLeft = 5
    case downFront = 6
    case downBack = 7
    case rightFront = 8
    case rightBack = 9
    case leftFront = 10
    case leftBack = 11
}

enum CornerPosition: UInt8, CaseIterable {
    /*
     * There are 8 corner positions.
     */
    
    case upRightFront = 0
    case upRightBack = 1
    case upLeftFront = 2
    case upLeftBack = 3
    case downRightFront = 4
    case downRightBack = 5
    case downLeftFront = 6
    case downLeftBack = 7
}
