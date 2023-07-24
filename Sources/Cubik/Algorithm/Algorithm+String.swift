extension Algorithm {
    /// Initialize an algorithm from a string.
    ///
    /// - Parameters:
    ///     - stringNotation: The string notation of an algorithm.
    ///
    /// - Returns: An algorithm if the string contains valid notation, otherwise nil.
    ///
    /// String notation is the preferred representation of algorithms. Valid strings are individual turns
    /// delimited by strings. A turn can be "U", "D", "R", "L", "F", or "B". Appending an apostrophe ("'") to the
    /// turn indicates a counterclockwise turn. Appending "2" to the turn indicates a half turn.
    ///
    /// ```swift
    /// // Initializes an algorithm representing the A perm.
    /// // This is safe to force unwrap.
    /// var aPerm = Algorithm("R' F R' B2 R F' R' B2 R2")!
    ///
    /// // Returns nil because "M" is not a valid turn.
    /// var notAllowed = Algorithm("M2 U M2 U2 M2 U M2")
    /// ```
    @inlinable
    public init?(_ stringNotation: some StringProtocol) {
        var turns: [Turn] = []
        for word in stringNotation.split(separator: " ") {
            if let turn = Turn(word) {
                turns.append(turn)
            } else {
                return nil
            }
        }

        self.turns = turns
    }

    /// An algorithm in string notation.
    ///
    /// The string notation of an algorithm is a string of the turns separated by spaces.
    @inlinable
    public var stringNotation: String {
        return turns.map { $0.stringNotation }.joined(separator: " ")
    }
}

extension Algorithm: CustomStringConvertible {
    /// The string description of an algorithm.
    ///
    /// This is equivalent to the algorithm's string notation.
    public var description: String {
        return stringNotation
    }
}

extension Algorithm {
    @_spi(Tables)
    @inlinable
    public init?(compressedString: some StringProtocol) {
        var turns: [Turn] = []
        for character in compressedString {
            switch character {
            case "0": turns.append(.up(.clockwise))
            case "1": turns.append(.up(.half))
            case "2": turns.append(.up(.counterclockwise))
            case "3": turns.append(.down(.clockwise))
            case "4": turns.append(.down(.half))
            case "5": turns.append(.down(.counterclockwise))
            case "6": turns.append(.right(.clockwise))
            case "7": turns.append(.right(.half))
            case "8": turns.append(.right(.counterclockwise))
            case "9": turns.append(.left(.clockwise))
            case "a": turns.append(.left(.half))
            case "b": turns.append(.left(.counterclockwise))
            case "c": turns.append(.front(.clockwise))
            case "d": turns.append(.front(.half))
            case "e": turns.append(.front(.counterclockwise))
            case "f": turns.append(.back(.clockwise))
            case "g": turns.append(.back(.half))
            case "h": turns.append(.back(.counterclockwise))
            default:  fatalError("Invalid compressed algorithm encoding.")
            }
        }

        self.turns = turns
    }

    @_spi(Tables)
    @inlinable
    public var compressedString: String {
        var string = ""
        for turn in turns {
            switch turn {
            case .up(.clockwise):           string += "0"
            case .up(.half):                string += "1"
            case .up(.counterclockwise):    string += "2"
            case .down(.clockwise):         string += "3"
            case .down(.half):              string += "4"
            case .down(.counterclockwise):  string += "5"
            case .right(.clockwise):        string += "6"
            case .right(.half):             string += "7"
            case .right(.counterclockwise): string += "8"
            case .left(.clockwise):         string += "9"
            case .left(.half):              string += "a"
            case .left(.counterclockwise):  string += "b"
            case .front(.clockwise):        string += "c"
            case .front(.half):             string += "d"
            case .front(.counterclockwise): string += "e"
            case .back(.clockwise):         string += "f"
            case .back(.half):              string += "g"
            case .back(.counterclockwise):  string += "h"
            default: fatalError("Strictly outer turns can be compressed.")
            }
        }

        return string
    }
}
