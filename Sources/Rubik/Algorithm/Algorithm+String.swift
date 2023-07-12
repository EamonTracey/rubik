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

        self.init(turns)
    }
}

extension Algorithm {
    /// An algorithm in string notation.
    ///
    /// The string notation of an algorithm is a string of the turns separated by spaces.
    @inlinable
    public var stringNotation: String {
        return turns.map { $0.stringNotation }.joined(separator: " ")
    }
}
