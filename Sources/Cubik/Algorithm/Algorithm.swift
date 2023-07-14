/// A sequence of turns.
///
/// An algorithm is a sequence of moves that can be applied to a cube. Algorithms are used to scramble and
/// solve cubes. Many cube solution methods utilize algorithms, such as Fridrich's method with 78 algorithms
/// to solve the last layer.
///
/// ```swift
/// var cube: Cube = .solvedCube
/// let scramble = Algorithm.random()
///
/// cube.execute(scramble)
/// ```
public struct Algorithm {
    /// The turns of an algorithm.
    ///
    /// An algorithm is a sequence of turns, and this array represents that sequence. The turns array can be
    /// mutated and changed.
    public var turns: [Turn]

    /// Initialize an algorithm from an array of turns.
    ///
    /// - Parameters:
    ///     - turn: The turns that represent an algorithm.
    @inlinable
    public init(_ turns: [Turn]) {
        self.turns = turns
    }
}
