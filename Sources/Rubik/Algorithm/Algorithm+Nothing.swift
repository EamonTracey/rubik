extension Algorithm {
    /// The algorithm with no turns.
    ///
    /// The nothing algorithm has no turns, so executing it on a cube will have no effect.
    ///
    /// ```swift
    /// var cube: cube = .solvedCube
    /// cube.execute(.nothing)
    ///
    /// // The solved cube remains solved after the nothing algorithm.
    /// assert(cube == .solvedCube)
    /// ```
    public static let nothing = Algorithm([])
}
