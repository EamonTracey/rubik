extension Cube {
    /*
     * Apply an algorithm to a cube.
     */
    
    mutating func execute(_ algorithm: Algorithm, repeats: UInt = 1) {
        for _ in 0..<repeats {
            for turn in algorithm.turns {
                self.turn(turn)
            }
        }
    }
}
