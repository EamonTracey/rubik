/// Add algorithms.
///
/// The result of adding two algorithms is equivalent to an algorithm initialized from the addition of each
/// algorithm's turns.
///
/// ```swift
/// let algorithmA = Algorithm("R U R' U')!
/// let algorithmB = Algorithm("R' F R F')!
///
/// // R U R' U' R' F R F'
/// print(algorithmA + algorithmB)
/// ```
public func + (lhs: Algorithm, rhs: Algorithm) -> Algorithm {
    return Algorithm(lhs.turns + rhs.turns)
}
