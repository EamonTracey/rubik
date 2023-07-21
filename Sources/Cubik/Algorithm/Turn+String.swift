extension Turn {
    /// Initialize a turn from a string.
    ///
    /// - Parameters:
    ///     - stringNotation: The string notation of a turn.
    ///
    /// - Returns: A turn if the string contains valid notation, otherwise nil.
    ///
    /// A turn can be "U", "D", "R", "L", "F", or "B". Appending an apostrophe ("'") to the turn indicates a
    /// counterclockwise turn. Appending "2" to the turn indicates a half turn.
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
        case "S":  self = .standing(.clockwise)
        case "S2": self = .standing(.half)
        case "S'": self = .standing(.counterclockwise)
        case "M":  self = .middle(.clockwise)
        case "M2": self = .middle(.half)
        case "M'": self = .middle(.counterclockwise)
        case "E":  self = .equator(.clockwise)
        case "E2": self = .equator(.half)
        case "E'": self = .equator(.counterclockwise)
        case "y":  self = .yaxis(.clockwise)
        case "y2": self = .yaxis(.half)
        case "y'": self = .yaxis(.counterclockwise)
        case "x":  self = .xaxis(.clockwise)
        case "x2": self = .xaxis(.half)
        case "x'": self = .xaxis(.counterclockwise)
        case "z":  self = .zaxis(.clockwise)
        case "z2": self = .zaxis(.half)
        case "z'": self = .zaxis(.counterclockwise)
        default:   return nil
        }
    }

    /// A turn in string notation.
    @inlinable
    public var stringNotation: String {
        switch self {
        case .up(.clockwise):              return "U"
        case .up(.half):                   return "U2"
        case .up(.counterclockwise):       return "U'"
        case .down(.clockwise):            return "D"
        case .down(.half):                 return "D2"
        case .down(.counterclockwise):     return "D'"
        case .right(.clockwise):           return "R"
        case .right(.half):                return "R2"
        case .right(.counterclockwise):    return "R'"
        case .left(.clockwise):            return "L"
        case .left(.half):                 return "L2"
        case .left(.counterclockwise):     return "L'"
        case .front(.clockwise):           return "F"
        case .front(.half):                return "F2"
        case .front(.counterclockwise):    return "F'"
        case .back(.clockwise):            return "B"
        case .back(.half):                 return "B2"
        case .back(.counterclockwise):     return "B'"
        case .standing(.clockwise):        return "S"
        case .standing(.half):             return "S2"
        case .standing(.counterclockwise): return "S'"
        case .middle(.clockwise):          return "M"
        case .middle(.half):               return "M2"
        case .middle(.counterclockwise):   return "M'"
        case .equator(.clockwise):         return "E"
        case .equator(.half):              return "E2"
        case .equator(.counterclockwise):  return "E'"
        case .yaxis(.clockwise):           return "y"
        case .yaxis(.half):                return "y2"
        case .yaxis(.counterclockwise):    return "y'"
        case .xaxis(.clockwise):           return "x"
        case .xaxis(.half):                return "x2"
        case .xaxis(.counterclockwise):    return "x'"
        case .zaxis(.clockwise):           return "z"
        case .zaxis(.half):                return "z2"
        case .zaxis(.counterclockwise):    return "z'"
        }
    }
}
