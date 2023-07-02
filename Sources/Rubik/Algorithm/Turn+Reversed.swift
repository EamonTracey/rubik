extension Turn {
    @inlinable
    public var reversed: Turn {
        switch self {
        case .up(.clockwise):           return .up(.counterclockwise)
        case .up(.counterclockwise):    return .up(.clockwise)
        case .down(.clockwise):         return .down(.counterclockwise)
        case .down(.counterclockwise):  return .down(.clockwise)
        case .right(.clockwise):        return .right(.counterclockwise)
        case .right(.counterclockwise): return .right(.clockwise)
        case .left(.clockwise):         return .left(.counterclockwise)
        case .left(.counterclockwise):  return .left(.clockwise)
        case .front(.clockwise):        return .front(.counterclockwise)
        case .front(.counterclockwise): return .front(.clockwise)
        case .back(.clockwise):         return .back(.counterclockwise)
        case .back(.counterclockwise):  return .back(.clockwise)
        default:                        return self
        }
    }
}
