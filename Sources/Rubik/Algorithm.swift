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
        return self.turns.map { turn in
            turn.stringNotation
        }.joined(separator: " ")
    }
}


extension Algorithm {
    @inlinable
    public mutating func append(_ turn: Turn) {
        self.turns.append(turn)
    }
}

extension Algorithm {
    @inlinable
    public var reversed: Algorithm {
        return Algorithm(turns: self.turns.reversed().map({ turn in
            turn.reversed
        }))
    }
}
