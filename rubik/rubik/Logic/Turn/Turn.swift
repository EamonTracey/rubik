enum Turn: Equatable, Hashable {
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
