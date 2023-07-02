public enum Turn: Equatable, Hashable {
    case up(Degree)
    case down(Degree)
    case right(Degree)
    case left(Degree)
    case front(Degree)
    case back(Degree)
}

extension Turn {
    public enum Degree: Int {
        case clockwise = 1, half, counterclockwise
    }
}
