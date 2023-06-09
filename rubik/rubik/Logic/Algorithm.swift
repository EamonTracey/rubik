struct Algorithm {
    /*
     * An algorithm is a sequence of turns.
     */
    
    let turns: [Turn]
}

extension Algorithm {
    init?(_ algorithm: String) {
        /*
         * Initialize an algorithm using string notation.
         */
        
        var turns: [Turn] = []
        for word in algorithm.split(separator: " ") {
            if let turn = Turn(rawValue: word) {
                turns.append(turn)
            } else {
                return nil
            }
        }
        
        self.turns = turns
    }
    
    var length: Int {
        return self.turns.count
    }
}
