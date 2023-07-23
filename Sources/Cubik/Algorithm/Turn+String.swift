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
        case "u":  self = .upWide(.clockwise)
        case "u2": self = .upWide(.half)
        case "u'": self = .upWide(.counterclockwise)
        case "d":  self = .downWide(.clockwise)
        case "d2": self = .downWide(.half)
        case "d'": self = .downWide(.counterclockwise)
        case "r":  self = .rightWide(.clockwise)
        case "r2": self = .rightWide(.half)
        case "r'": self = .rightWide(.counterclockwise)
        case "l":  self = .leftWide(.clockwise)
        case "l2": self = .leftWide(.half)
        case "l'": self = .leftWide(.counterclockwise)
        case "f":  self = .frontWide(.clockwise)
        case "f2": self = .frontWide(.half)
        case "f'": self = .frontWide(.counterclockwise)
        case "b":  self = .backWide(.clockwise)
        case "b2": self = .backWide(.half)
        case "b'": self = .backWide(.counterclockwise)
        case "y":  self = .yAxis(.clockwise)
        case "y2": self = .yAxis(.half)
        case "y'": self = .yAxis(.counterclockwise)
        case "x":  self = .xAxis(.clockwise)
        case "x2": self = .xAxis(.half)
        case "x'": self = .xAxis(.counterclockwise)
        case "z":  self = .zAxis(.clockwise)
        case "z2": self = .zAxis(.half)
        case "z'": self = .zAxis(.counterclockwise)
        default:   return nil
        }
    }

    /// A turn in string notation.
    @inlinable
    public var stringNotation: String {
        switch self {
        case .up(.clockwise):               return "U"
        case .up(.half):                    return "U2"
        case .up(.counterclockwise):        return "U'"
        case .down(.clockwise):             return "D"
        case .down(.half):                  return "D2"
        case .down(.counterclockwise):      return "D'"
        case .right(.clockwise):            return "R"
        case .right(.half):                 return "R2"
        case .right(.counterclockwise):     return "R'"
        case .left(.clockwise):             return "L"
        case .left(.half):                  return "L2"
        case .left(.counterclockwise):      return "L'"
        case .front(.clockwise):            return "F"
        case .front(.half):                 return "F2"
        case .front(.counterclockwise):     return "F'"
        case .back(.clockwise):             return "B"
        case .back(.half):                  return "B2"
        case .back(.counterclockwise):      return "B'"
        case .standing(.clockwise):         return "S"
        case .standing(.half):              return "S2"
        case .standing(.counterclockwise):  return "S'"
        case .middle(.clockwise):           return "M"
        case .middle(.half):                return "M2"
        case .middle(.counterclockwise):    return "M'"
        case .equator(.clockwise):          return "E"
        case .equator(.half):               return "E2"
        case .equator(.counterclockwise):   return "E'"
        case .upWide(.clockwise):           return "u"
        case .upWide(.half):                return "u2"
        case .upWide(.counterclockwise):    return "u'"
        case .downWide(.clockwise):         return "d"
        case .downWide(.half):              return "d2"
        case .downWide(.counterclockwise):  return "d'"
        case .rightWide(.clockwise):        return "r"
        case .rightWide(.half):             return "r2"
        case .rightWide(.counterclockwise): return "r'"
        case .leftWide(.clockwise):         return "l"
        case .leftWide(.half):              return "l2"
        case .leftWide(.counterclockwise):  return "l'"
        case .frontWide(.clockwise):        return "f"
        case .frontWide(.half):             return "f2"
        case .frontWide(.counterclockwise): return "f'"
        case .backWide(.clockwise):         return "b"
        case .backWide(.half):              return "b2"
        case .backWide(.counterclockwise):  return "b'"
        case .yAxis(.clockwise):            return "y"
        case .yAxis(.half):                 return "y2"
        case .yAxis(.counterclockwise):     return "y'"
        case .xAxis(.clockwise):            return "x"
        case .xAxis(.half):                 return "x2"
        case .xAxis(.counterclockwise):     return "x'"
        case .zAxis(.clockwise):            return "z"
        case .zAxis(.half):                 return "z2"
        case .zAxis(.counterclockwise):     return "z'"
        }
    }
}
