extension Turn {
    /// The reverse of a turn.
    ///
    /// Applying a turn and its reverse in succession will have no net effect on a cube.
    @inlinable
    public var reversed: Turn {
        switch self {
        case .up(.clockwise):              return .up(.counterclockwise)
        case .up(.counterclockwise):       return .up(.clockwise)
        case .down(.clockwise):            return .down(.counterclockwise)
        case .down(.counterclockwise):     return .down(.clockwise)
        case .right(.clockwise):           return .right(.counterclockwise)
        case .right(.counterclockwise):    return .right(.clockwise)
        case .left(.clockwise):            return .left(.counterclockwise)
        case .left(.counterclockwise):     return .left(.clockwise)
        case .front(.clockwise):           return .front(.counterclockwise)
        case .front(.counterclockwise):    return .front(.clockwise)
        case .back(.clockwise):            return .back(.counterclockwise)
        case .back(.counterclockwise):     return .back(.clockwise)
        case .standing(.clockwise):        return .standing(.counterclockwise)
        case .standing(.counterclockwise): return .standing(.clockwise)
        case .middle(.clockwise):          return .middle(.counterclockwise)
        case .middle(.counterclockwise):   return .middle(.clockwise)
        case .equator(.clockwise):         return .equator(.counterclockwise)
        case .equator(.counterclockwise):  return .equator(.clockwise)
        case .yAxis(.clockwise):           return .yAxis(.counterclockwise)
        case .yAxis(.counterclockwise):    return .yAxis(.clockwise)
        case .xAxis(.clockwise):           return .xAxis(.counterclockwise)
        case .xAxis(.counterclockwise):    return .xAxis(.clockwise)
        case .zAxis(.clockwise):           return .zAxis(.counterclockwise)
        case .zAxis(.counterclockwise):    return .zAxis(.clockwise)
        default:                           return self
        }
    }
}
