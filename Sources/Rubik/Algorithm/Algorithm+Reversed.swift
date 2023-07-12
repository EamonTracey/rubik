extension Algorithm {
    /// The reverse of an algorithm.
    ///
    /// This property computes the reverse of each turn of the algorithm and returns them in reversed
    /// order. Note that this is not equivalent to an algorithm with the same turns in reverse order.
    /// Executing an algorithm and its reverse in succession will have no net effect on a cube.
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    ///
    /// var sledge = Algorithm("R' F R F'")!
    ///
    /// // F R' F' R.
    /// var reverseSledge = sledge.reversed
    ///
    /// cube.execute(sledge)
    /// cube.execute(reverseSledge)
    ///
    /// // Cube remains solved after the sledgehammer and its reverse.
    /// assert(cube == .solvedCube)
    /// ```
    @inlinable
    public var reversed: Algorithm {
        return Algorithm(turns.reversed().map({ $0.reversed }))
    }
}
