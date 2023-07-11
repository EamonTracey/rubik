/// A sequence of turns.
///
/// An algorithm is a sequence of moves that can be applied to a cube. Algorithms are used to scramble and
/// solve cubes. Many cube solution methods utilize algorithms, such as Fridrich's method with 78 algorithms
/// to solve the last layer.
public struct Algorithm {
    public var turns: [Turn]

    public init(_ turns: [Turn]) {
        self.turns = turns
    }
}
