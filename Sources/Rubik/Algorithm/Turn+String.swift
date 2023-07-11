extension Turn {
    @inlinable
    public init?(_ stringNotation: some StringProtocol) {
        switch stringNotation {
        case "U":  self = .up(.clockwise)
        case "U2": self = .up(.half)
        case "U'": self = .up(.counterclockwise)
        case "D":  self = .down(.clockwise)
        case "D2": self = .down(.half)
        case "D'": self = .down(.counterclockwise)
        case "R":  self = .right(.clockwise)
        case "R2": self = .right(.half)
        case "R'": self = .right(.counterclockwise)
        case "L":  self = .left(.clockwise)
        case "L2": self = .left(.half)
        case "L'": self = .left(.counterclockwise)
        case "F":  self = .front(.clockwise)
        case "F2": self = .front(.half)
        case "F'": self = .front(.counterclockwise)
        case "B":  self = .back(.clockwise)
        case "B2": self = .back(.half)
        case "B'": self = .back(.counterclockwise)
        default:   return nil
        }
    }

    @inlinable
    public var stringNotation: String {
        switch self {
        case .up(.clockwise):           return "U"
        case .up(.half):                return "U2"
        case .up(.counterclockwise):    return "U'"
        case .down(.clockwise):         return "D"
        case .down(.half):              return "D2"
        case .down(.counterclockwise):  return "D'"
        case .right(.clockwise):        return "R"
        case .right(.half):             return "R2"
        case .right(.counterclockwise): return "R'"
        case .left(.clockwise):         return "L"
        case .left(.half):              return "L2"
        case .left(.counterclockwise):  return "L'"
        case .front(.clockwise):        return "F"
        case .front(.half):             return "F2"
        case .front(.counterclockwise): return "F'"
        case .back(.clockwise):         return "B"
        case .back(.half):              return "B2"
        case .back(.counterclockwise):  return "B'"
        }
    }
}
