extension Cube {
    /*
     * Apply an algorithm to a cube.
     */
    
    mutating func execute(algorithm: Algorithm) {
        for turn in algorithm.turns {
            self.turn(turn)
        }
    }
}
