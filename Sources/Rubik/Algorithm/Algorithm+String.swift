extension Algorithm {
    @inlinable
    public init?(_ stringNotation: String) {
        var turns: [Turn] = []
        for word in stringNotation.split(separator: " ") {
            if let turn = Turn(String(word)) {
                turns.append(turn)
            } else {
                return nil
            }
        }

        self.init(turns)
    }
}

extension Algorithm {
    public var stringNotation: String {
        return turns.map { $0.stringNotation }.joined(separator: " ")
    }
}
