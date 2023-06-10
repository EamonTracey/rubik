struct Algorithm: Equatable {
    /*
     * An algorithm is a sequence of turns.
     */
    
    let turns: [Turn]
    
    var length: Int {
        return self.turns.count
    }
}
