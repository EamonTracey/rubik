public class Solver {
    @inlinable
    public func solve(_ cube: Cube, using method: SolveMethod) -> Algorithm {
        switch method {
        case .thistlethwaite:
            return self.solveThistlethwaite(cube)
        }
    }
}
