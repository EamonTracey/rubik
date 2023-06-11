extension Cube {
    mutating func execute(_ algorithm: Algorithm, repeats: UInt = 1) {
        /*
         * Apply an algorithm to a cube.
         */
        
        for _ in 0..<repeats {
            for turn in algorithm.turns {
                self.turn(turn)
            }
        }
    }
}
