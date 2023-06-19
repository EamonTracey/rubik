public struct Algorithm {
    public var turns: [Turn]
    
    @inlinable
    public init(turns: [Turn]) {
        self.turns = turns
    }
}

public extension Algorithm {
    static let nothing = Algorithm(turns: [])
}

public extension Algorithm {
    @inlinable
    init?(_ stringNotation: some StringProtocol) {
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

public extension Algorithm {
    @inlinable
    var stringNotation: String {
        return self.turns.map { turn in
            turn.stringNotation
        }.joined(separator: " ")
    }
}


public extension Algorithm {
    @inlinable
    mutating func append(_ turn: Turn) {
        self.turns.append(turn)
    }
}

public extension Algorithm {
    @inlinable
    var reversed: Algorithm {
        return Algorithm(turns: self.turns.reversed().map({ turn in
            turn.reversed
        }))
    }
}
