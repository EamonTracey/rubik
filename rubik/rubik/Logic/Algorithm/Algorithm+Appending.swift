extension Algorithm {
    func appending(_ turn: Turn) -> Algorithm {
        /*
         * Return algorithm with the specified turn appended.
         */
        
        return Algorithm(turns: self.turns + [turn])
    }
}

extension Algorithm {
    func appending(contentsOf algorithm: Algorithm) -> Algorithm {
        /*
         * Return algorithm with all the turns of specified algorithm appended.
         */
        
        return Algorithm(turns: self.turns + algorithm.turns)
    }
}
