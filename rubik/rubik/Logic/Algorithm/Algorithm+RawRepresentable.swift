extension Algorithm: RawRepresentable {
    init?(rawValue: String) {
        /*
         * Initialize an algorithm using string notation.
         */
        
        var turns: [Turn] = []
        for word in rawValue.split(separator: " ") {
            if let turn = Turn(rawValue: word) {
                turns.append(turn)
            } else {
                return nil
            }
        }
        
        self.turns = turns
    }
    
    var rawValue: String {
        /*
         * Return the string notation of the algorithm.
         */
        
        return self.turns.map { $0.rawValue }.joined(separator: " ")
    }
}

extension Algorithm {
    init?(_ algorithm: String) {
        self.init(rawValue: algorithm)
    }
}
