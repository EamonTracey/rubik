public struct Algorithm {
    public var turns: [Turn]

    @inlinable
    public init(turns: [Turn]) {
        self.turns = turns
    }
}

extension Algorithm {
    public static let nothing = Algorithm(turns: [])
}

extension Algorithm {
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

        self.init(turns: turns)
    }
}

extension Algorithm {
    @inlinable
    public var stringNotation: String {
        return turns.map { $0.stringNotation }.joined(separator: " ")
    }
}

extension Algorithm {
    @inlinable
    public mutating func append(_ turn: Turn) {
        turns.append(turn)
    }
}

extension Algorithm {
    @inlinable
    public var reversed: Algorithm {
        return Algorithm(turns: turns.reversed().map({ $0.reversed }))
    }
}
