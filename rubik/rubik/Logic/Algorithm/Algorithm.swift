struct Algorithm: Equatable {
    /*
     * An algorithm is a sequence of turns.
     */
    
    let turns: [Turn]
    
    static var nothing = Algorithm(turns: [])
    
    var length: Int {
        return self.turns.count
    }
}
