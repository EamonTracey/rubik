extension Algorithm {
    var reversed: Algorithm {
        /*
         * The reverse of an algorithm is the sequence of reversed
         * turns in reversed order. Executing an algorithm and its
         * reverse will return the cube to its original state.
         */
        
        return Algorithm(turns: self.turns.reversed().map { $0.reversed })
    }
}
