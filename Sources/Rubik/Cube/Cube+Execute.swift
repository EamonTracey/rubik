extension Cube {
    /// Apply an algorithm to a cube.
    ///
    /// - Parameters:
    ///     - algorithm: The algorithm to be executed.
    ///     - repeats: The number of times to repeat the algorithm. The default is 1.
    ///
    /// Instead of turning layers of the cube individually, use an algorithm. For example, perform the sexy
    /// move:
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    /// cube.execute(Algorithm("R U R' U'")!)
    /// ```
    ///
    /// The function also accepts a `repeats` parameter to specify how many times to apply the
    /// algorithm. The default value is 1. For example, perform the sexy move 6 times:
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    /// cube.execute(Algorithm("R U R' U'")!, repeats: 6)
    ///
    /// // Six repetitions returns the cube to its initial state.
    /// assert(cube == .solvedCube)
    /// ```
    @inlinable
    public mutating func execute(_ algorithm: Algorithm, repeats: Int = 1) {
        for _ in 0..<repeats {
            for turn in algorithm.turns {
                self.turn(turn)
            }
        }
    }
}
