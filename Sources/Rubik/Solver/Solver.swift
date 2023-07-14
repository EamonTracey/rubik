/// A cube solver that can find an algorithmic solution to a cube.
///
/// The solver currently supports only one method to solve the cube. This will be expanded.
///
/// - Important: Some methods require large lookup tables for the solving process. Therefore, it is best
/// to use only one solver instance ever. One may explicitly load and unload these tables using
/// ``loadTables(for:)`` and ``unloadTables(for:)``.
public class Solver {
    @usableFromInline
    let thistlethwaite = Thistlethwaite()

    /// Initialize a solver.
    @inlinable
    public init() { }
}
